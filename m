Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870C28D53
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 00:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B9D6E08E;
	Thu, 23 May 2019 22:41:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886CF6E08E
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 22:41:18 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 22:41:17 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 22:41:17 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/8] drm/amdkfd: Add function to set queue gws
Thread-Topic: [PATCH 5/8] drm/amdkfd: Add function to set queue gws
Thread-Index: AQHVEbiiW6+rBVl9kUiAStg72fvROQ==
Date: Thu, 23 May 2019 22:41:17 +0000
Message-ID: <1558651263-3478-5-git-send-email-Oak.Zeng@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a6887af-c953-4c4a-47d0-08d6dfcfc4a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB23395CEBF8A91B64A6F56BB380010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(189003)(199004)(81156014)(8676002)(81166006)(71190400001)(8936002)(305945005)(68736007)(7736002)(50226002)(71200400001)(2351001)(4326008)(53936002)(36756003)(486006)(476003)(99286004)(52116002)(102836004)(5640700003)(25786009)(6512007)(66066001)(6506007)(54906003)(386003)(76176011)(73956011)(14444005)(256004)(2906002)(186003)(66476007)(64756008)(26005)(86362001)(66946007)(66446008)(66556008)(6486002)(2616005)(5660300002)(11346002)(478600001)(6916009)(2501003)(6116002)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eJNU3GLDqbisXY2JOADVJvrZX4u04HANvdh0Mi9drhY8CQwjXKYklZK19HqRtIev3NtOC0/+LNxFjqiHrqtMdEhjcH02/Xp8JgnYYMIPLGdcDc+n5jAFjGuyYXsKRyFZJszcjrnKm8iXVrpd/H0FjsiyA6xRbkZS+wQNAeDemAzAptVzoAKWWX4ajDmoZZLDYBbYDzgECs7UGTTqAQVqdNj49u3btbtRBUR1cxvEumN0TVAo19ls/PgehinKR/ZcumYVc2grewJE8nZNpMxaiBvPDJi+mtJrS7WDr/ixB902deRdZzXaILFHZ23iQE4jptLplHEmIS1l1+2M3b1Uqjfbsh0prmKmLQwjvZIDnQdVFDiMMufD8bljO0rCGmGn3OvPySfXq2m8ODuJBNd4zZ89ICcP7lVqxrVrxEMiDo8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6887af-c953-4c4a-47d0-08d6dfcfc4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 22:41:17.2803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGoUXz+aJrUbQiAHFRLzM6YQYOY5znhb43NnF6DU/YI=;
 b=l45HIlterzS39BNitQnMhFxYX5hQhlUzFY9v0nmZwgWJy4Gx8/tpI+dH4vZAAt0Y0Fa5wUy+6n5SfcWC4wshevDJetxWNuXKBb1/1q/PhoTp8IsZhxuS57tNGs7R1TI1Qj3ZiB2qYcHsRJZPrjK7ISJ7ygf2iZZOrZXk0S1zZig=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng,
 Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGZ1bmN0aW9ucyBpbiBwcm9jZXNzIHF1ZXVlIG1hbmFnZXIgdG8NCnNldC91bnNldCBxdWV1
ZSBnd3MuIEFsc28gc2V0IHByb2Nlc3MncyBudW1iZXINCm9mIGd3cyB1c2VkLiBDdXJyZW50bHkg
b25seSBvbmUgcXVldWUgaW4NCnByb2Nlc3MgY2FuIHVzZSBhbmQgdXNlIGFsbCBnd3MuDQoNCkNo
YW5nZS1JZDogSTAzZTQ4MGM4NjkyZGIzZWFiZmMzYTE4OGNjZTg5MDRkNWQ5NjJhYjcNClNpZ25l
ZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAgICAgfCAgNiArKysNCiAuLi4vZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyB8IDU3ICsrKysrKysr
KysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQppbmRleCA1OTY5ZTM3Li40MGE1YzY3IDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KQEAgLTQ1NCw2ICs0NTQsOSBA
QCBzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyB7DQogICoNCiAgKiBAZGV2aWNlOiBUaGUga2ZkIGRl
dmljZSB0aGF0IGNyZWF0ZWQgdGhpcyBxdWV1ZS4NCiAgKg0KKyAqIEBnd3M6IFBvaW50aW5nIHRv
IGd3cyBrZ2RfbWVtIGlmIHRoaXMgaXMgYSBnd3MgY29udHJvbCBxdWV1ZTsgTlVMTA0KKyAqIG90
aGVyd2lzZS4NCisgKg0KICAqIFRoaXMgc3RydWN0dXJlIHJlcHJlc2VudHMgdXNlciBtb2RlIGNv
bXB1dGUgcXVldWVzLg0KICAqIEl0IGNvbnRhaW5zIGFsbCB0aGUgbmVjZXNzYXJ5IGRhdGEgdG8g
aGFuZGxlIHN1Y2ggcXVldWVzLg0KICAqDQpAQCAtNDc1LDYgKzQ3OCw3IEBAIHN0cnVjdCBxdWV1
ZSB7DQogDQogCXN0cnVjdCBrZmRfcHJvY2VzcwkqcHJvY2VzczsNCiAJc3RydWN0IGtmZF9kZXYJ
CSpkZXZpY2U7DQorCXZvaWQgKmd3czsNCiB9Ow0KIA0KIC8qDQpAQCAtODY4LDYgKzg3Miw4IEBA
IGludCBwcW1fdXBkYXRlX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwg
dW5zaWduZWQgaW50IHFpZCwNCiAJCQlzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAqcCk7DQogaW50
IHBxbV9zZXRfY3VfbWFzayhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2ln
bmVkIGludCBxaWQsDQogCQkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnApOw0KK2ludCBwcW1f
c2V0X2d3cyhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sIHVuc2lnbmVkIGludCBx
aWQsDQorCQkJdm9pZCAqZ3dzKTsNCiBzdHJ1Y3Qga2VybmVsX3F1ZXVlICpwcW1fZ2V0X2tlcm5l
bF9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQogCQkJCQkJdW5zaWdu
ZWQgaW50IHFpZCk7DQogaW50IHBxbV9nZXRfd2F2ZV9zdGF0ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1
ZV9tYW5hZ2VyICpwcW0sDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQppbmRleCBlNjUyZTI1Li41NzY0NDkxIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFu
YWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1
ZV9tYW5hZ2VyLmMNCkBAIC0yNiw2ICsyNiw3IEBADQogI2luY2x1ZGUgImtmZF9kZXZpY2VfcXVl
dWVfbWFuYWdlci5oIg0KICNpbmNsdWRlICJrZmRfcHJpdi5oIg0KICNpbmNsdWRlICJrZmRfa2Vy
bmVsX3F1ZXVlLmgiDQorI2luY2x1ZGUgImFtZGdwdV9hbWRrZmQuaCINCiANCiBzdGF0aWMgaW5s
aW5lIHN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKmdldF9xdWV1ZV9ieV9xaWQoDQogCQkJc3Ry
dWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLCB1bnNpZ25lZCBpbnQgcWlkKQ0KQEAgLTc0
LDYgKzc1LDU1IEBAIHZvaWQga2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2RldmljZShzdHJ1Y3Qg
a2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQpDQogCXBkZC0+YWxyZWFkeV9kZXF1ZXVlZCA9IHRydWU7
DQogfQ0KIA0KK2ludCBwcW1fc2V0X2d3cyhzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpw
cW0sIHVuc2lnbmVkIGludCBxaWQsDQorCQkJdm9pZCAqZ3dzKQ0KK3sNCisJc3RydWN0IGtmZF9k
ZXYgKmRldiA9IE5VTEw7DQorCXN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKnBxbjsNCisJc3Ry
dWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KKwlzdHJ1Y3Qga2dkX21lbSAqbWVtOw0KKwlp
bnQgcmV0Ow0KKw0KKwlwcW4gPSBnZXRfcXVldWVfYnlfcWlkKHBxbSwgcWlkKTsNCisJaWYgKCFw
cW4pIHsNCisJCXByX2VycigiUXVldWUgaWQgZG9lcyBub3QgbWF0Y2ggYW55IGtub3duIHF1ZXVl
XG4iKTsNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9DQorDQorCWlmIChwcW4tPnEpDQorCQlkZXYg
PSBwcW4tPnEtPmRldmljZTsNCisJaWYgKFdBUk5fT04oIWRldikpDQorCQlyZXR1cm4gLUVOT0RF
VjsNCisNCisJcGRkID0ga2ZkX2dldF9wcm9jZXNzX2RldmljZV9kYXRhKGRldiwgcHFtLT5wcm9j
ZXNzKTsNCisJaWYgKCFwZGQpIHsNCisJCXByX2VycigiUHJvY2VzcyBkZXZpY2UgZGF0YSBkb2Vz
bid0IGV4aXN0XG4iKTsNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9DQorDQorCS8qIE9ubHkgYWxs
b3cgb25lIHF1ZXVlIHBlciBwcm9jZXNzIGNhbiBoYXZlIEdXUyBhc3NpZ25lZCAqLw0KKwlpZiAo
Z3dzICYmIHBkZC0+cXBkLm51bV9nd3MpDQorCQlyZXR1cm4gLUVJTlZBTDsNCisNCisJaWYgKCFn
d3MgJiYgcGRkLT5xcGQubnVtX2d3cyA9PSAwKQ0KKwkJcmV0dXJuIC1FSU5WQUw7DQorDQorCWlm
IChnd3MpDQorCQlyZXQgPSBhbWRncHVfYW1ka2ZkX2FkZF9nd3NfdG9fcHJvY2VzcyhwZGQtPnBy
b2Nlc3MtPmtnZF9wcm9jZXNzX2luZm8sDQorCQkJZ3dzLCAmbWVtKTsNCisJZWxzZQ0KKwkJYW1k
Z3B1X2FtZGtmZF9yZW1vdmVfZ3dzX2Zyb21fcHJvY2VzcyhwZGQtPnByb2Nlc3MtPmtnZF9wcm9j
ZXNzX2luZm8sDQorCQkJcHFuLT5xLT5nd3MpOw0KKwlpZiAodW5saWtlbHkocmV0KSkNCisJCXJl
dHVybiByZXQ7DQorDQorCXBxbi0+cS0+Z3dzID0gZ3dzID8gbWVtIDogTlVMTDsNCisJcGRkLT5x
cGQubnVtX2d3cyA9IGd3cyA/IGFtZGdwdV9hbWRrZmRfZ2V0X251bV9nd3MoZGV2LT5rZ2QpIDog
MDsNCisNCisJcmV0dXJuIHBxbi0+cS0+ZGV2aWNlLT5kcW0tPm9wcy51cGRhdGVfcXVldWUocHFu
LT5xLT5kZXZpY2UtPmRxbSwNCisJCQkJCQkJcHFuLT5xKTsNCit9DQorDQogdm9pZCBrZmRfcHJv
Y2Vzc19kZXF1ZXVlX2Zyb21fYWxsX2RldmljZXMoc3RydWN0IGtmZF9wcm9jZXNzICpwKQ0KIHsN
CiAJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KQEAgLTMzMCw2ICszODAsMTMgQEAg
aW50IHBxbV9kZXN0cm95X3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwg
dW5zaWduZWQgaW50IHFpZCkNCiAJCQlpZiAocmV0dmFsICE9IC1FVElNRSkNCiAJCQkJZ290byBl
cnJfZGVzdHJveV9xdWV1ZTsNCiAJCX0NCisNCisJCWlmIChwcW4tPnEtPmd3cykgew0KKwkJCWFt
ZGdwdV9hbWRrZmRfcmVtb3ZlX2d3c19mcm9tX3Byb2Nlc3MocHFtLT5wcm9jZXNzLT5rZ2RfcHJv
Y2Vzc19pbmZvLA0KKwkJCQlwcW4tPnEtPmd3cyk7DQorCQkJcGRkLT5xcGQubnVtX2d3cyA9IDA7
DQorCQl9DQorDQogCQlrZnJlZShwcW4tPnEtPnByb3BlcnRpZXMuY3VfbWFzayk7DQogCQlwcW4t
PnEtPnByb3BlcnRpZXMuY3VfbWFzayA9IE5VTEw7DQogCQl1bmluaXRfcXVldWUocHFuLT5xKTsN
Ci0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
