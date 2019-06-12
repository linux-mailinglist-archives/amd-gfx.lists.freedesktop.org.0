Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785EE42A79
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 17:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9666896B0;
	Wed, 12 Jun 2019 15:13:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57551896C4
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 15:13:17 +0000 (UTC)
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com (10.174.106.148) by
 DM5PR1201MB2539.namprd12.prod.outlook.com (10.172.91.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 12 Jun 2019 15:13:14 +0000
Received: from DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae]) by DM5PR1201MB0155.namprd12.prod.outlook.com
 ([fe80::dde4:7ea4:1b9b:45ae%9]) with mapi id 15.20.1987.012; Wed, 12 Jun 2019
 15:13:14 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not required
Thread-Topic: [PATCH] drm/amdgpu: only use kernel zone if need_dma32 is not
 required
Thread-Index: AQHVITFaKjzrw3xsHkSdhatf91RqQA==
Date: Wed, 12 Jun 2019 15:13:14 +0000
Message-ID: <20190612151250.816-1-Philip.Yang@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To DM5PR1201MB0155.namprd12.prod.outlook.com
 (2603:10b6:4:55::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ac83953-2137-4a0c-0748-08d6ef487d43
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2539; 
x-ms-traffictypediagnostic: DM5PR1201MB2539:
x-microsoft-antispam-prvs: <DM5PR1201MB25393081F7AD6300EA2B0F70E6EC0@DM5PR1201MB2539.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(136003)(39860400002)(199004)(189003)(71200400001)(71190400001)(8936002)(2501003)(486006)(14454004)(4326008)(36756003)(6916009)(5660300002)(316002)(66446008)(3846002)(6116002)(66556008)(66476007)(68736007)(476003)(2906002)(50226002)(66946007)(73956011)(64756008)(2616005)(6486002)(99286004)(25786009)(305945005)(52116002)(1076003)(102836004)(6436002)(6512007)(53936002)(72206003)(8676002)(478600001)(81166006)(256004)(81156014)(14444005)(7736002)(66066001)(86362001)(26005)(386003)(6506007)(2351001)(186003)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2539;
 H:DM5PR1201MB0155.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /Ylhkip5JSIoQ4Qt8VsilOJPGMlnrh9dCUwJ6Qz1XIQ4Xe7i0ScleNq/tbmTtxZVPip8ADlgu49lkyYRHmPBn1WVwgTl0uSyrXEGU28VCqatz/UDEKUEpK/qBsBIoh5CyeV1df1KJctjFbH5lGdZrXF963gWExDIkuoPh5HuN0/4cX3fwLLqYrt/s9XX+jDnPXwxvE+xTW3/5JmYeAeTCCvz0Cf/Yg4AFbFyvY9bj62N+JqHn5kSJxhj7Uvb6Qv2kMskvqvaC5jXeqeYZqcRSNxzEeZU8m9+Y3WCWP9Db6bs8mXqNoN2As/iFn8KAOJnuWRqR2M2VEF5gJAerqKsvayJds0oyz2dmip52w8C3+i4j30iFaMC07iIZSh3a/VCGYyGMGU70O9Hj+EuJBoB96+wkZxH0/154yd0EbVODpk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac83953-2137-4a0c-0748-08d6ef487d43
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 15:13:14.1155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yangp@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2539
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pd+gjkK9q+aTRAmT4IlJZsp/XxggQtcTt+DgwlLFX8U=;
 b=nGjgt4DclP9isZUGhwqRmImHhLBNm3GCiSr+trNoxAVSHINFRqSQDVont5BeTg68QJ0LB8rnFah519oPfx3VnW+cQZyub0CyxB/djsK8K16447MJamtp83ffVhTVa/BbX77n9InMfMYoypKja6PajY6BbpjbtkczzlIxOF7Fr3A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VFRNIGNyZWF0ZSB0d28gem9uZXMsIGtlcm5lbCB6b25lIGFuZCBkbWEzMiB6b25lIGZvciBzeXN0
ZW0gbWVtb3J5LiBJZg0Kc3lzdGVtIG1lbW9yeSBhZGRyZXNzIGFsbG9jYXRlZCBpcyBiZWxvdyA0
R0IsIHRoaXMgYWNjb3VudCB0byBkbWEzMiB6b25lDQphbmQgd2lsbCBleGhhdXN0IGRtYTMyIHpv
bmUgYW5kIHRyaWdnZXIgdW5uZXNzc2FyeSBUVE0gZXZpY3Rpb24uDQoNClBhdGNoICJkcm0vdHRt
OiBBY2NvdW50IGZvciBrZXJuZWwgYWxsb2NhdGlvbnMgaW4ga2VybmVsIHpvbmUgb25seSIgb25s
eQ0KaGFuZGxlIHRoZSBhbGxvY2F0aW9uIGZvciBhY2Nfc2l6ZSwgdGhlIHN5c3RlbSBtZW1vcnkg
cGFnZSBhbGxvY2F0aW9uIGlzDQp0aHJvdWdoIHR0bV9tZW1fZ2xvYmFsX2FsbG9jX3BhZ2Ugd2hp
Y2ggc3RpbGwgYWNjb3VudCB0byBkbWEzMiB6b25lIGlmDQpwYWdlIGlzIGJlbG93IDRHQi4NCg0K
Q2hhbmdlLUlkOiBJMjg5Yjg1ZDg5MWI4ZjY0YTE0MjJjNDJiMWVhYjM5ODA5OGFiN2VmNw0KU2ln
bmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCA0ICsrKysNCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMNCmluZGV4IDI3NzhmZjYzZDk3ZC4uNzliYjlkZmU2MTdiIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCkBAIC0xNjg2LDYgKzE2ODYsMTAgQEAgaW50IGFt
ZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJfQ0KIAlhZGV2LT5t
bWFuLmluaXRpYWxpemVkID0gdHJ1ZTsNCiANCisJLyogT25seSBrZXJuZWwgem9uZSAobm8gZG1h
MzIgem9uZSkgaWYgZGV2aWNlIGRvZXMgbm90IHJlcXVpcmUgZG1hMzIgKi8NCisJaWYgKCFhZGV2
LT5uZWVkX2RtYTMyKQ0KKwkJYWRldi0+bW1hbi5iZGV2Lmdsb2ItPm1lbV9nbG9iLT5udW1fem9u
ZXMgPSAxOw0KKw0KIAkvKiBXZSBvcHQgdG8gYXZvaWQgT09NIG9uIHN5c3RlbSBwYWdlcyBhbGxv
Y2F0aW9ucyAqLw0KIAlhZGV2LT5tbWFuLmJkZXYubm9fcmV0cnkgPSB0cnVlOw0KIA0KLS0gDQoy
LjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
