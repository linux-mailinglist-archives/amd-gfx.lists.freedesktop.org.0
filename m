Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70137298D6
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 15:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EC66E0DE;
	Fri, 24 May 2019 13:23:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810080.outbound.protection.outlook.com [40.107.81.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F26E0BB
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 13:23:51 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1245.namprd12.prod.outlook.com (10.169.206.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 13:23:49 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 13:23:49 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation
Thread-Topic: [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation
Thread-Index: AQHVEjPs965QZixG9kSkWyMd73NnpA==
Date: Fri, 24 May 2019 13:23:49 +0000
Message-ID: <20190524132326.7436-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:207:3c::17) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52362ce6-9567-4006-79c8-08d6e04b0e5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1245; 
x-ms-traffictypediagnostic: MWHPR12MB1245:
x-microsoft-antispam-prvs: <MWHPR12MB1245C3061C292DC27EF58E13F7020@MWHPR12MB1245.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(346002)(396003)(136003)(199004)(189003)(53936002)(2501003)(2906002)(5660300002)(3846002)(6116002)(66066001)(36756003)(25786009)(2351001)(4326008)(6512007)(71200400001)(71190400001)(66946007)(6436002)(64756008)(66556008)(73956011)(66476007)(7736002)(6506007)(386003)(86362001)(305945005)(102836004)(66446008)(52116002)(316002)(486006)(8936002)(14444005)(50226002)(256004)(99286004)(186003)(14454004)(6486002)(26005)(8676002)(2616005)(68736007)(476003)(81166006)(81156014)(5640700003)(478600001)(6916009)(72206003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1245;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wzZAuRFCmDNboenld++0W8olLWZgs5jZzzdBteK1UTLHC9uKtM9jMqR78m1kvcfijlMprW9z1ywYcUc+Ug1PXTXsvGL1yhGoeD2gsydLl0aW5OTUgjxC/pjelDad3R+rW/C633POvWqQtOAmm00Z0wrzRIq/89fZmNUmZnOSdkIUM50V1derT4BVXa+t4C6cSvILaViD9pLCowTDe0e2axZMIVWiZqtbX2QDRldujyf+ow+OH7wj+WUO4oU+BlAmAZXZI1gwLHbS7WpA0kyhkE7Ah+8POfhH3O1nJUcYNgOTSvz8ifmXQShZHQURChONTbQL4099EZvL6rtWpk/T3pHW+O49JzItlNEavHmOB/egblNFaPgy5ahRkHz/oYnFFc7WHVyGb7CJvWahNImnkFw7XM9xQ5epcz37cdy2ELQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52362ce6-9567-4006-79c8-08d6e04b0e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 13:23:49.4366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1245
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hATcUKrTAdJIU2kYXNlN+w+PWtwgzRY/xEeCVvFsSHU=;
 b=d5asM9b+/nAIjA0KWdPn0iinW7tUfX+ga8ihgacZ9laFznpcfJMbSWUCGpd1qAZpZ9nNL01lmvmF+wA20s3SyRp3yLqjhMAk+F5ddR1g95b7QyLNZgLuu21OQmUDmeO/sDDLV5xo6ZMFrxN13CcgQsEMWRDhULeMmvZ8kCziHVk=
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

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQog
RG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCAgICAgICAgICAgICB8ICA5ICsrKysrKysrDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQ0KDQpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1
L2FtZGdwdS5yc3QNCmluZGV4IGE3NDBlNDkxZGZjYy4uY2FjZmNmYWQyMzU2IDEwMDY0NA0KLS0t
IGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUv
YW1kZ3B1LnJzdA0KQEAgLTcwLDYgKzcwLDE1IEBAIEludGVycnVwdCBIYW5kbGluZw0KIC4uIGtl
cm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMNCiAgICA6
aW50ZXJuYWw6DQogDQorQU1ER1BVIFhHTUkgU3VwcG9ydA0KKz09PT09PT09PT09PT09PT09PT0N
CisNCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hn
bWkuYw0KKyAgIDpkb2M6IEFNREdQVSBYR01JIFN1cHBvcnQNCisNCisuLiBrZXJuZWwtZG9jOjog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYw0KKyAgIDppbnRlcm5hbDoN
CisNCiBHUFUgUG93ZXIvVGhlcm1hbCBDb250cm9scyBhbmQgTW9uaXRvcmluZw0KID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV94Z21pLmMNCmluZGV4IGU0OGU5Mzk0ZjFlNC4uZDExZWJhMDllYWRkIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYw0KQEAgLTQwLDYgKzQw
LDM0IEBAIHZvaWQgKmFtZGdwdV94Z21pX2hpdmVfdHJ5X2xvY2soc3RydWN0IGFtZGdwdV9oaXZl
X2luZm8gKmhpdmUpDQogCXJldHVybiAmaGl2ZS0+ZGV2aWNlX2xpc3Q7DQogfQ0KIA0KKy8qKg0K
KyAqIERPQzogQU1ER1BVIFhHTUkgU3VwcG9ydA0KKyAqDQorICogWEdNSSBpcyBhIGhpZ2ggc3Bl
ZWQgaW50ZXJjb25uZWN0IHRoYXQgam9pbnMgbXVsdGlwbGUgR1BVIGNhcmRzDQorICogaW50byBh
IGhvbW9nZW5lb3VzIG1lbW9yeSBzcGFjZSB0aGF0IGlzIG9yZ2FuaXplZCBieSBhIGNvbGxlY3Rp
dmUNCisgKiBoaXZlIElEIGFuZCBpbmRpdmlkdWFsIG5vZGUgSURzLCBib3RoIG9mIHdoaWNoIGFy
ZSA2NC1iaXQgbnVtYmVycy4NCisgKg0KKyAqIFRoZSBmaWxlIHhnbWlfZGV2aWNlX2lkIGNvbnRh
aW5zIHRoZSB1bmlxdWUgcGVyIEdQVSBkZXZpY2UgSUQgYW5kDQorICogaXMgc3RvcmVkIGluIHRo
ZSAvc3lzL2NsYXNzL2RybS9jYXJkJHtjYXJkbm99L2RldmljZS8gZGlyZWN0b3J5Lg0KKyAqDQor
ICogSW5zaWRlIHRoZSBkZXZpY2UgZGlyZWN0b3J5IGEgc3ViLWRpcmVjdG9yeSAneGdtaV9oaXZl
X2luZm8nIGlzDQorICogY3JlYXRlZCB3aGljaCBjb250YWlucyB0aGUgaGl2ZSBJRCBhbmQgdGhl
IGxpc3Qgb2Ygbm9kZXMuDQorICoNCisgKiBUaGUgaGl2ZSBJRCBpcyBzdG9yZWQgaW46DQorICog
ICAvc3lzL2NsYXNzL2RybS9jYXJkJHtjYXJkbm99L2RldmljZS94Z21pX2hpdmVfaW5mby94Z21p
X2hpdmVfaWQNCisgKg0KKyAqIFRoZSBub2RlIGluZm9ybWF0aW9uIGlzIHN0b3JlZCBpbiBudW1i
ZXJlZCBkaXJlY3RvcmllczoNCisgKiAgIC9zeXMvY2xhc3MvZHJtL2NhcmQke2NhcmRub30vZGV2
aWNlL3hnbWlfaGl2ZV9pbmZvL25vZGUke25vZGVub30veGdtaV9kZXZpY2VfaWQNCisgKg0KKyAq
IEVhY2ggZGV2aWNlIGhhcyB0aGVpciBvd24geGdtaV9oaXZlX2luZm8gZGlyZWN0aW9uIHdpdGgg
YSBtaXJyb3INCisgKiBzZXQgb2Ygbm9kZSBzdWItZGlyZWN0b3JpZXMuDQorICoNCisgKiBUaGUg
WEdNSSBtZW1vcnkgc3BhY2UgaXMgYnVpbHQgYnkgY29udGlndW91c2x5IGFkZGluZyB0aGUgcG93
ZXIgb2YNCisgKiB0d28gcGFkZGVkIFZSQU0gc3BhY2UgZnJvbSBlYWNoIG5vZGUgdG8gZWFjaCBv
dGhlci4NCisgKg0KKyAqLw0KKw0KKw0KIHN0YXRpYyBzc2l6ZV90IGFtZGdwdV94Z21pX3Nob3df
aGl2ZV9pZChzdHJ1Y3QgZGV2aWNlICpkZXYsDQogCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAq
YXR0ciwgY2hhciAqYnVmKQ0KIHsNCi0tIA0KMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
