Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FDDB8331
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 23:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2046A6F55C;
	Thu, 19 Sep 2019 21:17:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710076.outbound.protection.outlook.com [40.107.71.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848056F55C
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 21:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD2TsAjKP8GXEyzXvpaKsK2EYfxajgj0uGuIKoWsWJJ/kn3Jo73qgcx8qih0Qhrc+J0hD/D59qt/PjJtgZYrIJOaj+mjmWQ8DDpF9FV3oAByBrhNcF9iPH0Ou8CZj0/rzDMBODdTXq3qbTPO11/r+nJO/BjIYOF5s3jKElW1TP3o0hvhEpow+bIJcBZZDqYjRketLeZcz8LFon50dovUqhRnJgqpfkeaQ1bRv8LxQH6jzFTYbFGCBi98RzcMFtC4uSgYFJyRTTVqTO/ACJDyTgH16QkbbcpbBLILwM4QcOwqMRfQ9IGLmW/okM6TjsC/s6gDsCxBR/dEeeq5ZU0sKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFmdz7Z1ay7o4BGo8/AQYrLkK+KhA1HCwfd7wgoS2ik=;
 b=K1TSx8gnNX11WxKcUMtmSJzy6GCYXCPZUVQwlud58B+7g40mtnSpH/RwcwxO3RIlM7KcsinE7PGTKkbkGW2m1Idag7Pet4dQNuhWPikY9P2sfe0NvY5A7ZyiCFSYi8C3feWJQ+crfPFz/4xgEmt3V49kfa8U0iZoQUScAJOOZPzGFdKIdF+XEwJZXkFNC/z/5drd/vTigug+IlWTJDCT9ejotJOWiyhok0ssOCfSQ6T0+JLBPS1tefLJUdn0MLatK3P5wNik7vNzuUUlQBBXJn2wOfSVZsglTMUynCD7fZjwobqF0Ksdt4J0D3byhl3jDEQigppOdyE59ATWz3OBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2467.namprd12.prod.outlook.com (52.132.10.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 21:17:16 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::5cba:6f94:7520:93a8]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::5cba:6f94:7520:93a8%6]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 21:17:16 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for arcturus
Thread-Topic: [PATCH] drm/amdgpu: Enable gfx cache probing on HDP write for
 arcturus
Thread-Index: AQHVby+cOrlga564PUeguQaR/P1asw==
Date: Thu, 19 Sep 2019 21:17:15 +0000
Message-ID: <1568927828-17593-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::38) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd1dd986-76d7-4f77-8664-08d73d46bef8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2467; 
x-ms-traffictypediagnostic: BL0PR12MB2467:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB24673ECF7D994BDE73DB1C2C80890@BL0PR12MB2467.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:341;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(66446008)(2351001)(6506007)(2616005)(316002)(4744005)(386003)(476003)(6486002)(3846002)(5640700003)(6436002)(6512007)(66476007)(66946007)(64756008)(36756003)(6116002)(102836004)(81166006)(50226002)(8936002)(8676002)(81156014)(66556008)(486006)(26005)(71200400001)(71190400001)(54906003)(99286004)(52116002)(66066001)(478600001)(25786009)(14454004)(7736002)(305945005)(5660300002)(2501003)(186003)(256004)(4326008)(14444005)(6916009)(2906002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2467;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: warpufpzX0KHiKXs36lgzkOMl6oTN1dNSIVnpD4rQSkyqL1uuz/VO1D/VjyF6h7NiDz9xVj3U1pC9OHr4TbMnXfz+yNTWcPgiv6hmh8ebDDew1ZXROTl7xrxI+zQHZ5SUV7zmz38roAhdbEchATrb6/cSaZP46Ce+fiTGv2tO6NQ4iWfVBlLhFULv6/vatyvTOFpaj9OBiNsnis5hX3+p0g9b/EnMUMyiIs0epbx88A81yweot2zz7GBUYKGq037uGwD45X1S6K3Mox6uVDDNHQn7Z2KRSmWrE16TlXfii0cM1Zwuu2nD1l1N6A9VJtuEDn3xQ2VwQTIp2K5x4k3VhEZ7DkBReruVlS9JJG122SdrmGtN/ovFD4O7JFxYmyKBLSbgFyl9m2q8BD4aSLZrmvoRqO3Rh7n2CaI5kQB7IE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1dd986-76d7-4f77-8664-08d73d46bef8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 21:17:15.9536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: REuSQ7XUQfo2jALYFJVJWJVU7iT+bb4wuXF6wKKEli2k4Z9jnAwzSMWjNyqaLPSB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFmdz7Z1ay7o4BGo8/AQYrLkK+KhA1HCwfd7wgoS2ik=;
 b=gx3b6lpvXkDIn2Z0RuhrhmNNl1vBRm+84BXdIZNXdWzDeKE+Ue+HxJ/bttWHH5jUP5Nac4t74lSMriWjoTknFypteQqwXWd/fshyycKPQtpgc0cIOXH3NjHFb9RLrcaio2CJ1UdJBy6WJ0FI5PKrO+NwF2JUlv6guewaUzsc9F4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgZ2Z4IGNhY2hlIHRvIGJlIHByb2JlZCBhbmQgaW52YWxpZGF0ZWQgKGZvciBu
b25lLWRpcnR5IGNhY2hlIGxpbmVzKQpvbiBhIEhEUCB3cml0ZSAoZnJvbSBlaXRoZXIgYW5vdGhl
ciBHUFUgb3IgQ1BVKS4gVGhpcyBzaG91bGQgd29yayBvbmx5IGZvciB0aGUKbWVtb3J5IG1hcHBl
ZCBhcyBSVyBtZW1vcnkgdHlwZSBuZXdseSBhZGRlZCBmb3IgYXJjdHVydXMsIHRvIGFjaGlldmUg
c29tZSBjYWNoZQpjb2hlcmVuY2UgYi90IG11bHRpcGxlIG1lbW9yeSBjbGllbnRzLgoKQ2hhbmdl
LUlkOiBJMGE2OWQwMDAwZTQ4NzA2YmI3MTMyMzViZmJjODNmY2M2Nzc3NDYxNApTaWduZWQtb2Zm
LWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA1N2Q3NmVlLi5lMDFh
MzU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTEyNzIsNiArMTI3
Miw5IEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfZ2FydF9lbmFibGUoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiAJCS8qIFRPRE8gZm9yIHJlbm9pciAqLwogCQltbWh1Yl92MV8wX3VwZGF0ZV9w
b3dlcl9nYXRpbmcoYWRldiwgdHJ1ZSk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9BUkNUVVJVUzoK
KwkJV1JFRzMyX0ZJRUxEMTUoSERQLCAwLCBIRFBfTU1IVUJfQ05UTCwgSERQX01NSFVCX0dDQywg
MSk7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWJyZWFrOwogCX0KLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
