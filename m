Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851CF49C90
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 11:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DBB6E11E;
	Tue, 18 Jun 2019 09:03:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690047.outbound.protection.outlook.com [40.107.69.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888056E11E
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 09:03:03 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2551.namprd12.prod.outlook.com (52.132.141.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Tue, 18 Jun 2019 09:03:02 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 09:03:02 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 092/459] drm/amdgpu: add ib preemption status in amdgpu_job
Thread-Topic: [PATCH 092/459] drm/amdgpu: add ib preemption status in
 amdgpu_job
Thread-Index: AQHVJUFzPBBFkQV00k+5GFYlqP/cQqahDigAgAAG5rCAAAmpAA==
Date: Tue, 18 Jun 2019 09:03:02 +0000
Message-ID: <450d50ba-3c79-7199-d2f9-eac5e86b1f8f@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
 <20190617191700.17899-81-alexander.deucher@amd.com>
 <8429fbeb-fbb2-b71d-e146-c8f4c0959063@gmail.com>
 <MN2PR12MB3437D15684332D5E9DFA1715EFEA0@MN2PR12MB3437.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3437D15684332D5E9DFA1715EFEA0@MN2PR12MB3437.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0147.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::15) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52ea563c-8786-4103-80ff-08d6f3cbc45c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2551; 
x-ms-traffictypediagnostic: DM5PR12MB2551:
x-microsoft-antispam-prvs: <DM5PR12MB25517746D86D2C0930A531F583EA0@DM5PR12MB2551.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(13464003)(14454004)(7736002)(65826007)(86362001)(186003)(66574012)(8936002)(81166006)(8676002)(2906002)(65956001)(305945005)(81156014)(65806001)(99286004)(486006)(5660300002)(229853002)(386003)(476003)(54906003)(110136005)(71190400001)(6506007)(6436002)(6116002)(53546011)(64126003)(11346002)(2616005)(52116002)(31696002)(2501003)(76176011)(6486002)(46003)(31686004)(14444005)(36756003)(64756008)(478600001)(66556008)(68736007)(66446008)(6246003)(58126008)(256004)(316002)(72206003)(4326008)(53936002)(66476007)(73956011)(66946007)(25786009)(446003)(102836004)(6512007)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2551;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tjTrdJcSjNIdaNYP7yNNuGuMZPKUsKd6ziT7Chf9W2WA3m6tUii4JQ8d8m2YpofRYnX3mdAF6c15vxCzxZptPyi0kVVqXWM6xUnM1jVHQ/IcPDg6WxKBh/kE4XVLnW29727iu3d4P3MHNqokAmtW5P7fHk2i80WFYFPiVQ/bgMMFUxakJpW0vaCk5JQ6MgaZg5sHMEfo3OpckyuwrKNCnwq1j5iTALYFEXwNdO9V13pmAu+HE7ac13Py9iKDazn6fm2kHlhABd8ITsV3i6Ppl6evivQS529PAXFh7zaXshpkaQ6JP8dY3n2hVf14oqH7bXVQsIX4cc4iASORfMAcwciqgaiGy0U3W35LnPBt7Gp0pSV/fQ3834Xb0in9r06MiKgqW9wTKScfalJFifyHV1qK5knY2FsVqajqWrKgyoo=
Content-ID: <41BD7BED4299FF4F938F8CBFB70EE57D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ea563c-8786-4103-80ff-08d6f3cbc45c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 09:03:02.1594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2551
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsmGKSgTFTd4JorShNWRG4pUGjc3shVbIBoyW2FH0ec=;
 b=MEAeWzxLx2vvL0N5Fqoakm/kyTH6q94mT1GBbHq0jw54gTwq6Ylm1oWFbc+tZHVMr00z3M6+kmtRObfYWNX9wH3O81Grw4TG6qNUfcco0dVWYeAS/0AWfrvgZAdO+AL8smVg6VY1dSN37oemulg+Q13lgLHfU5U98LVXcBrQW4w=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWVhaCB0aG91Z2h0IHNvLCBjYXVzZSB0aGF0IHdvdWxkIGJyZWFrIGltbWVkaWF0ZWx5IGFuZCB3
b24ndCB3b3JrIGF0IGFsbC4NCg0KSXQgbXVzdCBiZSBzb21ldGhpbmcgbGlrZSBhIG1lcmdlIG9y
IHJlYmFzZSBhcnRpZmFjdC4NCg0KV2hhdCdzIHRoZSBiZXN0IHdheSB0byBmaXggdGhhdCB1cD8g
SW4gb3RoZXIgd29yZHMgaG93IHNob3VsZCBpdCBsb29rIGxpa2U/DQoNCkNocmlzdGlhbi4NCg0K
QW0gMTguMDYuMTkgdW0gMTA6MzIgc2NocmllYiBYaWFvLCBKYWNrOg0KPiBJbiBvcmlnaW5hbCBw
YXRjaCwgdGhlcmUgaXMgbm8gZGVsZXRpb24gb24gam9iLT5wcmVhbWJsZV9zdGF0dXMuDQo+DQo+
IFJlZ2FyZHMsDQo+IEphY2sNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+
IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTgsIDIwMTkgNDowNCBQTQ0KPiBUbzogQWxleCBEZXVjaGVy
IDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWGlh
bywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA5Mi80NTldIGRybS9hbWRncHU6IGFk
ZCBpYiBwcmVlbXB0aW9uIHN0YXR1cyBpbiBhbWRncHVfam9iDQo+DQo+IEFtIDE3LjA2LjE5IHVt
IDIxOjEwIHNjaHJpZWIgQWxleCBEZXVjaGVyOg0KPj4gRnJvbTogSmFjayBYaWFvIDxKYWNrLlhp
YW9AYW1kLmNvbT4NCj4+DQo+PiBBZGQgaWIgcHJlZW1wdGlvbiBzdGF0dXMgaW4gYW1kZ3B1X2pv
Yiwgc28gdGhhdCByaW5nIGxldmVsIGZ1bmN0aW9uDQo+PiBjYW4gZGV0ZWN0IHByZWVtcHRpb24g
YW5kIHByb2dyYW0gZm9yIHJlc3VtaW5nIGl0Lg0KPj4NCj4+IEFja2VkLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+PiBSZXZpZXdlZC1ieTogSGF3a2luZyBa
aGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSmFjayBYaWFv
IDxKYWNrLlhpYW9AYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2liLmMgIHwgMiArLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5oIHwgMyArKysNCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jDQo+PiBpbmRleCBlMTU1MzFiZmNkNDcuLjkwY2MwODQxYjU2NCAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPj4gQEAgLTIwOCw3
ICsyMDgsNyBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywNCj4+IHVuc2lnbmVkIG51bV9pYnMsDQo+PiAgICANCj4+ICAgIAlza2lwX3ByZWFtYmxlID0g
cmluZy0+Y3VycmVudF9jdHggPT0gZmVuY2VfY3R4Ow0KPj4gICAgCWlmIChqb2IgJiYgcmluZy0+
ZnVuY3MtPmVtaXRfY250eGNudGwpIHsNCj4+IC0JCXN0YXR1cyB8PSBqb2ItPnByZWFtYmxlX3N0
YXR1czsNCj4+ICsJCXN0YXR1cyB8PSBqb2ItPnByZWVtcHRpb25fc3RhdHVzOw0KPiBUaGF0IGFj
dHVhbGx5IGxvb2tzIGNvbXBsZXRlbHkgaW5jb3JyZWN0IHRvIG1lIHNpbmNlIGl0IGJyZWFrcyB0
aGUgb2xkIHN0YXR1cyBoYW5kbGluZy4NCj4NCj4gQ2hyaXN0aWFuLg0KPg0KPj4gICAgCQlhbWRn
cHVfcmluZ19lbWl0X2NudHhjbnRsKHJpbmcsIHN0YXR1cyk7DQo+PiAgICAJfQ0KPj4gICAgDQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPj4gaW5kZXggZTFi
NDZhNjcwM2RlLi41MWU2MjUwNGMyNzkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9qb2IuaA0KPj4gQEAgLTI5LDYgKzI5LDggQEANCj4+ICAgICNkZWZpbmUgQU1E
R1BVX1BSRUFNQkxFX0lCX1BSRVNFTlRfRklSU1QgICAgKDEgPDwgMSkNCj4+ICAgIC8qIGJpdCBz
ZXQgbWVhbnMgY29udGV4dCBzd2l0Y2ggb2NjdXJlZCAqLw0KPj4gICAgI2RlZmluZSBBTURHUFVf
SEFWRV9DVFhfU1dJVENIICAgICAgICAgICAgICAoMSA8PCAyKQ0KPj4gKy8qIGJpdCBzZXQgbWVh
bnMgSUIgaXMgcHJlZW1wdGVkICovDQo+PiArI2RlZmluZSBBTURHUFVfSUJfUFJFRU1QVEVEICAg
ICAgICAgICAgICAgICAoMSA8PCAzKQ0KPj4gICAgDQo+PiAgICAjZGVmaW5lIHRvX2FtZGdwdV9q
b2Ioc2NoZWRfam9iKQkJXA0KPj4gICAgCQljb250YWluZXJfb2YoKHNjaGVkX2pvYiksIHN0cnVj
dCBhbWRncHVfam9iLCBiYXNlKSBAQCAtNDUsNiArNDcsNw0KPj4gQEAgc3RydWN0IGFtZGdwdV9q
b2Igew0KPj4gICAgCXN0cnVjdCBhbWRncHVfaWIJKmliczsNCj4+ICAgIAlzdHJ1Y3QgZG1hX2Zl
bmNlCSpmZW5jZTsgLyogdGhlIGh3IGZlbmNlICovDQo+PiAgICAJdWludDMyX3QJCXByZWFtYmxl
X3N0YXR1czsNCj4+ICsJdWludDMyX3QgICAgICAgICAgICAgICAgcHJlZW1wdGlvbl9zdGF0dXM7
DQo+PiAgICAJdWludDMyX3QJCW51bV9pYnM7DQo+PiAgICAJdm9pZAkJCSpvd25lcjsNCj4+ICAg
IAlib29sICAgICAgICAgICAgICAgICAgICB2bV9uZWVkc19mbHVzaDsNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
