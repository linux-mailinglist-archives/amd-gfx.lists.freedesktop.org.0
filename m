Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A51949194
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 22:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7C889450;
	Mon, 17 Jun 2019 20:45:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720071.outbound.protection.outlook.com [40.107.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AFC89450
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 20:45:26 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3449.namprd12.prod.outlook.com (20.178.198.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 20:45:24 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 20:45:24 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: improve HMM error -ENOMEM and -EBUSY handling
Thread-Topic: [PATCH] drm/amdgpu: improve HMM error -ENOMEM and -EBUSY handling
Thread-Index: AQHVIx0HLyWDaLKsC02J/23Ep4RctaagVPGA
Date: Mon, 17 Jun 2019 20:45:24 +0000
Message-ID: <c9f285e1-1074-e30c-e53c-51f1f1ca4382@amd.com>
References: <20190615015231.31871-1-Philip.Yang@amd.com>
In-Reply-To: <20190615015231.31871-1-Philip.Yang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21868e1a-79a9-4245-f94d-08d6f364b8fb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3449; 
x-ms-traffictypediagnostic: DM6PR12MB3449:
x-microsoft-antispam-prvs: <DM6PR12MB3449F5B55AFDC00E4C8E4E2592EB0@DM6PR12MB3449.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(39860400002)(396003)(136003)(199004)(189003)(229853002)(71190400001)(102836004)(305945005)(66556008)(7736002)(36756003)(2906002)(73956011)(65826007)(68736007)(66946007)(316002)(66476007)(66446008)(64756008)(6246003)(71200400001)(8936002)(6436002)(6486002)(25786009)(86362001)(2501003)(476003)(2616005)(11346002)(446003)(486006)(186003)(31686004)(76176011)(110136005)(256004)(14444005)(26005)(64126003)(58126008)(8676002)(66066001)(5660300002)(65956001)(3846002)(386003)(52116002)(65806001)(478600001)(53546011)(6506007)(6512007)(99286004)(81156014)(14454004)(81166006)(53936002)(72206003)(31696002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3449;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zIUvsBkbas60p5th/K34wZuMYembZdqIWV9N4JEUg9S9rzD5kZes+OR7K7R9HGUvILWoaM+huwCvpkygWys/6/v+R76XjkmEL9rGJdAQsjl6WBZnw64D5YsQS3qec1LHcw9dMIoTxqHwpIzdtjW/zkb9rECEYRcXIknW3K+BZ352pmVuhrtS9YScGud8BCepkeq37cEhI9RR9TlO2OONQT+G2EVZZX1UPTnOu+cB0QP7Eix4du7e+TVp6ycLGWKG8tVKaPCG9IdyayzzzINaJHYXmH4eXiF1PUXz5ttgDV/JZUhZWX6OPHNoJ01Cfcx9ODToU2ZxcOvNQtBybKKYrhBdOijWPT1EJv+hEXtlFGBtjE0AYrh1sbUw/sy4/nIn5uNAl3gjtMg/2VzbRHCSq9JT1KR1OrWYcgdh8yHq77o=
Content-ID: <300CC6DBA8BC6E469FA826F94333E678@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21868e1a-79a9-4245-f94d-08d6f364b8fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 20:45:24.7153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3449
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHan9gM2/vrEG+JCbBk6pv7p5KPcHW1/kMdfWq1e2gg=;
 b=rPGNLi0/F7jbRQDKDwkuyZ/wteOO2Ha+f0Not2fpu9t2HnhdNtLLG79Xc3MUrT9kZjiEmKUSpvNDXuan2CW5p7XayQro0BuPGREQIxVZiB+VhsfAWCaC1REesaddRV4ZUYHfG/ur2565OU1eXeHSBuH3uJRLKTTBhiV1szr0br8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0xNCA5OjUyIHAubS4sIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4gVW5kZXIgbWVt
b3J5IHByZXNzdXJlLCBobW1fcmFuZ2VfZmF1bHQgbWF5IHJldHVybiBlcnJvciBjb2RlIC1FTk9N
RU0NCj4gb3IgLUVCVVNZLCBjaGFuZ2UgcHJfaW5mbyB0byBwcl9kZWJ1ZyB0byByZW1vdmUgdW5u
ZWNlc3Nhcnkga2VybmVsIGxvZw0KPiBtZXNzYWdlIGJlY2F1c2Ugd2Ugd2lsbCByZXRyeSByZXN0
b3JlIGFnYWluLg0KPg0KPiBDYWxsIGdldF91c2VyX3BhZ2VzX2RvbmUgaWYgVFRNIGdldCB1c2Vy
IHBhZ2VzIGZhaWxlZCB3aWxsIGhhdmUNCj4gV0FSTl9PTkNFIGtlcm5lbCBjYWxsaW5nIHN0YWNr
IGR1bXAgbG9nLg0KPg0KPiBDaGFuZ2UtSWQ6IEkwODZmOTI5NDQ2MzBmOWQxYTcwMzY1YzAwNDE3
Y2I5NDQwNjYyNDY0DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0Bh
bWQuY29tPg0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+DQoNCg0KPiAtLS0NCj4gICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYyAgfCAzOCArKystLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gaW5kZXggNzRlODY5NTI1
NTNmLi4xMGFiYWUzOThlNTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4gQEAgLTE3MzEsMzUgKzE3MzEsMTcgQEAgc3Rh
dGljIGludCB1cGRhdGVfaW52YWxpZF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19p
bmZvICpwcm9jZXNzX2luZm8sDQo+ICAgCQlyZXQgPSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzKGJvLT50Ym8udHRtLA0KPiAgIAkJCQkJCSAgIGJvLT50Ym8udHRtLT5wYWdlcyk7DQo+ICAg
CQlpZiAocmV0KSB7DQo+IC0JCQliby0+dGJvLnR0bS0+cGFnZXNbMF0gPSBOVUxMOw0KPiAtCQkJ
cHJfaW5mbygiJXM6IEZhaWxlZCB0byBnZXQgdXNlciBwYWdlczogJWRcbiIsDQo+ICsJCQlwcl9k
ZWJ1ZygiJXM6IEZhaWxlZCB0byBnZXQgdXNlciBwYWdlczogJWRcbiIsDQo+ICAgCQkJCV9fZnVu
Y19fLCByZXQpOw0KPiAtCQkJLyogUHJldGVuZCBpdCBzdWNjZWVkZWQuIEl0IHdpbGwgZmFpbCBs
YXRlcg0KPiAtCQkJICogd2l0aCBhIFZNIGZhdWx0IGlmIHRoZSBHUFUgdHJpZXMgdG8gYWNjZXNz
DQo+IC0JCQkgKiBpdC4gQmV0dGVyIHRoYW4gaGFuZ2luZyBpbmRlZmluaXRlbHkgd2l0aA0KPiAt
CQkJICogc3RhbGxlZCB1c2VyIG1vZGUgcXVldWVzLg0KPiAtCQkJICovDQo+IC0JCX0NCj4gLQl9
DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gLX0NCj4gICANCj4gLS8qIFJlbW92ZSBpbnZhbGlkIHVz
ZXJwdHIgQk9zIGZyb20gaG1tIHRyYWNrIGxpc3QNCj4gLSAqDQo+IC0gKiBTdG9wIEhNTSB0cmFj
ayB0aGUgdXNlcnB0ciB1cGRhdGUNCj4gLSAqLw0KPiAtc3RhdGljIHZvaWQgdW50cmFja19pbnZh
bGlkX3VzZXJfcGFnZXMoc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbykN
Cj4gLXsNCj4gLQlzdHJ1Y3Qga2dkX21lbSAqbWVtLCAqdG1wX21lbTsNCj4gLQlzdHJ1Y3QgYW1k
Z3B1X2JvICpibzsNCj4gKwkJCS8qIFJldHVybiBlcnJvciAtRUJVU1kgb3IgLUVOT01FTSwgcmV0
cnkgcmVzdG9yZSAqLw0KPiArCQkJcmV0dXJuIHJldDsNCj4gKwkJfQ0KPiAgIA0KPiAtCWxpc3Rf
Zm9yX2VhY2hfZW50cnlfc2FmZShtZW0sIHRtcF9tZW0sDQo+IC0JCQkJICZwcm9jZXNzX2luZm8t
PnVzZXJwdHJfaW52YWxfbGlzdCwNCj4gLQkJCQkgdmFsaWRhdGVfbGlzdC5oZWFkKSB7DQo+IC0J
CWJvID0gbWVtLT5ibzsNCj4gICAJCWFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZShi
by0+dGJvLnR0bSk7DQo+ICAgCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4g
ICAvKiBWYWxpZGF0ZSBpbnZhbGlkIHVzZXJwdHIgQk9zDQo+IEBAIC0xODQxLDEzICsxODIzLDYg
QEAgc3RhdGljIGludCB2YWxpZGF0ZV9pbnZhbGlkX3VzZXJfcGFnZXMoc3RydWN0IGFtZGtmZF9w
cm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbykNCj4gICAJCWxpc3RfbW92ZV90YWlsKCZtZW0tPnZh
bGlkYXRlX2xpc3QuaGVhZCwNCj4gICAJCQkgICAgICAgJnByb2Nlc3NfaW5mby0+dXNlcnB0cl92
YWxpZF9saXN0KTsNCj4gICANCj4gLQkJLyogU3RvcCBITU0gdHJhY2sgdGhlIHVzZXJwdHIgdXBk
YXRlLiBXZSBkb250IGNoZWNrIHRoZSByZXR1cm4NCj4gLQkJICogdmFsdWUgZm9yIGNvbmN1cnJl
bnQgQ1BVIHBhZ2UgdGFibGUgdXBkYXRlIGJlY2F1c2Ugd2Ugd2lsbA0KPiAtCQkgKiByZXNjaGVk
dWxlIHRoZSByZXN0b3JlIHdvcmtlciBpZiBwcm9jZXNzX2luZm8tPmV2aWN0ZWRfYm9zDQo+IC0J
CSAqIGlzIHVwZGF0ZWQuDQo+IC0JCSAqLw0KPiAtCQlhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzX2RvbmUoYm8tPnRiby50dG0pOw0KPiAtDQo+ICAgCQkvKiBVcGRhdGUgbWFwcGluZy4gSWYg
dGhlIEJPIHdhcyBub3QgdmFsaWRhdGVkDQo+ICAgCQkgKiAoYmVjYXVzZSB3ZSBjb3VsZG4ndCBn
ZXQgdXNlciBwYWdlcyksIHRoaXMgd2lsbA0KPiAgIAkJICogY2xlYXIgdGhlIHBhZ2UgdGFibGUg
ZW50cmllcywgd2hpY2ggd2lsbCByZXN1bHQgaW4NCj4gQEAgLTE5NDYsNyArMTkyMSw2IEBAIHN0
YXRpYyB2b2lkIGFtZGdwdV9hbWRrZmRfcmVzdG9yZV91c2VycHRyX3dvcmtlcihzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKndvcmspDQo+ICAgCX0NCj4gICANCj4gICB1bmxvY2tfb3V0Og0KPiAtCXVudHJh
Y2tfaW52YWxpZF91c2VyX3BhZ2VzKHByb2Nlc3NfaW5mbyk7DQo+ICAgCW11dGV4X3VubG9jaygm
cHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gICAJbW1wdXQobW0pOw0KPiAgIAlwdXRfdGFza19zdHJ1
Y3QodXNlcnRhc2spOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
