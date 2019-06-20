Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BD4D1F3
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 17:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118F46E5BF;
	Thu, 20 Jun 2019 15:19:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE6D6E5BF
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 15:19:40 +0000 (UTC)
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3895.namprd12.prod.outlook.com (52.132.246.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 15:19:38 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c%4]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 15:19:38 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: early merge post fix to df_v3_6 for xgmi
Thread-Topic: [PATCH] drm/amdgpu: early merge post fix to df_v3_6 for xgmi
Thread-Index: AQHVJ3uTGJ1SMJyIrEeGRdaJ1XpLYw==
Date: Thu, 20 Jun 2019 15:19:38 +0000
Message-ID: <20190620151924.86234-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63cc9236-628c-4fbe-5408-08d6f592b5d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3895; 
x-ms-traffictypediagnostic: CH2PR12MB3895:
x-microsoft-antispam-prvs: <CH2PR12MB389555CEEA713A8F7C4196FC85E40@CH2PR12MB3895.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(39860400002)(136003)(346002)(199004)(189003)(486006)(66556008)(3846002)(256004)(52116002)(64756008)(53936002)(5640700003)(66946007)(6512007)(316002)(6486002)(2906002)(6506007)(73956011)(86362001)(50226002)(478600001)(186003)(71200400001)(72206003)(2501003)(81156014)(66446008)(6436002)(71190400001)(66476007)(14454004)(386003)(2616005)(305945005)(7736002)(6116002)(2351001)(81166006)(36756003)(1076003)(8936002)(68736007)(8676002)(66066001)(6916009)(476003)(26005)(102836004)(99286004)(25786009)(5660300002)(4326008)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3895;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BWDbx/cpytBtaimU8yKHQ8v62FQ5rhBhOBIMhEmzBmQ37+gjt76JtgFQZOJDKShYSQ6rtFxrkVavUSCU9by/2wL7yoEfh7tNozxv+2JGOXjW6wuaW61sph0QEJAM2Te1SKsZ7EMm+zTbiA6cpvgxLD4CvkjN4I6byfyyxGsOzV0PdVS8YPz9fFcVlCzlsOq8ovi8eKElga6VCahcBSFsZwZSOAPb/Sykqt1aqwvoBinX7Ocn2RIGThKXrUnXXJQaZiNqrSkQLsiJdA9LsxUFGkPcQcj7OutQB+7vYgnx4bb9lpBO9yCxPeqU0c7aiReY2bBlQU8qQfYnD9PkvE3A/QrHUr2IlG3/0p2FpMzBQy6blt9W99qlnTtFRxsXLzX04VcnFbTW4O05XomB2dZTLSIGtPjDpCNRIuPDH0WVOlk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cc9236-628c-4fbe-5408-08d6f592b5d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 15:19:38.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3895
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdONd1cdlsrCyO3A70IhcJFMlQbWxCVShrmQ4BEnSKs=;
 b=iRgp+GkJTqgQgZ1rJJ+y0+Hn2iH6HydCJDtOkULT8nMeo/XUEEp6Z+ONlE9imLVmYzh+i6Wx7ILJeEsrGEGbj3nDsLq5dzERlc0C+5S4fBvas7ztzTgyD85ciU37+BUYBxE539cG7U6dl7A/Vb6q+PctUZ1MtwifeCzfcTpcApA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zml4ZWQgZGYgcGVybW9uIHRvIDQNCnJlbW92ZWQgdW5yZXF1aXJlZCByZXQgaW4gc29jMTUNCnJl
bmFtZWQgZGYgaW5pdCB0byBkZiBzdyBpbml0IGFuZCBtb3ZlZCBjYWxsYmFjayBmcm9tIHNvYzE1
IGh3IGluaXQgdG8NCnNvYzE1IHN3IGluaXQNCg0KQ2hhbmdlLUlkOiBJYTk4OTc2MTI5MzdlNjUy
ZTdmOGEwOWMxZDIzYmIxYzBlNmYzZDhmNw0KU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxK
b25hdGhhbi5LaW1AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oICB8IDIgKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgfCA0
ICsrLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgfCA1ICsrLS0tDQog
MyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQppbmRleCBiMjI3Yzk1NmI4YTkuLmMzZWQwOWNkMjY3
OCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KQEAgLTczMiw3ICs3MzIsNyBA
QCBzdHJ1Y3QgYW1kX3Bvd2VycGxheSB7DQogfTsNCiANCiAjZGVmaW5lIEFNREdQVV9SRVNFVF9N
QUdJQ19OVU0gNjQNCi0jZGVmaW5lIEFNREdQVV9NQVhfREZfUEVSRk1PTlMgMTYNCisjZGVmaW5l
IEFNREdQVV9NQVhfREZfUEVSRk1PTlMgNA0KIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsNCiAJc3Ry
dWN0IGRldmljZQkJCSpkZXY7DQogCXN0cnVjdCBkcm1fZGV2aWNlCQkqZGRldjsNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9kZl92M182LmMNCmluZGV4IDEyZTNlNjcwMTNkOS4uYzY1MTRjNjA5YWU2
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCkBAIC0xMTgsNyArMTE4LDcg
QEAgc3RhdGljIHNzaXplX3QgZGZfdjNfNl9nZXRfZGZfY250cl9hdmFpbChzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQogc3RhdGljIERFVklDRV9BVFRSKGRmX2NudHJfYXZhaWwsIFNfSVJVR08sIGRmX3Yz
XzZfZ2V0X2RmX2NudHJfYXZhaWwsIE5VTEwpOw0KIA0KIC8qIGluaXQgcGVyZm1vbnMgKi8NCi1z
dGF0aWMgdm9pZCBkZl92M182X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQorc3Rh
dGljIHZvaWQgZGZfdjNfNl9zd19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIHsN
CiAJaW50IGksIHJldDsNCiANCkBAIC00OTAsNyArNDkwLDcgQEAgc3RhdGljIHZvaWQgZGZfdjNf
Nl9wbWNfZ2V0X2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIH0NCiANCiBjb25z
dCBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNzIGRmX3YzXzZfZnVuY3MgPSB7DQotCS5pbml0ID0gZGZf
djNfNl9pbml0LA0KKwkuaW5pdCA9IGRmX3YzXzZfc3dfaW5pdCwNCiAJLmVuYWJsZV9icm9hZGNh
c3RfbW9kZSA9IGRmX3YzXzZfZW5hYmxlX2Jyb2FkY2FzdF9tb2RlLA0KIAkuZ2V0X2ZiX2NoYW5u
ZWxfbnVtYmVyID0gZGZfdjNfNl9nZXRfZmJfY2hhbm5lbF9udW1iZXIsDQogCS5nZXRfaGJtX2No
YW5uZWxfbnVtYmVyID0gZGZfdjNfNl9nZXRfaGJtX2NoYW5uZWxfbnVtYmVyLA0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jDQppbmRleCAwYWZiY2M4MGVhNjEuLmQxZTdmNjIzZWVhOCAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMNCkBAIC0xMDM0LDYgKzEwMzQsOCBAQCBzdGF0
aWMgaW50IHNvYzE1X2NvbW1vbl9zd19pbml0KHZvaWQgKmhhbmRsZSkNCiAJaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkNCiAJCXhncHVfYWlfbWFpbGJveF9hZGRfaXJxX2lkKGFkZXYpOw0KIA0K
KwlhZGV2LT5kZl9mdW5jcy0+aW5pdChhZGV2KTsNCisNCiAJcmV0dXJuIDA7DQogfQ0KIA0KQEAg
LTEwNjcsNyArMTA2OSw2IEBAIHN0YXRpYyB2b2lkIHNvYzE1X2Rvb3JiZWxsX3JhbmdlX2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogc3RhdGljIGludCBzb2MxNV9jb21tb25faHdf
aW5pdCh2b2lkICpoYW5kbGUpDQogew0KIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCi0JaW50IHJldDsNCiANCiAJLyogZW5hYmxl
IHBjaWUgZ2VuMi8zIGxpbmsgKi8NCiAJc29jMTVfcGNpZV9nZW4zX2VuYWJsZShhZGV2KTsNCkBA
IC0xMDgyLDggKzEwODMsNiBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9od19pbml0KHZvaWQg
KmhhbmRsZSkNCiAJaWYgKGFkZXYtPm5iaW9fZnVuY3MtPnJlbWFwX2hkcF9yZWdpc3RlcnMpDQog
CQlhZGV2LT5uYmlvX2Z1bmNzLT5yZW1hcF9oZHBfcmVnaXN0ZXJzKGFkZXYpOw0KIA0KLQlhZGV2
LT5kZl9mdW5jcy0+aW5pdChhZGV2KTsNCi0NCiAJLyogZW5hYmxlIHRoZSBkb29yYmVsbCBhcGVy
dHVyZSAqLw0KIAlzb2MxNV9lbmFibGVfZG9vcmJlbGxfYXBlcnR1cmUoYWRldiwgdHJ1ZSk7DQog
CS8qIEhXIGRvb3JiZWxsIHJvdXRpbmcgcG9saWN5OiBkb29yYmVsbCB3cml0aW5nIG5vdA0KLS0g
DQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
