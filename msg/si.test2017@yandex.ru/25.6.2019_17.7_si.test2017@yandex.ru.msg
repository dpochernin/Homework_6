Delivered-To: sitestgmai@gmail.com
Received: by 2002:ab0:3246:0:0:0:0:0 with SMTP id r6csp5154364uan;
        Tue, 25 Jun 2019 07:08:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPXWZE83vzVA2rRPoKAzPbpB2aaYBQJQxIAGiuvlDQTXl18OwdVsG9vdNs0p3X9POBL+IA
X-Received: by 2002:ac2:47fa:: with SMTP id b26mr20860861lfp.82.1561471680326;
        Tue, 25 Jun 2019 07:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561471680; cv=none;
        d=google.com; s=arc-20160816;
        b=mgBqZSpt9Q4d266eN3Ku5ts1nqGfWr4zkToX3vRQS6tKYGtdzBOICEk5G4kTZlpngr
         J0jFbCsmtuXdna+chUmBRXZmx3WzLr0KrjHi5mfJHr5B1AKoe7VNAlw6Nn0GCb/Ov6JI
         2Agts8K4FrxUsz6wJFW09cR0fM+8JauVSX4B3ko1d2Ck7CczU/ccCC/bHsGhc8o5RRJK
         mOS4zkp5eVX9rGGTLqodnbkGE+GqVnr8l7raX06gPhUxppOpnwh5b5ijrMlN6mqi5uJP
         rR34wnPDc56gFDUmFLLEAFY+jti2wXYafCcMHw0VBNQOUFvv9uhIaQreWjQYZF1x/Ji/
         M9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:mime-version:subject:to
         :envelope-from:from:dkim-signature;
        bh=bIWz8Ilu+qMJ8Fi6U/52eJtqM7koBHkh8DIkVWR8WHI=;
        b=n4Vd9xbDv/PQgoaz9I0OEvV2TL0AQissFnw4NCrsIgQJlkDTMIxKUk1C28yqxI+abY
         QJq2O4IIUdRP4RbU2gppEtAfbuBnZ/3TDlvi5z5htZ81S/IpajjWPdPervSVBOJcem3n
         Rys+ogvf4iobezmAlO1TXBX/tFccLHiZaO041aSZhGpy1s8IDvu7fn0/Y5/x+NABuXeW
         K0NT7fcd6YqudbUsHnH4qo/+utpByoBAYA8msNJhtSpL+t70mk4DEANclQJqRGA7NfNk
         04UdqYWplc4zLuuUS97kqLIMHHadDtjzzSLEex8TeqH82xd122E4i1qTgXlA+Ik6DTvT
         cSOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yandex.ru header.s=mail header.b="l+CGZkB/";
       spf=pass (google.com: domain of si.test2017@yandex.ru designates 2a02:6b8:0:1a2d::605 as permitted sender) smtp.mailfrom=si.test2017@yandex.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex.ru
Return-Path: <si.test2017@yandex.ru>
Received: from forward400o.mail.yandex.net (forward400o.mail.yandex.net. [2a02:6b8:0:1a2d::605])
        by mx.google.com with ESMTPS id v8si13571749ljv.43.2019.06.25.07.08.00
        for <sitestgmai@gmail.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 07:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of si.test2017@yandex.ru designates 2a02:6b8:0:1a2d::605 as permitted sender) client-ip=2a02:6b8:0:1a2d::605;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yandex.ru header.s=mail header.b="l+CGZkB/";
       spf=pass (google.com: domain of si.test2017@yandex.ru designates 2a02:6b8:0:1a2d::605 as permitted sender) smtp.mailfrom=si.test2017@yandex.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yandex.ru
Received: from mxback3q.mail.yandex.net (mxback3q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:4545:437c])
	by forward400o.mail.yandex.net (Yandex) with ESMTP id BDE3E14C1125
	for <sitestgmai@gmail.com>; Tue, 25 Jun 2019 17:07:59 +0300 (MSK)
Received: from localhost (localhost [::1])
	by mxback3q.mail.yandex.net (nwsmtp/Yandex) with ESMTP id KIgWsAnl3X-7xgCJDrK;
	Tue, 25 Jun 2019 17:07:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1561471679;
	bh=bIWz8Ilu+qMJ8Fi6U/52eJtqM7koBHkh8DIkVWR8WHI=;
	h=Message-Id:Date:Subject:To:From;
	b=l+CGZkB/CsoYWjIZXRFbk984eTvCdpwddn0AJqcluGYDkki+T4YhgLJBwdOYaU2Jo
	 mCwttb7qoBVkqK+z6j9cFwgQ9Ot2CI2TCjwNt6Y0p4GLV2UYjwacxzEA27OCRqMbT8
	 YkWm4hcjzQz+6gwer26QmzRONvZ9j1o7f1ALkjvA=
Authentication-Results: mxback3q.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva7-b6ed732000ae.qloud-c.yandex.net with HTTP;
	Tue, 25 Jun 2019 17:07:59 +0300
From: =?utf-8?B?0KLQtdGB0YLQtdGAINCa0LjQsQ==?= <si.test2017@yandex.ru>
Envelope-From: si-test2017@yandex.by
To: =?utf-8?B?0KLQtdGB0YLQvtCy0YvQuSDQk9C80LXQudC7?= <sitestgmai@gmail.com>
Subject: =?utf-8?B?0YLQtdGB0YI=?=
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 25 Jun 2019 17:07:59 +0300
Message-Id: <1979251561471679@iva7-b6ed732000ae.qloud-c.yandex.net>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="utf-8"

PGRpdj7RgtC10YHRgjwvZGl2Pg0K

