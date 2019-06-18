Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD4C4A9C3
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 20:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5A6E215;
	Tue, 18 Jun 2019 18:26:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770045.outbound.protection.outlook.com [40.107.77.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A566E215
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 18:26:05 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1695.namprd12.prod.outlook.com (10.172.55.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 18 Jun 2019 18:26:01 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 18:26:01 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Indentation and simplification fixes for DF
 driver
Thread-Topic: [PATCH] drm/amd/amdgpu: Indentation and simplification fixes for
 DF driver
Thread-Index: AQHVJgNIWWoeALhZZkSVKn8cngEJ1A==
Date: Tue, 18 Jun 2019 18:26:01 +0000
Message-ID: <20190618182545.13640-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:91::35) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be801aac-50cd-4de2-b6b2-08d6f41a6a6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1695; 
x-ms-traffictypediagnostic: MWHPR12MB1695:
x-microsoft-antispam-prvs: <MWHPR12MB16953647276CC952243085ADF7EA0@MWHPR12MB1695.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(136003)(346002)(376002)(39860400002)(366004)(396003)(189003)(199004)(1076003)(99286004)(53936002)(316002)(3846002)(66476007)(6436002)(26005)(66556008)(71200400001)(72206003)(81166006)(71190400001)(2616005)(81156014)(66066001)(73956011)(4326008)(50226002)(256004)(14444005)(86362001)(68736007)(66946007)(476003)(486006)(6486002)(8936002)(66446008)(8676002)(52116002)(5660300002)(6916009)(5640700003)(64756008)(25786009)(186003)(102836004)(6512007)(6116002)(6506007)(386003)(2906002)(14454004)(36756003)(2501003)(2351001)(305945005)(478600001)(7736002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1695;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GLEhyiq76EPkRXt18qJi8e1RTholOUJ6sfvU/8Hx82puB8Pvc98Vs0nHck6PnFTua7TQxVpSfyho52P9QPvkM3NVn0uevc3Ym1jATIUHSNBeDgdAQlXN9a9Do6AZrsMrZvoxPioNo+kzR0XGrn+b2y7g8OVO6I0COPaZ7anZN62ZgON0u5S3kutuhV1NwM+Qq32KAqE+9fIUuzFR+H2dI/AlBsFIO/iFqtCu7pa2yO7WqcyDNI+74Rk/7K2qw6U5DdfYfvXFK5oiORneFK1TsM2K2zttpLrjTKMltUatZPVlywI1/+xY/k6ozZM9bw81z24+A2ON3ARH9sJ3IUzVYXyuNG+oO6q6x6Lk4nZmYO4p6t9KIU2sHtTcd0nm6YQAfWl9AwLqCTWlpoL3iUw+JmIMscFUKl0+U6BKAe7bMWw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be801aac-50cd-4de2-b6b2-08d6f41a6a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 18:26:01.5828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1695
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxuRgKPruNgwMd10gYU0Xon2tSyuhpEQKrvJkliJyH8=;
 b=i42f64YGWcai1Kns+H4Ge0rUIQBsKUCUIYDVV4gspFejvTNxO9aodEUReURo0tJokCwxwYWG2iLWtx5Wmt4001FeD+PDVfGWURtzLbz7B9ot8fxIPZESm87TQ8VC2vmT8eXZfmKCtoi4Tkcd9giRXU75xoDYSwg1g3AhZefuvLQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWlub3IgaW5kZW50YXRpb24gYW5kIHNpbXBsaWZpY2F0aW9ucyBmb3IgdGhlIERGIDMuNiBkcml2
ZXIuICBObw0KZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVu
aXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kZl92M182LmMgfCA1MCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGZfdjNfNi5jDQppbmRleCBlMDc5ZWUwNjZkODcuLjIxYjIxNGIyZDY1MiAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQpAQCAtMjcsOCArMjcsOCBAQA0KICNp
bmNsdWRlICJkZi9kZl8zXzZfb2Zmc2V0LmgiDQogI2luY2x1ZGUgImRmL2RmXzNfNl9zaF9tYXNr
LmgiDQogDQotc3RhdGljIHUzMiBkZl92M182X2NoYW5uZWxfbnVtYmVyW10gPSB7MSwgMiwgMCwg
NCwgMCwgOCwgMCwNCi0JCQkJICAgICAgIDE2LCAzMiwgMCwgMCwgMCwgMiwgNCwgOH07DQorc3Rh
dGljIHUzMiBkZl92M182X2NoYW5uZWxfbnVtYmVyW10gPSB7IDEsIDIsIDAsIDQsIDAsIDgsIDAs
DQorCQkJCQkJCQkJCTE2LCAzMiwgMCwgMCwgMCwgMiwgNCwgOH07DQogDQogc3RhdGljIHZvaWQg
ZGZfdjNfNl9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIHsNCkBAIC00Myw5ICs0
MywxMCBAQCBzdGF0aWMgdm9pZCBkZl92M182X2VuYWJsZV9icm9hZGNhc3RfbW9kZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCiAJCXRtcCA9IFJSRUczMl9TT0MxNShERiwgMCwgbW1GYWJy
aWNDb25maWdBY2Nlc3NDb250cm9sKTsNCiAJCXRtcCAmPSB+RmFicmljQ29uZmlnQWNjZXNzQ29u
dHJvbF9fQ2ZnUmVnSW5zdEFjY0VuX01BU0s7DQogCQlXUkVHMzJfU09DMTUoREYsIDAsIG1tRmFi
cmljQ29uZmlnQWNjZXNzQ29udHJvbCwgdG1wKTsNCi0JfSBlbHNlDQorCX0gZWxzZSB7DQogCQlX
UkVHMzJfU09DMTUoREYsIDAsIG1tRmFicmljQ29uZmlnQWNjZXNzQ29udHJvbCwNCi0JCQkgICAg
IG1tRmFicmljQ29uZmlnQWNjZXNzQ29udHJvbF9ERUZBVUxUKTsNCisJCQkJCSBtbUZhYnJpY0Nv
bmZpZ0FjY2Vzc0NvbnRyb2xfREVGQVVMVCk7DQorCX0NCiB9DQogDQogc3RhdGljIHUzMiBkZl92
M182X2dldF9mYl9jaGFubmVsX251bWJlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCkBA
IC03OCwxNyArNzksMTMgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl91cGRhdGVfbWVkaXVtX2dyYWlu
X2Nsb2NrX2dhdGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJLyogUHV0IERGIG9u
IGJyb2FkY2FzdCBtb2RlICovDQogCWFkZXYtPmRmX2Z1bmNzLT5lbmFibGVfYnJvYWRjYXN0X21v
ZGUoYWRldiwgdHJ1ZSk7DQogDQotCWlmIChlbmFibGUgJiYgKGFkZXYtPmNnX2ZsYWdzICYgQU1E
X0NHX1NVUFBPUlRfREZfTUdDRykpIHsNCi0JCXRtcCA9IFJSRUczMl9TT0MxNShERiwgMCwgbW1E
Rl9QSUVfQU9OMF9EZkdsb2JhbENsa0dhdGVyKTsNCi0JCXRtcCAmPSB+REZfUElFX0FPTjBfRGZH
bG9iYWxDbGtHYXRlcl9fTUdDR01vZGVfTUFTSzsNCisJdG1wID0gUlJFRzMyX1NPQzE1KERGLCAw
LCBtbURGX1BJRV9BT04wX0RmR2xvYmFsQ2xrR2F0ZXIpOw0KKwl0bXAgJj0gfkRGX1BJRV9BT04w
X0RmR2xvYmFsQ2xrR2F0ZXJfX01HQ0dNb2RlX01BU0s7DQorCWlmIChlbmFibGUgJiYgKGFkZXYt
PmNnX2ZsYWdzICYgQU1EX0NHX1NVUFBPUlRfREZfTUdDRykpDQogCQl0bXAgfD0gREZfVjNfNl9N
R0NHX0VOQUJMRV8xNV9DWUNMRV9ERUxBWTsNCi0JCVdSRUczMl9TT0MxNShERiwgMCwgbW1ERl9Q
SUVfQU9OMF9EZkdsb2JhbENsa0dhdGVyLCB0bXApOw0KLQl9IGVsc2Ugew0KLQkJdG1wID0gUlJF
RzMyX1NPQzE1KERGLCAwLCBtbURGX1BJRV9BT04wX0RmR2xvYmFsQ2xrR2F0ZXIpOw0KLQkJdG1w
ICY9IH5ERl9QSUVfQU9OMF9EZkdsb2JhbENsa0dhdGVyX19NR0NHTW9kZV9NQVNLOw0KKwllbHNl
DQogCQl0bXAgfD0gREZfVjNfNl9NR0NHX0RJU0FCTEU7DQotCQlXUkVHMzJfU09DMTUoREYsIDAs
IG1tREZfUElFX0FPTjBfRGZHbG9iYWxDbGtHYXRlciwgdG1wKTsNCi0JfQ0KKwlXUkVHMzJfU09D
MTUoREYsIDAsIG1tREZfUElFX0FPTjBfRGZHbG9iYWxDbGtHYXRlciwgdG1wKTsNCiANCiAJLyog
RXhpdCBicm9hZGNhc3QgbW9kZSAqLw0KIAlhZGV2LT5kZl9mdW5jcy0+ZW5hYmxlX2Jyb2FkY2Fz
dF9tb2RlKGFkZXYsIGZhbHNlKTsNCkBAIC0xMTMsOCArMTEwLDggQEAgc3RydWN0IGRmX3YzXzZf
ZXZlbnRfbWFzayB7DQogDQogLyogZ2V0IGFzc2lnbmVkIGRmIHBlcmZtb24gY3RyIGFzIGludCAq
Lw0KIHN0YXRpYyB2b2lkIGRmX3YzXzZfcG1jX2NvbmZpZ18yX2NudHIoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQotCQkJCSAgICAgIHVpbnQ2NF90IGNvbmZpZywNCi0JCQkJICAgICAgaW50
ICpjb3VudGVyKQ0KKwkJCQkJCQkJCSAgdWludDY0X3QgY29uZmlnLA0KKwkJCQkJCQkJCSAgaW50
ICpjb3VudGVyKQ0KIHsNCiAJc3RydWN0IGRmX3YzXzZfZXZlbnRfbWFzayAqbWFzazsNCiAJaW50
IGk7DQpAQCAtMjI1LDcgKzIyMiw2IEBAIHN0YXRpYyBpbnQgZGZfdjNfNl9wbWNfYXNzaWduX2Nu
dHIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCWludCBpLCB0YXJnZXRfY250cjsNCiAN
CiAJdGFyZ2V0X2NudHIgPSAtMTsNCi0NCiAJKmlzX2Fzc2lnbmVkID0gMDsNCiANCiAJZGZfdjNf
Nl9wbWNfY29uZmlnXzJfY250cihhZGV2LCBjb25maWcsICZ0YXJnZXRfY250cik7DQpAQCAtMzQ4
LDExICszNDQsMTEgQEAgc3RhdGljIGludCBkZl92M182X2FkZF94Z21pX2xpbmtfY250cihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJCXJldHVybiByZXQ7DQogDQogCXJldCA9IGRmX3Yz
XzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKGFkZXYsDQotCQkJY29uZmlnLA0KLQkJCSZsb19iYXNl
X2FkZHIsDQotCQkJJmhpX2Jhc2VfYWRkciwNCi0JCQkmbG9fdmFsLA0KLQkJCSZoaV92YWwpOw0K
KwkJCQkJCQkJCQljb25maWcsDQorCQkJCQkJCQkJCSZsb19iYXNlX2FkZHIsDQorCQkJCQkJCQkJ
CSZoaV9iYXNlX2FkZHIsDQorCQkJCQkJCQkJCSZsb192YWwsDQorCQkJCQkJCQkJCSZoaV92YWwp
Ow0KIA0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIHJldDsNCkBAIC0zNzksMjAgKzM3NSwxNCBAQCBz
dGF0aWMgaW50IGRmX3YzXzZfc3RhcnRfeGdtaV9saW5rX2NudHIoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsDQogew0KIAl1aW50MzJfdCBsb19iYXNlX2FkZHIsIGhpX2Jhc2VfYWRkciwgbG9f
dmFsOw0KIAl1aW50NjRfdCBjb25maWc7DQotCWludCByZXQ7DQorCWludCByZXQgPSAwOw0KIA0K
IAlpZiAoaW5zdGFuY2UgPCAwIHx8IGluc3RhbmNlID4gMSkNCiAJCXJldHVybiAtRUlOVkFMOw0K
IA0KIAlpZiAoaXNfZW5hYmxlKSB7DQotDQogCQlyZXQgPSBkZl92M182X2FkZF94Z21pX2xpbmtf
Y250cihhZGV2LCBpbnN0YW5jZSk7DQotDQotCQlpZiAocmV0KQ0KLQkJCXJldHVybiByZXQ7DQot
DQogCX0gZWxzZSB7DQotDQogCQljb25maWcgPSBHRVRfSU5TVEFOQ0VfQ09ORklHKGluc3RhbmNl
KTsNCiANCiAJCWRmX3YzXzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKGFkZXYsDQpAQCAtNDA4LDgg
KzM5OCw2IEBAIHN0YXRpYyBpbnQgZGZfdjNfNl9zdGFydF94Z21pX2xpbmtfY250cihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCiAJCWxvX3ZhbCA9IFJSRUczMl9QQ0lFKGxvX2Jhc2VfYWRk
cik7DQogDQogCQlXUkVHMzJfUENJRShsb19iYXNlX2FkZHIsIGxvX3ZhbCB8ICgxVUxMIDw8IDIy
KSk7DQotDQotCQlyZXQgPSAwOw0KIAl9DQogDQogCXJldHVybiByZXQ7DQpAQCAtNDM5LDcgKzQy
Nyw2IEBAIHN0YXRpYyBpbnQgZGZfdjNfNl9zdG9wX3hnbWlfbGlua19jbnRyKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KIAkJZGZfdjNfNl9yZXNldF94Z21pX2xpbmtfY250cihhZGV2LCBp
bnN0YW5jZSk7DQogCQlkZl92M182X3BtY19yZWxlYXNlX2NudHIoYWRldiwgY29uZmlnKTsNCiAJ
fSBlbHNlIHsNCi0NCiAJCWRmX3YzXzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKGFkZXYsDQogCQkJ
CWNvbmZpZywNCiAJCQkJJmxvX2Jhc2VfYWRkciwNCkBAIC00NzUsNyArNDYyLDYgQEAgc3RhdGlj
IGludCBkZl92M182X3BtY19zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDY0
X3QgY29uZmlnLA0KIAkJaWYgKHJldCkNCiAJCQlyZXR1cm4gcmV0Ow0KIA0KLQkJcmV0ID0gMDsN
CiAJCWJyZWFrOw0KIAlkZWZhdWx0Og0KIAkJYnJlYWs7DQotLSANCjIuMjEuMA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
