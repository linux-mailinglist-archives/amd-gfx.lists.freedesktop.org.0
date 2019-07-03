Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C84025DCA8
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 04:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3236A6E0C3;
	Wed,  3 Jul 2019 02:50:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CC76E0C3
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 02:50:53 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3578.namprd12.prod.outlook.com (20.178.199.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 02:50:52 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 02:50:52 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdkfd: Remove unused variable
Thread-Topic: [PATCH 1/1] drm/amdkfd: Remove unused variable
Thread-Index: AQHVMUogopXoac41V0m3mvET3cAhMg==
Date: Wed, 3 Jul 2019 02:50:52 +0000
Message-ID: <20190703025028.13588-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 345ba79d-6765-4aa6-26ec-08d6ff6142ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3578; 
x-ms-traffictypediagnostic: DM6PR12MB3578:
x-microsoft-antispam-prvs: <DM6PR12MB35782A4EEEED77D328E629D792FB0@DM6PR12MB3578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(199004)(189003)(73956011)(50226002)(2616005)(52116002)(66556008)(476003)(14454004)(26005)(102836004)(3846002)(81156014)(8676002)(81166006)(2351001)(386003)(99286004)(1076003)(86362001)(305945005)(64756008)(2501003)(71200400001)(71190400001)(14444005)(8936002)(256004)(66446008)(7736002)(186003)(6116002)(6506007)(66946007)(36756003)(66476007)(5660300002)(6916009)(6436002)(5640700003)(4326008)(6486002)(6512007)(316002)(2906002)(4744005)(25786009)(68736007)(72206003)(54906003)(486006)(53936002)(478600001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3578;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pUb728GZxGZxN0wVJ6BFk+9ULExPeIWQRq3wm07JBJLSPAyedXUN65Ou6uSA82IREVaiCf/ISpl5lz1J96OUGND4nWYUZWtbjDrOPJ9idVdqDmmvlgK4uqVVNSEvIDl/wDTU3Kzn8swAg6vEEq9mBKBCZiv3dnuvX0yZq5auth+BHdpnn3lIQ9iBaUMYVgOKUuU8JlUaRwbHCXawHbzxSDLGLqC/iz+JWC1cMTIMGQdpk9nRBJmMkbh54UItLbsb7WDj+tbLxMzuf55fNHLIhXFx/zDaL23ZDPlAdSYltM4wB+P+bXOkH7PoEsxlAE1KJqQak9EOhYLLGBRcZYHphV79m0RKiOzag03zYKVVzejE01AckwzSQKI2gGoCvuUgbTmGK20llV7Gh5JWg6btETXZb0B5C1ohXRR68HXiaO4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345ba79d-6765-4aa6-26ec-08d6ff6142ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 02:50:52.0759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoDW4kooquF46Gwhz2mEV15ysKzNbpaBaoR3e6t4Lyg=;
 b=v7Uviee6XdO/cSq/n5J8g9/rOJk3JiXyB3YqjPv/mfbMZ2aP8EJXxfGzbciZ5ZQ5fb4VGsiRJawVoTQK7JYhnBdaR8EVBbnO3/+jbZWmilIQJMTsGHTwBJKhK4ylgNwTQIWebaxNsXnBEtxamPiL2+Tz1ruaFmDNgEAMZRYh4eg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IGFuIG9idmlvdXMgY29tcGlsZXIgd2FybmluZy4KCkZpeGVzOiBiMWU2NjM5ODMwYmQwICgi
ZHJtL2FtZGtmZDogcmVtb3ZlIGR1cGxpY2F0ZWQgUENJRSBhdG9taWNzIHJlcXVlc3QiKQpDQzog
SmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwppbmRleCAyNGRiODJiNjFiMGIuLjMz
MjJhNDQzZGZiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAt
NDg3LDcgKzQ4Nyw2IEBAIHN0cnVjdCBrZmRfZGV2ICprZ2Qya2ZkX3Byb2JlKHN0cnVjdCBrZ2Rf
ZGV2ICprZ2QsCiAJc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBrZmQya2dkX2Nh
bGxzICpmMmcpCiB7CiAJc3RydWN0IGtmZF9kZXYgKmtmZDsKLQlpbnQgcmV0OwogCWNvbnN0IHN0
cnVjdCBrZmRfZGV2aWNlX2luZm8gKmRldmljZV9pbmZvID0KIAkJCQkJbG9va3VwX2RldmljZV9p
bmZvKHBkZXYtPmRldmljZSk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
