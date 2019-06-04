Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47933D55
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 04:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1541893D1;
	Tue,  4 Jun 2019 02:52:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CB5893CD
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 02:52:51 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2402.namprd12.prod.outlook.com (52.132.11.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 02:52:50 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 02:52:50 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Topic: [PATCH 6/6] drm/amdkfd: Fix sdma queue allocate race condition
Thread-Index: AQHVGoCZxEkGk4j2aU+Skm0P2XUq0Q==
Date: Tue, 4 Jun 2019 02:52:50 +0000
Message-ID: <1559616755-13116-6-git-send-email-Oak.Zeng@amd.com>
References: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fda527a7-cd6e-41d8-39c6-08d6e897bb47
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2402; 
x-ms-traffictypediagnostic: BL0PR12MB2402:
x-microsoft-antispam-prvs: <BL0PR12MB240271865FF307B04054D4B980150@BL0PR12MB2402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(446003)(11346002)(66066001)(68736007)(2351001)(8676002)(305945005)(53936002)(26005)(72206003)(7736002)(476003)(2616005)(14444005)(256004)(81156014)(76176011)(4326008)(86362001)(25786009)(386003)(6506007)(102836004)(2501003)(186003)(6916009)(5640700003)(36756003)(52116002)(8936002)(6512007)(6436002)(316002)(71200400001)(71190400001)(2906002)(54906003)(50226002)(478600001)(3846002)(6116002)(486006)(6486002)(5660300002)(64756008)(14454004)(66556008)(66446008)(81166006)(99286004)(66946007)(66476007)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2402;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sX0DPJjidvUvIGjoYELPGA+y+U43Ekx5RT/REE9ETSwN270T9amqVfnoGvNpNFbRW/A0OIFljxXbIrn7aS+hTMfLeqYHfXTbBygu98IS/6JIYorsLPsHkFykWqDEEymWxjSvauNLWpOZvAonZ8KBcp69WvRlHqHuamPqXh3qRoYAPhA7Y5+7wlMmmVOhZRz8jDQke59lrjmErw1iSjt5qKpIg3atpsYO/vzim6YtJXFBXiPc2SwZ5El2MRYMR0RF0Otf/INrRuREVbAl18wHT4LA5lHybFekvGJXwV1iLO/1WljKXE7wPXEhN9l1jz5d4J+4pLN4YmAVVj7nFryiaGNoCfklGYR3yDMpv2RWK/ujK4RHjEkdcdBFogGcYbOREoAI2FQVNm0x6xkzbD0SJFF21LfQN/+ybkLXsrzQD/w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda527a7-cd6e-41d8-39c6-08d6e897bb47
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 02:52:50.3144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21e0MPvibLmCQoJCsZheBwDKpOltBs9ert7Ei3sDBy0=;
 b=b0CN+sZyPHdqTcby3moKN4hVM19vNfy5smBnhc5r98ue7Tial/J+/WQPv9u5YsPmbHw/7F+r6yESJ/JhNLv/6Jnu5tfG2h4GLIk3SI7hoH5y8VsZ5n8PId5EI82zquuYRrEj7OgdwAraflEGNXBOlpSCMLUtbNqZmboiWAxZ0io=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
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
YW5hZ2VyLmMNCmluZGV4IDJjZDQ3ZTMuLjhjNjZhYmQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC01Myw2
ICs1Myw4IEBAIHN0YXRpYyBpbnQgbWFwX3F1ZXVlc19jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVl
X21hbmFnZXIgKmRxbSk7DQogDQogc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0
cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCQlzdHJ1Y3QgcXVldWUgKnEpOw0K
K3N0YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZV9sb2NrZWQoc3RydWN0IGRldmljZV9x
dWV1ZV9tYW5hZ2VyICpkcW0sDQorCQkJCXN0cnVjdCBxdWV1ZSAqcSk7DQogDQogc3RhdGljIGlu
bGluZSB2b2lkIGRlYWxsb2NhdGVfaHFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFt
LA0KIAkJCQlzdHJ1Y3QgcXVldWUgKnEpOw0KQEAgLTQzNiwxMCArNDM4LDEwIEBAIHN0YXRpYyBp
bnQgZGVzdHJveV9xdWV1ZV9ub2Nwc2NoX2xvY2tlZChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSwNCiAJCWRlYWxsb2NhdGVfaHFkKGRxbSwgcSk7DQogCX0gZWxzZSBpZiAocS0+cHJv
cGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEpIHsNCiAJCWRxbS0+c2RtYV9xdWV1
ZV9jb3VudC0tOw0KLQkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQorCQlkZWFsbG9j
YXRlX3NkbWFfcXVldWVfbG9ja2VkKGRxbSwgcSk7DQogCX0gZWxzZSBpZiAocS0+cHJvcGVydGll
cy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUFfWEdNSSkgew0KIAkJZHFtLT54Z21pX3NkbWFf
cXVldWVfY291bnQtLTsNCi0JCWRlYWxsb2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KKwkJZGVh
bGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEpOw0KIAl9IGVsc2Ugew0KIAkJcHJfZGVi
dWcoInEtPnByb3BlcnRpZXMudHlwZSAlZCBpcyBpbnZhbGlkXG4iLA0KIAkJCQlxLT5wcm9wZXJ0
aWVzLnR5cGUpOw0KQEAgLTkwOSw5ICs5MTEsMTIgQEAgc3RhdGljIGludCBhbGxvY2F0ZV9zZG1h
X3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIHsNCiAJaW50IGJpdDsN
CiANCisJZHFtX2xvY2soZHFtKTsNCiAJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVF
VUVfVFlQRV9TRE1BKSB7DQotCQlpZiAoZHFtLT5zZG1hX2JpdG1hcCA9PSAwKQ0KKwkJaWYgKGRx
bS0+c2RtYV9iaXRtYXAgPT0gMCkgew0KKwkJCWRxbV91bmxvY2soZHFtKTsNCiAJCQlyZXR1cm4g
LUVOT01FTTsNCisJCX0NCiAJCWJpdCA9IF9fZmZzNjQoZHFtLT5zZG1hX2JpdG1hcCk7DQogCQlk
cW0tPnNkbWFfYml0bWFwICY9IH4oMVVMTCA8PCBiaXQpOw0KIAkJcS0+c2RtYV9pZCA9IGJpdDsN
CkBAIC05MjAsOCArOTI1LDEwIEBAIHN0YXRpYyBpbnQgYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJCXEtPnByb3BlcnRpZXMuc2RtYV9xdWV1
ZV9pZCA9IHEtPnNkbWFfaWQgLw0KIAkJCQlnZXRfbnVtX3NkbWFfZW5naW5lcyhkcW0pOw0KIAl9
IGVsc2UgaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkp
IHsNCi0JCWlmIChkcW0tPnhnbWlfc2RtYV9iaXRtYXAgPT0gMCkNCisJCWlmIChkcW0tPnhnbWlf
c2RtYV9iaXRtYXAgPT0gMCkgew0KKwkJCWRxbV91bmxvY2soZHFtKTsNCiAJCQlyZXR1cm4gLUVO
T01FTTsNCisJCX0NCiAJCWJpdCA9IF9fZmZzNjQoZHFtLT54Z21pX3NkbWFfYml0bWFwKTsNCiAJ
CWRxbS0+eGdtaV9zZG1hX2JpdG1hcCAmPSB+KDFVTEwgPDwgYml0KTsNCiAJCXEtPnNkbWFfaWQg
PSBiaXQ7DQpAQCAtOTM3LDEzICs5NDQsMTQgQEAgc3RhdGljIGludCBhbGxvY2F0ZV9zZG1hX3F1
ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCQlnZXRfbnVtX3hnbWlf
c2RtYV9lbmdpbmVzKGRxbSk7DQogCX0NCiANCisJZHFtX3VubG9jayhkcW0pOw0KIAlwcl9kZWJ1
ZygiU0RNQSBlbmdpbmUgaWQ6ICVkXG4iLCBxLT5wcm9wZXJ0aWVzLnNkbWFfZW5naW5lX2lkKTsN
CiAJcHJfZGVidWcoIlNETUEgcXVldWUgaWQ6ICVkXG4iLCBxLT5wcm9wZXJ0aWVzLnNkbWFfcXVl
dWVfaWQpOw0KIA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIHZvaWQgZGVhbGxvY2F0ZV9z
ZG1hX3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KK3N0YXRpYyB2b2lk
IGRlYWxsb2NhdGVfc2RtYV9xdWV1ZV9sb2NrZWQoc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2Vy
ICpkcW0sDQogCQkJCXN0cnVjdCBxdWV1ZSAqcSkNCiB7DQogCWlmIChxLT5wcm9wZXJ0aWVzLnR5
cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQSkgew0KQEAgLTk1Nyw2ICs5NjUsMTQgQEAgc3RhdGlj
IHZvaWQgZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAq
ZHFtLA0KIAl9DQogfQ0KIA0KK3N0YXRpYyB2b2lkIGRlYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCisJCQkJc3RydWN0IHF1ZXVlICpxKQ0KK3sN
CisJZHFtX2xvY2soZHFtKTsNCisJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tlZChkcW0sIHEp
Ow0KKwlkcW1fdW5sb2NrKGRxbSk7DQorfQ0KKw0KIC8qDQogICogRGV2aWNlIFF1ZXVlIE1hbmFn
ZXIgaW1wbGVtZW50YXRpb24gZm9yIGNwIHNjaGVkdWxlcg0KICAqLw0KQEAgLTEzNTMsMTAgKzEz
NjksMTAgQEAgc3RhdGljIGludCBkZXN0cm95X3F1ZXVlX2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVl
dWVfbWFuYWdlciAqZHFtLA0KIA0KIAlpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVV
RV9UWVBFX1NETUEpIHsNCiAJCWRxbS0+c2RtYV9xdWV1ZV9jb3VudC0tOw0KLQkJZGVhbGxvY2F0
ZV9zZG1hX3F1ZXVlKGRxbSwgcSk7DQorCQlkZWFsbG9jYXRlX3NkbWFfcXVldWVfbG9ja2VkKGRx
bSwgcSk7DQogCX0gZWxzZSBpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBF
X1NETUFfWEdNSSkgew0KIAkJZHFtLT54Z21pX3NkbWFfcXVldWVfY291bnQtLTsNCi0JCWRlYWxs
b2NhdGVfc2RtYV9xdWV1ZShkcW0sIHEpOw0KKwkJZGVhbGxvY2F0ZV9zZG1hX3F1ZXVlX2xvY2tl
ZChkcW0sIHEpOw0KIAl9DQogDQogCWxpc3RfZGVsKCZxLT5saXN0KTsNCkBAIC0xNTgyLDEwICsx
NTk4LDEwIEBAIHN0YXRpYyBpbnQgcHJvY2Vzc190ZXJtaW5hdGlvbl9jcHNjaChzdHJ1Y3QgZGV2
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
