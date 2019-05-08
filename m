Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B617D89
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 17:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F990897D4;
	Wed,  8 May 2019 15:51:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770088.outbound.protection.outlook.com [40.107.77.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ADC897D4
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 15:51:41 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2533.namprd12.prod.outlook.com (52.132.141.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 15:51:40 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 15:51:40 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/amdgpu/VCN: set no_user_fence flag to true
Thread-Topic: [PATCH 4/6] drm/amdgpu/VCN: set no_user_fence flag to true
Thread-Index: AQHVBbXs5cbtnDDtNUqF19J7IAbhcg==
Date: Wed, 8 May 2019 15:51:39 +0000
Message-ID: <20190508155100.7810-4-leo.liu@amd.com>
References: <20190508155100.7810-1-leo.liu@amd.com>
In-Reply-To: <20190508155100.7810-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d7ef78d-77b9-48f8-c3bd-08d6d3cd0f36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2533; 
x-ms-traffictypediagnostic: DM5PR12MB2533:
x-microsoft-antispam-prvs: <DM5PR12MB2533036051617D1FA1205980E5320@DM5PR12MB2533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(53936002)(305945005)(72206003)(6916009)(66066001)(71200400001)(71190400001)(4326008)(256004)(25786009)(6116002)(3846002)(7736002)(316002)(8676002)(1076003)(81156014)(81166006)(2351001)(86362001)(36756003)(5660300002)(478600001)(14454004)(50226002)(68736007)(8936002)(486006)(446003)(2501003)(11346002)(2616005)(476003)(6512007)(66946007)(66446008)(64756008)(66556008)(66476007)(2906002)(73956011)(102836004)(6506007)(386003)(6486002)(6436002)(52116002)(76176011)(5640700003)(186003)(26005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2533;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AywlN2YmXjzQuax/wS/PQTavo/8uDsGV8T8a1CbRSp+VSiwVQXuWslAg6BfGao8CkTaDx+1w7NatcYKJGRTzzntm9tjjRhvkn4HwdFwdUTJlx/NQ9LzfWZ7rUYndKRYt4RBjA2OPzLOEUCyWY2fwCAFQ/Xp39lFHGPNLJInnmxpC3bKNc+jglJ4AutbS+/UiB7QLUBV3ZmVcLUJ/o173kASM+M64Uhkb0PHHbmtj+yOBZ0bu4T2xLRmNun9hX4hhxsFIjtA9XUDoKmfXJWG0M7klbGpHTYZzn5Vg4ptQcmSGFoFq29j7Hp+9vDoUtvaCM9Di87S/uLbITUfXyWH9ldPIIHbu/uAgfpw1zzU6k/IAZo/xuia5MMcXjF3ty+f+suSTENJwSgjI7ltYMveV4DAneh52KlsGBYEcpGVQS58=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7ef78d-77b9-48f8-c3bd-08d6d3cd0f36
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 15:51:39.9589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tExlUx03SkKOP9JVJ45aXdgdSazfRB7s09hEma0mrQk=;
 b=Wq4VYZWdZCtqRVo3Rr6XGBk61Q3SbYcdEABTvNAETzh8TIiIIGGOF7+1IHr0renOaEB4Wd19yyIuhoRUjvC6rCvb7wRLRkTwdI/q7IB/TBUzT0ZYzB6VZoAB8+oW6uSwvxgdrGm9BHNIHBphsL653vvrFPNZQMN0GhLAALqfN8o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gdXNlciBmZW5jZSBzdXBwb3J0IGZvciBWQ04NCg0KU2lnbmVkLW9mZi1ieTog
TGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YxXzAuYyB8IDMgKysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMNCmluZGV4IDNkYmM1MWY5ZDNiOS4u
YWMyZTVhMWViNTc2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YxXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYw0KQEAg
LTIwNTQsNiArMjA1NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3Mg
dmNuX3YxXzBfZGVjX3Jpbmdfdm1fZnVuY3MgPSB7DQogCS50eXBlID0gQU1ER1BVX1JJTkdfVFlQ
RV9WQ05fREVDLA0KIAkuYWxpZ25fbWFzayA9IDB4ZiwNCiAJLnN1cHBvcnRfNjRiaXRfcHRycyA9
IGZhbHNlLA0KKwkubm9fdXNlcl9mZW5jZSA9IHRydWUsDQogCS52bWh1YiA9IEFNREdQVV9NTUhV
QiwNCiAJLmdldF9ycHRyID0gdmNuX3YxXzBfZGVjX3JpbmdfZ2V0X3JwdHIsDQogCS5nZXRfd3B0
ciA9IHZjbl92MV8wX2RlY19yaW5nX2dldF93cHRyLA0KQEAgLTIwODcsNiArMjA4OCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgdmNuX3YxXzBfZW5jX3Jpbmdfdm1f
ZnVuY3MgPSB7DQogCS5hbGlnbl9tYXNrID0gMHgzZiwNCiAJLm5vcCA9IFZDTl9FTkNfQ01EX05P
X09QLA0KIAkuc3VwcG9ydF82NGJpdF9wdHJzID0gZmFsc2UsDQorCS5ub191c2VyX2ZlbmNlID0g
dHJ1ZSwNCiAJLnZtaHViID0gQU1ER1BVX01NSFVCLA0KIAkuZ2V0X3JwdHIgPSB2Y25fdjFfMF9l
bmNfcmluZ19nZXRfcnB0ciwNCiAJLmdldF93cHRyID0gdmNuX3YxXzBfZW5jX3JpbmdfZ2V0X3dw
dHIsDQpAQCAtMjExOCw2ICsyMTIwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmlu
Z19mdW5jcyB2Y25fdjFfMF9qcGVnX3Jpbmdfdm1fZnVuY3MgPSB7DQogCS5hbGlnbl9tYXNrID0g
MHhmLA0KIAkubm9wID0gUEFDS0VUMCgweDgxZmYsIDApLA0KIAkuc3VwcG9ydF82NGJpdF9wdHJz
ID0gZmFsc2UsDQorCS5ub191c2VyX2ZlbmNlID0gdHJ1ZSwNCiAJLnZtaHViID0gQU1ER1BVX01N
SFVCLA0KIAkuZXh0cmFfZHcgPSA2NCwNCiAJLmdldF9ycHRyID0gdmNuX3YxXzBfanBlZ19yaW5n
X2dldF9ycHRyLA0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
