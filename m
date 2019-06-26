Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29056FE5
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 19:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E50D6E4AD;
	Wed, 26 Jun 2019 17:50:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770079.outbound.protection.outlook.com [40.107.77.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1CF6E4AD
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 17:50:04 +0000 (UTC)
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3498.namprd12.prod.outlook.com (20.178.199.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 17:50:02 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::c6d:3ac2:8785:dd09]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::c6d:3ac2:8785:dd09%7]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 17:50:02 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: remove unnecessary warning message on gpu reset
Thread-Topic: [PATCH] drm/amdkfd: remove unnecessary warning message on gpu
 reset
Thread-Index: AQHVLEeUvlzsBTyP2USjut4BOyRdSA==
Date: Wed, 26 Jun 2019 17:50:02 +0000
Message-ID: <1561571394-16348-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3594b3c-c16b-4c4c-b95c-08d6fa5eb6b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3498; 
x-ms-traffictypediagnostic: DM6PR12MB3498:
x-microsoft-antispam-prvs: <DM6PR12MB349836424EA3FD65C72E8234F4E20@DM6PR12MB3498.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(366004)(136003)(39860400002)(189003)(199004)(6486002)(6916009)(6506007)(386003)(8936002)(68736007)(6512007)(6116002)(3846002)(72206003)(2351001)(14454004)(256004)(14444005)(99286004)(66066001)(53936002)(71200400001)(71190400001)(50226002)(52116002)(305945005)(4744005)(7736002)(36756003)(316002)(2906002)(66476007)(66556008)(66446008)(186003)(64756008)(66946007)(73956011)(5660300002)(476003)(6436002)(81166006)(2616005)(26005)(86362001)(2501003)(478600001)(5640700003)(81156014)(4326008)(102836004)(25786009)(8676002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3498;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mYFrYCO7wLuP06BoBLqlPP1vzIA4uAlRSYnST8QwW4br7Q6qW83wNg9+tcIUYSoKPpK8VZ9vr3akG81fHxw822ffLvFX5Hg003y503zqEheI1iJAa+cuIMsMUvLsIDwx9NVzznWYHgikbz8673JcdTBnkB/yFgvWvmryUxhSSS1tKmaJs/lpZFmrXD44NUWu9RyDaiFpFLGc6IRFtylzrUx+Chn+GEUoMng+7UlaAEuOk1fM3/cmkDM7QQi/nRWHl1Hnks/skZgFMI2ShVc5PF2/bQNoz9caz83dZVX2DSxCRtI67lYkrK+pQV42M2Te1rmnk3wVQhKwqXtC47qzBUkgWtynUtcxygY/mrhJo2Uqx9NwxDyR+ZpwhOvA8G7xfQqHBNfPgV3xCRja8QFFbgbpXX2Ynoscr6J9IZDtZyo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3594b3c-c16b-4c4c-b95c-08d6fa5eb6b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 17:50:02.7178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShaoyunL@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3498
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLKIMQFopYr6Ndo65JeIVRs1A1qwCgyyye+8FZnAcoU=;
 b=s0kJu10hngzr7hVu3uxzgWA7vDa+A9WZ9KfDtdaYZzEabYIjc9WfCagtKpwkQQ9Z2N1cDLk3wOFn5xXJUUE906TLPcUF264TBRDIFJat9G+Ges2WYlvDLk14TMQo27bY7cfjufuKVtMcH3pjm9QT50pQ6ffjuWO9Ih14BNX05oc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gWEdNSSBjb25maWd1cmF0aW9uLCBtb3JlIHRoYW4gb25lIGFzaWMgY2FuIGJlIHJlc2V0IGF0
IHNhbWUgdGltZSwNCmtmZCBpcyBhYmxlIHRvIGhhbmRsZSB0aGlzIGFuZCBubyBuZWVkIHRvIHRy
aWdnZXIgdGhlIHdhcm5pbmcNCg0KQ2hhbmdlLUlkOiBJZjMzOTUwMzg2MGU4NmVlMWRiZWVkMjk0
YmExYzEwM2ZjY2U3MGI3Yg0KU2lnbmVkLW9mZi1ieTogc2hhb3l1bmwgPHNoYW95dW4ubGl1QGFt
ZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCAx
IC0NCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jDQppbmRleCAyNmVhNDZkLi4yZTJmNzI0IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCkBAIC03MzgsNyArNzM4LDYgQEAgaW50IGtn
ZDJrZmRfcG9zdF9yZXNldChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQ0KIAlpZiAocmV0KQ0KIAkJcmV0
dXJuIHJldDsNCiAJY291bnQgPSBhdG9taWNfZGVjX3JldHVybigma2ZkX2xvY2tlZCk7DQotCVdB
Uk5fT05DRShjb3VudCAhPSAwLCAiS0ZEIHJlc2V0IHJlZi4gZXJyb3IiKTsNCiANCiAJYXRvbWlj
X3NldCgma2ZkLT5zcmFtX2VjY19mbGFnLCAwKTsNCiANCi0tIA0KMi43LjQNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
