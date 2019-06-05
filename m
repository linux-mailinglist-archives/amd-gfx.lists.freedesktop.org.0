Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E59360CD
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 18:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C714189D2F;
	Wed,  5 Jun 2019 16:06:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780075.outbound.protection.outlook.com [40.107.78.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1064A89D2F
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 16:06:53 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2532.namprd12.prod.outlook.com (52.132.11.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 16:06:50 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 16:06:50 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Topic: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Index: AQHVG7iv6XLS2LOtkEWruQ4XfILHuA==
Date: Wed, 5 Jun 2019 16:06:50 +0000
Message-ID: <1559750793-16608-6-git-send-email-Oak.Zeng@amd.com>
References: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9793fc90-a80f-41cf-81a8-08d6e9cfd155
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2532; 
x-ms-traffictypediagnostic: BL0PR12MB2532:
x-microsoft-antispam-prvs: <BL0PR12MB25327BA2C6D23EDB490109E380160@BL0PR12MB2532.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(199004)(189003)(478600001)(54906003)(3846002)(6916009)(186003)(72206003)(71190400001)(6486002)(5640700003)(66066001)(99286004)(52116002)(6512007)(6116002)(71200400001)(6436002)(8936002)(386003)(66946007)(6506007)(305945005)(4326008)(81156014)(7736002)(81166006)(66556008)(73956011)(66476007)(66446008)(2906002)(14444005)(256004)(64756008)(25786009)(8676002)(76176011)(26005)(50226002)(86362001)(14454004)(53936002)(316002)(102836004)(2501003)(11346002)(2616005)(2351001)(36756003)(476003)(486006)(68736007)(446003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2532;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /4f+UsmhJYPrsLkhrRY8mY6EC+9h5PF5HLwIKaZ3W3T81zuukToncBKXtfoorjEL/CeMBOkxtmlEVOb0H1Y18nCjUvHCzFm13/AKY48b6IlfEBz600k9tjFV6f6TZSaVdz4AvstcsvxbjaLYOhStyEs5iJjAXW3P24yK0Phyxe70MUeOHbsqm1gD60n6nCwD6KXKpzrHUbi4E4hzA55d8lOTXyafYySSfzqlU8zufrHafyspDP2EhJr/lPgAlE9zaUZyIPu/nePWYHDqA8XRYn0b9iwWSa9ZS2tQI/agReBVWaVazVXg2dxU67CVcO3AvX/x1tk1YLopyq8j6Qu0Xl1sl5lAE343PIbAb7vmX/MUcPzVPMwFqBq7D/ifY23Mpd450xSSGLOjHL+Rt0s9zZpN7IZdbUF7urSlKGcz9Ms=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9793fc90-a80f-41cf-81a8-08d6e9cfd155
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 16:06:50.1636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuLGWonB+V6cbu0b3Lba9Y0Xm0q7GDEB/BSgKm3n6Po=;
 b=zLEWCKVNgi8JQJPmVCFtxvNEFXAmGLPj9FP09BtBV7N9L/tRBwuH1LEoyUkQnpjF3ujzO/dEPrzvqWiK7YOP9DPEMxycNPD//l4ouzo7itghP5CPRByX0VvL3Rz1SLp+TyxYqNLzx9Gx+tdRuCk/ZjPu7008GmypJvWzBawMl+0=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U0RNQSBxdWV1ZSBhbGxvY2F0aW9uIHJlcXVpcmVzIHRoZSBkcW0gbG9jayBhcyBpdCBtb2RpZnkN
CnRoZSBnbG9iYWwgZHFtIG1lbWJlcnMuIEludHJvZHVjZSBmdW5jdGlvbnMgdG8gYWxsb2NhdGUv
ZGVhbGxvY2F0ZQ0KaW4gbG9ja2VkL3VubG9ja2VkIGNpcmN1bXN0YW5jZS4NCg0KQ2hhbmdlLUlk
OiBJZDMwODQ1MjRjNWY2NWQ5NjI5YjEyY2Y2YjQ4NjJhNzUxNjk0NWNiMQ0KU2lnbmVkLW9mZi1i
eTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiAuLi4vZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jICB8IDM0ICsrKysrKysrKysrKysrKystLS0t
LS0NCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVf
bWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9t
YW5hZ2VyLmMNCmluZGV4IDZiMWEyZWUuLjUyZTRlZGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC01Myw2
ICs1Myw4IEBAIHN0YXRpYyBpbnQgbWFwX3F1ZXVlc19jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVl
X21hbmFnZXIgKmRxbSk7DQogDQogc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0
cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCQlzdHJ1Y3QgcXVldWUgKnEpOw0K
K3N0YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZV9sb2NrZWQoc3RydWN0IGRldmljZV9x
dWV1ZV9tYW5hZ2VyICpkcW0sDQorCQkJCXN0cnVjdCBxdWV1ZSAqcSk7DQogDQogc3RhdGljIGlu
bGluZSB2b2lkIGRlYWxsb2NhdGVfaHFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFt
LA0KIAkJCQlzdHJ1Y3QgcXVldWUgKnEpOw0KQEAgLTQzNCwxMCArNDM2LDEwIEBAIHN0YXRpYyBp
bnQgZGVzdHJveV9xdWV1ZV9ub2Nwc2NoX2xvY2tlZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSwNCiAJCWRlYWxsb2NhdGVfaHFkKGRxbSwgcSk7DQogCX0gZWxzZSBpZiAocS0+cHJv
cGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEpIHsNCiAJCWRxbS0+c2RtYV9xdWV1
ZV9jb3VudC0tOw0KLQkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQorCQlkZWFsbG9j
YXRlX3NkbWFfcXVldWVfbG9ja2VkKGRxbSwgcSk7DQogCX0gZWxzZSBpZiAocS0+cHJvcGVydGll
cy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSSkgew0KIAkJZHFtLT54Z21pX3NkbWFf
cXVldWVfY291bnQtLTsNCi0JCWRlYWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KKwkJZGVh
bGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEpOw0KIAl9IGVsc2Ugew0KIAkJcHJfZGVi
dWcoInEtPnByb3BlcnRpZXMudHlwZSAlZCBpcyBpbnZhbGlkXG4iLA0KIAkJCQlxLT5wcm9wZXJ0
aWVzLnR5cGUpOw0KQEAgLTkxNCw5ICs5MTYsMTIgQEAgc3RhdGljIGludCBhbGxvY2F0ZV9zZG1h
X3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIHsNCiAJaW50IGJpdDsN
CiANCisJZHFtX2xvY2soZHFtKTsNCiAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVF
VUVfVFlQRV9TRE1BKSB7DQotCQlpZiAoZHFtLT5zZG1hX2JpdG1hcCA9PSAwKQ0KKwkJaWYgKGRx
bS0+c2RtYV9iaXRtYXAgPT0gMCkgew0KKwkJCWRxbV91bmxvY2soZHFtKTsNCiAJCQlyZXR1cm4g
LUVOT01FTTsNCisJCX0NCiAJCWJpdCA9IF9fZmZzNjQoZHFtLT5zZG1hX2JpdG1hcCk7DQogCQlk
cW0tPnNkbWFfYml0bWFwICY9IH4oMVVMTCA8PCBiaXQpOw0KIAkJcS0+c2RtYV9pZCA9IGJpdDsN
CkBAIC05MjUsOCArOTMwLDEwIEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJCXEtPnByb3BlcnRpZXMuc2RtYV9xdWV1
ZV9pZCA9IHEtPnNkbWFfaWQgLw0KIAkJCQlnZXRfbnVtX3NkbWFfZW5naW5lcyhkcW0pOw0KIAl9
IGVsc2UgaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkp
IHsNCi0JCWlmIChkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPT0gMCkNCisJCWlmIChkcW0tPnhnbWlf
c2RtYV9iaXRtYXAgPT0gMCkgew0KKwkJCWRxbV91bmxvY2soZHFtKTsNCiAJCQlyZXR1cm4gLUVO
T01FTTsNCisJCX0NCiAJCWJpdCA9IF9fZmZzNjQoZHFtLT54Z21pX3NkbWFfYml0bWFwKTsNCiAJ
CWRxbS0+eGdtaV9zZG1hX2JpdG1hcCAmPSB+KDFVTEwgPDwgYml0KTsNCiAJCXEtPnNkbWFfaWQg
PSBiaXQ7DQpAQCAtOTQyLDEzICs5NDksMTQgQEAgc3RhdGljIGludCBhbGxvY2F0ZV9zZG1hX3F1
ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCQlnZXRfbnVtX3hnbWlf
c2RtYV9lbmdpbmVzKGRxbSk7DQogCX0NCiANCisJZHFtX3VubG9jayhkcW0pOw0KIAlwcl9kZWJ1
ZygiU0RNQSBlbmdpbmUgaWQ6ICVkXG4iLCBxLT5wcm9wZXJ0aWVzLnNkbWFfZW5naW5lX2lkKTsN
CiAJcHJfZGVidWcoIlNETUEgcXVldWUgaWQ6ICVkXG4iLCBxLT5wcm9wZXJ0aWVzLnNkbWFfcXVl
dWVfaWQpOw0KIA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9z
ZG1hX3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KK3N0YXRpYyB2b2lk
IGRlYWxsb2NhdGVfc2RtYV9xdWV1ZV9sb2NrZWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2Vy
ICpkcW0sDQogCQkJCXN0cnVjdCBxdWV1ZSAqcSkNCiB7DQogCWlmIChxLT5wcm9wZXJ0aWVzLnR5
cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSkgew0KQEAgLTk2Miw2ICs5NzAsMTQgQEAgc3RhdGlj
IHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAq
ZHFtLA0KIAl9DQogfQ0KIA0KK3N0YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCisJCQkJc3RydWN0IHF1ZXVlICpxKQ0KK3sN
CisJZHFtX2xvY2soZHFtKTsNCisJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEp
Ow0KKwlkcW1fdW5sb2NrKGRxbSk7DQorfQ0KKw0KIC8qDQogICogRGV2aWNlIFF1ZXVlIE1hbmFn
ZXIgaW1wbGVtZW50YXRpb24gZm9yIGNwIHNjaGVkdWxlcg0KICAqLw0KQEAgLTEzNTYsMTAgKzEz
NzIsMTAgQEAgc3RhdGljIGludCBkZXN0cm95X3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVl
dWVfbWFuYWdlciAqZHFtLA0KIA0KIAlpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVV
RV9UWVBFX1NETUEpIHsNCiAJCWRxbS0+c2RtYV9xdWV1ZV9jb3VudC0tOw0KLQkJZGVhbGxvY2F0
ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQorCQlkZWFsbG9jYXRlX3NkbWFfcXVldWVfbG9ja2VkKGRx
bSwgcSk7DQogCX0gZWxzZSBpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBF
X1NETUFfWEdNSSkgew0KIAkJZHFtLT54Z21pX3NkbWFfcXVldWVfY291bnQtLTsNCi0JCWRlYWxs
b2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KKwkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tl
ZChkcW0sIHEpOw0KIAl9DQogDQogCWxpc3RfZGVsKCZxLT5saXN0KTsNCkBAIC0xNTg1LDEwICsx
NjAxLDEwIEBAIHN0YXRpYyBpbnQgcHJvY2Vzc190ZXJtaW5hdGlvbl9jcHNjaChzdHJ1Y3QgZGV2
aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJbGlzdF9mb3JfZWFjaF9lbnRyeShxLCAmcXBkLT5x
dWV1ZXNfbGlzdCwgbGlzdCkgew0KIAkJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVF
VUVfVFlQRV9TRE1BKSB7DQogCQkJZHFtLT5zZG1hX3F1ZXVlX2NvdW50LS07DQotCQkJZGVhbGxv
Y2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQorCQkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tl
ZChkcW0sIHEpOw0KIAkJfSBlbHNlIGlmIChxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVF
X1RZUEVfU0RNQV9YR01JKSB7DQogCQkJZHFtLT54Z21pX3NkbWFfcXVldWVfY291bnQtLTsNCi0J
CQlkZWFsbG9jYXRlX3NkbWFfcXVldWUoZHFtLCBxKTsNCisJCQlkZWFsbG9jYXRlX3NkbWFfcXVl
dWVfbG9ja2VkKGRxbSwgcSk7DQogCQl9DQogDQogCQlpZiAocS0+cHJvcGVydGllcy5pc19hY3Rp
dmUpDQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
