Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C12C0AE
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 09:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97AA89C18;
	Tue, 28 May 2019 07:55:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D7789C18
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 07:55:20 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3376.namprd12.prod.outlook.com (20.178.240.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Tue, 28 May 2019 07:55:18 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f%3]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 07:55:18 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: reserve stollen vram for raven series
Thread-Topic: [PATCH] drm/amdgpu: reserve stollen vram for raven series
Thread-Index: AQHVFSqxiuBcAVbo4kOeyP/Q1u3rlA==
Date: Tue, 28 May 2019 07:55:18 +0000
Message-ID: <1559030095-19673-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67fba55a-fae2-482c-03e0-08d6e341d332
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3376; 
x-ms-traffictypediagnostic: MN2PR12MB3376:
x-microsoft-antispam-prvs: <MN2PR12MB33764343B31E2F06F9870DEDFA1E0@MN2PR12MB3376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:71;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(2501003)(50226002)(8676002)(6436002)(5640700003)(81166006)(81156014)(6486002)(66556008)(66476007)(8936002)(66446008)(102836004)(2906002)(64756008)(5660300002)(305945005)(4744005)(86362001)(14454004)(72206003)(73956011)(478600001)(66946007)(316002)(99286004)(3846002)(25786009)(6116002)(256004)(26005)(6506007)(186003)(386003)(6916009)(4326008)(66066001)(7736002)(6512007)(52116002)(2351001)(71190400001)(53936002)(68736007)(486006)(2616005)(476003)(71200400001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3376;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R4icc6yy+eAglQE2nfMxbtyeHWHzV0IhrWnUJvw4XlPMK4fWirlweY/4eIK3ZWan7NVe87T+m4vz2q79Er/+Hz+EmYJ71CANrO+tNCLfs0Dm48SEhC4119GiKcrt6/kiu9rOP3k1LiHKi2oOwRfNXG8Z605BUWzNafSczT1Dl0+yc87bvjcHftjsNfBP7r/V4hYsd83aSWd505pBa3+IJtEgpKKz63LZZIUD7YLn/Vo30F8Fq0Pmk0d8DaSSlDe1iOAi8q7MWShkpzC3wmmXixkR+0iQObkFoH4IZquZoigDkvW/uM8Qp3yyyKXM7xchDNge6t+H+NdB2Q8tNJaEAT0rONRCUoE61RiIf2SfcpTbx0VKfl8dGfcvDwFYUG7nILOp50I/lKQUtVGXNbdyKLA8HzMCHyADaM3sTnHUvUY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fba55a-fae2-482c-03e0-08d6e341d332
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 07:55:18.4658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG9dZw83gPsQk8Wz5iG6u4nG0/4cjXOR/y8PAsf2W14=;
 b=yFDNWFe1Eu/aeXSdrf9NyXWpJT33Y0ciqN0v6VQxZOM45aKAIL4DbbqcZpwoH/og7nFoiU5010sj8o1MOD4f/bn3lCVqaU9qv6KC09UDOequUk4v3iBflSj++y6pj6GjNrXCtquEp37rkDv62ZW/hmWfzyK9cnCMtqzbG0L/rdc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dG8gYXZvaWQgc2NyZWVuIGNvcnJ1cHRpb24gZHVyaW5nIG1vZHByb2JlLg0KDQpDaGFuZ2UtSWQ6
IEk4NjcxZGU2ZWQ0NjI4NTU4NWRiZTg2NjgzMmM2ZDJiODM1Y2EzN2YzDQpTaWduZWQtb2ZmLWJ5
OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDMgKy0tDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMN
CmluZGV4IDYwMjU5M2IuLmRiYzgzYTEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jDQpAQCAtNjI0LDkgKzYyNCw4IEBAIHN0YXRpYyBib29sIGdtY192OV8wX2tlZXBfc3Rv
bGVuX21lbW9yeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJICovDQogCXN3aXRjaCAo
YWRldi0+YXNpY190eXBlKSB7DQogCWNhc2UgQ0hJUF9WRUdBMTA6DQotCQlyZXR1cm4gdHJ1ZTsN
CiAJY2FzZSBDSElQX1JBVkVOOg0KLQkJcmV0dXJuIChhZGV2LT5wZGV2LT5kZXZpY2UgPT0gMHgx
NWQ4KTsNCisJCXJldHVybiB0cnVlOw0KIAljYXNlIENISVBfVkVHQTEyOg0KIAljYXNlIENISVBf
VkVHQTIwOg0KIAlkZWZhdWx0Og0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
