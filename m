Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD813285A
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 08:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E613A892D5;
	Mon,  3 Jun 2019 06:12:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC663892D5
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 06:12:15 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3293.namprd12.prod.outlook.com (20.179.83.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.21; Mon, 3 Jun 2019 06:12:14 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 06:12:14 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Topic: [PATCH] drm/amd/powerplay: add smu message mutex
Thread-Index: AQHVGdNJNisJyazoOUO4oIVoS5cQvQ==
Date: Mon, 3 Jun 2019 06:12:13 +0000
Message-ID: <1559542302-17573-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0074.apcprd03.prod.outlook.com
 (2603:1096:203:72::14) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f706f7a7-c023-4445-6f7e-08d6e7ea6bb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3293; 
x-ms-traffictypediagnostic: MN2PR12MB3293:
x-microsoft-antispam-prvs: <MN2PR12MB32932BCBE1DDA31A0D077909EF140@MN2PR12MB3293.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(366004)(39850400004)(189003)(199004)(66946007)(73956011)(66556008)(64756008)(66446008)(66476007)(6512007)(6436002)(86362001)(6486002)(3846002)(486006)(2616005)(476003)(256004)(14444005)(6116002)(2906002)(71190400001)(71200400001)(316002)(4326008)(2501003)(25786009)(186003)(15650500001)(26005)(6636002)(110136005)(7736002)(14454004)(50226002)(81166006)(81156014)(8676002)(8936002)(305945005)(53936002)(99286004)(52116002)(5660300002)(386003)(6506007)(102836004)(66066001)(478600001)(36756003)(72206003)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3293;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XT5qWH/4lUVclS/9bag6ThtZCiJUks42Z1A3HlRYAceRKWbOyX5QsYiRAKgozSmHX1lJJgKDOUSG8eEqO073l+glTPRUsnVETcdCXnjCAomC2vGy6HBSjTXQ3kPeq8sEOgW3e34folckvJ0aVMc2lfVUUMHAOQeevn0sogAczXXFdRpdhS8nc8nrmuVu8OcPQymGMUgetQN6WWVdCXmXXG7IeLVMY9tO0tYfuuHLZ4WZ9vOdjEzwdKAwZ7GAUkomCHvjGR9Yu4EbKYrwmn5VYhI3KcKDOhoNnJQmW+FIPw7UOPr0zRGdvYsR4Fb506wf+6QNXKWbEg+g6i6aR3ba89j4QSCYn8w1OKsTV328MwSR6ID2e6E8iz3x67eK//dFrVBsq3RZ08doKRm9HeV2JMhHLkdFuWnmPOKarvck69o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f706f7a7-c023-4445-6f7e-08d6e7ea6bb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 06:12:14.0870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3293
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUYvmDyqP9Yc/wd3oC3+xGSlKd49VmzVsEy2SyqHzE4=;
 b=PQJoOnHq0EL+Lapq3bIvbfqDf4vnDgdzsqGcFl4XeKQsXeizDeUU3WMPdV0Ly3TxQhZY5TbKoWaxt4DqPIvtJImN3x1L1HBTGyPn6j+xkShu4H3gSkeOCfwftHLNI3Zrgp4CBkVYBsiTjjIJL6gfAzyCRbROZ/YfCfv3N5VdUKc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHNtdSBtZXNzYWdlIG11dGV4IHByZXZlbnRpbmcgYWdhaW5zdCByYWNlIGNvbmRpdGlvbiBp
c3N1ZS4NCg0KU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmggfCAxICsN
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgIHwgNyArKysr
KystDQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211
LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oDQppbmRl
eCAzZWIxZGU5Li43MzUyMzNlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaW5jL2FtZGdwdV9zbXUuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvaW5jL2FtZGdwdV9zbXUuaA0KQEAgLTM3NCw2ICszNzQsNyBAQCBzdHJ1Y3Qgc211X2NvbnRl
eHQNCiAJY29uc3Qgc3RydWN0IHNtdV9mdW5jcwkJKmZ1bmNzOw0KIAljb25zdCBzdHJ1Y3QgcHB0
YWJsZV9mdW5jcwkqcHB0X2Z1bmNzOw0KIAlzdHJ1Y3QgbXV0ZXgJCQltdXRleDsNCisJc3RydWN0
IG11dGV4CQkJbXNnX211dGV4Ow0KIAl1aW50NjRfdCBwb29sX3NpemU7DQogDQogCXN0cnVjdCBz
bXVfdGFibGVfY29udGV4dAlzbXVfdGFibGU7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVfdjExXzAuYw0KaW5kZXggZDJlZWI2Mi4uZGU3MzdhMCAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KQEAgLTEwNCw2ICsxMDQsOCBAQCBzdGF0aWMg
aW50IHNtdV92MTFfMF9zZW5kX21zZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3Qg
bXNnKQ0KIAlpZiAoaW5kZXggPCAwKQ0KIAkJcmV0dXJuIGluZGV4Ow0KIA0KKwltdXRleF9sb2Nr
KCZzbXUtPm1zZ19tdXRleCk7DQorDQogCXNtdV92MTFfMF93YWl0X2Zvcl9yZXNwb25zZShzbXUp
Ow0KIA0KIAlXUkVHMzJfU09DMTUoTVAxLCAwLCBtbU1QMV9TTU5fQzJQTVNHXzkwLCAwKTsNCkBA
IC0xMTEsMTEgKzExMywxMSBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZW5kX21zZyhzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKQ0KIAlzbXVfdjExXzBfc2VuZF9tc2dfd2l0
aG91dF93YWl0aW5nKHNtdSwgKHVpbnQxNl90KWluZGV4KTsNCiANCiAJcmV0ID0gc211X3YxMV8w
X3dhaXRfZm9yX3Jlc3BvbnNlKHNtdSk7DQotDQogCWlmIChyZXQpDQogCQlwcl9lcnIoIkZhaWxl
ZCB0byBzZW5kIG1lc3NhZ2UgMHgleCwgcmVzcG9uc2UgMHgleFxuIiwgaW5kZXgsDQogCQkgICAg
ICAgcmV0KTsNCiANCisJbXV0ZXhfdW5sb2NrKCZzbXUtPm1zZ19tdXRleCk7DQogCXJldHVybiBy
ZXQ7DQogDQogfQ0KQEAgLTEzMiw2ICsxMzQsOCBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9zZW5k
X21zZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDE2X3QgbXNnKQ0KIAlpZiAoaW5kZXgg
PCAwKQ0KIAkJcmV0dXJuIGluZGV4Ow0KIA0KKwltdXRleF9sb2NrKCZzbXUtPm1zZ19tdXRleCk7
DQorDQogCXJldCA9IHNtdV92MTFfMF93YWl0X2Zvcl9yZXNwb25zZShzbXUpOw0KIAlpZiAocmV0
KQ0KIAkJcHJfZXJyKCJGYWlsZWQgdG8gc2VuZCBtZXNzYWdlIDB4JXgsIHJlc3BvbnNlIDB4JXgs
IHBhcmFtIDB4JXhcbiIsDQpAQCAtMTQ4LDYgKzE1Miw3IEBAIHN0YXRpYyBpbnQgc211X3YxMV8w
X3NlbmRfbXNnKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MTZfdCBtc2cpDQogCQlwcl9l
cnIoIkZhaWxlZCB0byBzZW5kIG1lc3NhZ2UgMHgleCwgcmVzcG9uc2UgMHgleCBwYXJhbSAweCV4
XG4iLA0KIAkJICAgICAgIGluZGV4LCByZXQsIHBhcmFtKTsNCiANCisJbXV0ZXhfdW5sb2NrKCZz
bXUtPm1zZ19tdXRleCk7DQogCXJldHVybiByZXQ7DQogfQ0KIA0KLS0gDQoxLjkuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
