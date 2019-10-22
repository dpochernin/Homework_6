Delivered-To: si.test.gmai@gmail.com
Received: by 2002:ab0:3246:0:0:0:0:0 with SMTP id r6csp5159915uan;
        Tue, 25 Jun 2019 07:12:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw50C3uYO9Vy18znJSU2fGqL/DhIMVKgdzvQA2MEUONhU7rcYAd76pqrlw65We2+0lyHqPR
X-Received: by 2002:a2e:8155:: with SMTP id t21mr32759602ljg.80.1561471959632;
        Tue, 25 Jun 2019 07:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561471959; cv=none;
        d=google.com; s=arc-20160816;
        b=e9b5+nGcKpwv6dfEM9PSR0Z1d84qSC73F/NwyCeMOAylAEMxZgB0dtadu9xPd85/Uf
         PmnVrcV8EvEULQ6AeFUt7WU9+QhAVs8MkT/o8SDcp5fv4PUkHMx+AhB41ltyksi1t3AE
         wAPpahm06yIgM0Pick51Wzktaaa/IsQlxMux61mueERheKNYdehAIi1FjrlrvfzIoDSO
         NQ+t8FHuG5xT+aKTDVAgEdmeUESiVGT+u64WoFf2+k8jHIZGByN/Y6TgOxkBZ9iznIUL
         AB34cwgN3dJFyCDF2hM7vxEO64zi9yq4Ee3egy0e1oHdQ8B2OjQMTC3b6C9DV57Wb2+f
         hS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:mime-version:subject
         :in-reply-to:to:envelope-from:from:dkim-signature;
        bh=EvvfJAI2tbIrbuLqC9e+ABmciTY/nQEjS4BZpB8a5N4=;
        b=IVmAYfmVdAHrzlpBkZlokAlVtg3iKtlTS5ffVqrcf/KRONCE/mBYhGkVdgE53iUeZw
         dr38LwXpdlMib+Ah5IiDrDqYDuVI471xH6YwKN0XEYMTRx6TsoqgHidEk1xBZBddx5ke
         MfBI+EnLAW3meiNdUQSlrhjRo1NLmehT35sXvOR0/JgiC2UJuG5+6Mhw40QrynjfqdQI
         ARQztCX+GAwjbdznUjhm60jaqD98ysQ21jwAZEXJ0VeqDluDC2x3XSMy9AtonoTS9+zF
         5ESvBAtXIb34lxnymtAfdfwIoeW310hNl7UbvdxWsH3j3v9/+SHqxYOOxt5IC8hiHHp3
         1E6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yandex.ru header.s=mail header.b=h4qXL+d8;
       spf=pass (google.com: domain of si.test2017@yandex.ru designates 2a02:6b8:0:1a2d::601 as permitted sender) smtp.mailfrom=si.test2017@yandex.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex.ru
Return-Path: <si.test2017@yandex.ru>
Received: from forward101o.mail.yandex.net (forward101o.mail.yandex.net. [2a02:6b8:0:1a2d::601])
        by mx.google.com with ESMTPS id j6si14136316ljh.202.2019.06.25.07.12.39
        for <si.test.gmai@gmail.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 07:12:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of si.test2017@yandex.ru designates 2a02:6b8:0:1a2d::601 as permitted sender) client-ip=2a02:6b8:0:1a2d::601;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex.ru header.s=mail header.b=h4qXL+d8;
       spf=pass (google.com: domain of si.test2017@yandex.ru designates 2a02:6b8:0:1a2d::601 as permitted sender) smtp.mailfrom=si.test2017@yandex.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex.ru
Received: from mxback7g.mail.yandex.net (mxback7g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:168])
	by forward101o.mail.yandex.net (Yandex) with ESMTP id 3BC983C02184
	for <si.test.gmai@gmail.com>; Tue, 25 Jun 2019 17:12:39 +0300 (MSK)
Received: from localhost (localhost [::1])
	by mxback7g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ZLUoljAUZA-CccmkKRE;
	Tue, 25 Jun 2019 17:12:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1561471958;
	bh=EvvfJAI2tbIrbuLqC9e+ABmciTY/nQEjS4BZpB8a5N4=;
	h=Date:Message-Id:Subject:In-Reply-To:To:From;
	b=h4qXL+d8z2pajRhb9jSPxEhUHjMYJUiZYW5iQDyD2r1XuMp85zcYczkX30s84ni3D
	 5Fd4olmRVYxDzpOJ5oaEtbn/tbg8TFj44B3o924P1ClgflPfsItCGP80l49UXkTTe8
	 RpvEw+M4IpZxxryeLR4t5qoVwrerxmS//ZTrkB9g=
Authentication-Results: mxback7g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva4-0814df7d67c8.qloud-c.yandex.net with HTTP;
	Tue, 25 Jun 2019 17:12:38 +0300
From: =?utf-8?B?0KLQtdGB0YLQtdGAINCa0LjQsQ==?= <si.test2017@yandex.ru>
Envelope-From: si-test2017@yandex.by
To: =?utf-8?B?0KLQtdGB0YLQvtCy0YvQuSDQk9C80LDQudC7?= <si.test.gmai@gmail.com>
In-Reply-To: <1979251561471679@iva7-b6ed732000ae.qloud-c.yandex.net>
Subject: =?utf-8?B?RndkOiDRgtC10YHRgg==?=
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 25 Jun 2019 17:12:38 +0300
Message-Id: <17465681561471958@iva4-0814df7d67c8.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="utf-8"

PGRpdj48YnIgLz48L2Rpdj48ZGl2PjxiciAvPjwvZGl2PjxkaXY+LS0tLS0tLS0g0J/QtdGA0LXR
gdGL0LvQsNC10LzQvtC1INGB0L7QvtCx0YnQtdC90LjQtSAtLS0tLS0tLTwvZGl2PjxkaXY+MjUu
MDYuMjAxOSwgMTc6MDcsICLQotC10YHRgtC10YAg0JrQuNCxIiAmbHQ7c2kudGVzdDIwMTdAeWFu
ZGV4LnJ1Jmd0Ozo8L2Rpdj48ZGl2PjxiciAvPjwvZGl2PjxkaXYgY2xhc3M9IjQ5ZDMyMmZhMThm
YmQxNmJiMjA2ZjYxZjlhMmE0MGY3bm9ybWFsaXplIj48ZGl2PtGC0LXRgdGCPC9kaXY+DQo8L2Rp
dj48ZGl2PjxiciAvPjwvZGl2PjxkaXY+LS0tLS0tLS0g0JrQvtC90LXRhiDQv9C10YDQtdGB0YvQ
u9Cw0LXQvNC+0LPQviDRgdC+0L7QsdGJ0LXQvdC40Y8gLS0tLS0tLS08L2Rpdj4NCg==

