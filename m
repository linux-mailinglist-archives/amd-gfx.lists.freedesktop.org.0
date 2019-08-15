Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83928E33D
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 05:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8D86E891;
	Thu, 15 Aug 2019 03:41:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD966E891
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 03:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z64QMI6Bl+3twWsMIJMj5ucGYJn2srQNpwkX/o81dbl5FPWLsJZDhtZX35eJxyAfzZ0pXdagMTBDKhF/jisex2+5qcWgf2f9F0vH9uBi7smkvyAs9K1wImWHh5NQ3otyuWR4Dpcb+0nTDkg7jWoYpw/YzfJDyUv0usrvZCN7hmxFAlJn3Cq9cJTs8KtCWW6n5AsWx/Rgi7+cKwbKVxCbGsbtC0hVPSQiKLTILPNdUPTe+XC736koLwEF1E9rBpLgKUwkaB9ztdfudVWqCx4Xbq9kUv60b+g1NJLLjeGkAITIgHaDA6RUHpM0s5MIFadhyZuEJsPClylj7yQIAWRrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62UDGYcllkkwswnQpIoyMQwA0+xrO+DowhEWUXcRjKs=;
 b=fq2RYetxVGg5FNhAzLmb9YmPz/UrC5wu38G7PJRCT9jjXjnoBbcoSA14gsEHnKWKg8dDMZ6N5CDYqTSDXv5pVvJnownH3FKIf3sOh3KW8dSnvbSicExwedmZ/LZ/IDVCXNjgSXLDDgsIawrRTGqYdA+syiC0kY7mHdJurc6U8zT+Tq22fh/V+nZBdsj0EomG/ST4ABDoan3wrI+6itoXqzh5dCHpiIgrc/1mu2RuL3Rmcqt9/n8ctiWkUZQryb6yNNJ3U1zUjGHAWIUhUJdz90UPFJ8vEBG+EyTk5ejHaCahflRPOgTXobN4zaAc1QWjWiSDf8ff4iTfmFtHxPjXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3410.namprd12.prod.outlook.com (20.178.211.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Thu, 15 Aug 2019 03:41:41 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 03:41:41 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: disable gfxoff for navi12
Thread-Topic: [PATCH] drm/amd/powerplay: disable gfxoff for navi12
Thread-Index: AQHVUxtZuG5Jm79aQ0KYYS5YLNuMkA==
Date: Thu, 15 Aug 2019 03:41:41 +0000
Message-ID: <20190815034123.963-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0007.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::19) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 210bdbb3-7e1d-4a1a-c042-08d721327c25
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3410; 
x-ms-traffictypediagnostic: BN8PR12MB3410:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3410E61EA1BA2F28893904B989AC0@BN8PR12MB3410.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(2351001)(86362001)(7736002)(5640700003)(305945005)(71190400001)(81166006)(6436002)(71200400001)(26005)(66946007)(81156014)(6512007)(52116002)(8936002)(3846002)(2501003)(66476007)(102836004)(6506007)(386003)(66446008)(66556008)(64756008)(50226002)(186003)(99286004)(8676002)(6116002)(316002)(6486002)(478600001)(14454004)(53936002)(6916009)(36756003)(1076003)(476003)(2616005)(4326008)(486006)(25786009)(5660300002)(66066001)(2906002)(54906003)(4744005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3410;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tVYONIQD7DFjNxFIb7vbq4RbUWvikArc8c6bHXaThGYKRkbfdGn1PsnCgfk73BtcuwrgARUiWU3y1mbhEn9lAS+bbviMOuJ3N1UiV0TqHzRjov/vfKlap9lvVBKorRy14laLQvxb2TVgEASAC/XsRkEqH3s1TttGjGTKY8cPhA+hB3nYeczFH1ZArouug1IGGP8km7OwlrTTgbZwNHS6GJ9cvJjlZlync+sKxArmksvIBwiynXsGTpMYDkAVlC+wdh1Akk8Gsht4tlBvdvKYe5iBpGRtDOXvveeHB04/MiMvwXjX3hJWtYWgqhF1lmyI9sHQ99OlRdTqIZ8KRwV9/+HVcliZPs9ppABnQTcCiU/t2+ymYADf8G0wrDmdUVud4HjwTTzYLAtLzS1hginQuxY1y/UWchNwZ6VXJuUQ1Ds=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210bdbb3-7e1d-4a1a-c042-08d721327c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 03:41:41.6421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2m9Lr26ErZjhhXzvvZa88cZLRocqTGt/qoENNZ0NmI708QqtkzZ1mnNT7MrLcYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62UDGYcllkkwswnQpIoyMQwA0+xrO+DowhEWUXcRjKs=;
 b=rx6kQUxUaXPFtezSfmobWqAg78jNzfvME1pFZ1FvAu/XCANKEeN3wMoGs6u2YFcLo9NwTa9k0ucU+jThvD7CCdso/epdaYuWKHgeFTGOthAV7EoYO740Caw7BMbVlbeReTRGGbt+eLa76IWismT37DaB82vIjtPyEiBddn6dKX8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Z2Z4b2ZmIGRvZXNuJ3Qgd29yayBvbiBuYXZpMTIgeWV0LCBzbyBkaXNhYmxlIGl0IGZvciBub3cK
ClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMK
aW5kZXggMDY2YmE1OTNhZjIzLi5kNjQ0NjY5ZTVkOTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jCkBAIC01ODAsNiArNTgwLDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8w
X2NoZWNrX2dmeG9mZl9mbGFnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXN3aXRj
aCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFW
STEyOgogCQlhZGV2LT5wbS5wcF9mZWF0dXJlICY9IH5QUF9HRlhPRkZfTUFTSzsKIAkJYnJlYWs7
CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
