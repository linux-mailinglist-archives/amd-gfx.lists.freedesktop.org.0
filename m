Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147795936D
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 07:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9AD6E855;
	Fri, 28 Jun 2019 05:32:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875836E851
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 05:32:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=lVx1Vb4pIVfjlKCmk29b0g+/Lq9YLll2dZk8DrNHuzfITHsljUlAS7lYtSNCi1QurSTjL/4J08pIKyrxhaBmrhoijw9jKYaY0c4T50vUJq/Zr6iPBYrGlG2FFbyCjeYN72RWoLaXz9G0XV0T0t+2jLYiumtL25LFxLHe1uRt/s4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAO/UZAoBAofLH4mLA+qY55LcaKvDrKNP/d81cU8SpA=;
 b=fZUtkyd7vE0AQpnU/hprNp+idkReNQiJwWcpBDx2zvMTk5T9yGeM+wh2lHTA+N9JeNfkCQe/TPp4cyRNrkjK5hmgScuckFIJphY+9H3BgOEomcUMflHp6NpbV7kolYes7D1myQPipkV3tjBMb1ffNnOeiEAXK1/bHBuyz7mJMPo=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 05:32:00 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 05:32:00 +0000
From: "Cui, Flora" <fcui@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Cui, Flora"
 <Flora.Cui@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVLM+JtftM5gXUOEyqva4XabrZI6avSXoAgAFCeQA=
Date: Fri, 28 Jun 2019 05:32:00 +0000
Message-ID: <86b459d5-8c11-c68c-9b14-0c5adf103a9e@amd.com>
References: <1561629780-21649-1-git-send-email-flora.cui@amd.com>
 <379c7272-a581-d3f2-582c-fbb92d59f00f@gmail.com>
In-Reply-To: <379c7272-a581-d3f2-582c-fbb92d59f00f@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:2e::19) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 730b5663-0bec-4b1d-a7bf-08d6fb89f15e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3056; 
x-ms-traffictypediagnostic: MN2PR12MB3056:
x-microsoft-antispam-prvs: <MN2PR12MB30563C62D55CDA75E31D4829FAFC0@MN2PR12MB3056.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(199004)(189003)(58126008)(66446008)(64756008)(316002)(72206003)(2501003)(68736007)(71200400001)(99286004)(52116002)(71190400001)(76176011)(486006)(256004)(73956011)(66476007)(11346002)(446003)(14454004)(31686004)(110136005)(14444005)(66556008)(476003)(66946007)(64126003)(6512007)(81156014)(6486002)(2616005)(5660300002)(65826007)(65956001)(65806001)(3846002)(81166006)(478600001)(53936002)(305945005)(7736002)(36756003)(31696002)(25786009)(8936002)(229853002)(186003)(66066001)(6116002)(6506007)(26005)(66574012)(8676002)(2906002)(6436002)(102836004)(6246003)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3056;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H1/XlEzyh+e2kTqu4KJUqsyTrV8M/DHQFULXVbzayfWmlOIlq0vlR2gGE3CM7hPFZKM0ZxFciOOcmxIxPKtzyTrvVBTc5Hms6FvLT8PMHs1IoXdDXfoNNyBlF3SiLRQ0DC+5BVVrXBDE4sZZx0lmIl+AXkI/oE09lMWwCp7rFII57fpux4WA5lxfJ35e0SsyhEz2mCfbYnumXxaXVR0wLuOqkFSpaA/Q6MRuKlBNNc6jrS11pzEFiM7jbhOTllmkC9mgez4z1PeO5ECV9ajwvUYTAFdcLD014otNr2PsBxESsWSf7fPxs9e0JIKzYdH9n7HT0+mep7KS+OfLa5ZvfJKPQoUKrucj4o9Zf4z6zgjyrPKSTQ0oJOYosaLmBA+CMUXe5Cd3PlR2tZGEqq0inFjSudPgdf/zx9K4810FcDs=
Content-ID: <5D92F03FFCB06A4DBD0C8E49188B6A32@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730b5663-0bec-4b1d-a7bf-08d6fb89f15e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 05:32:00.6372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAO/UZAoBAofLH4mLA+qY55LcaKvDrKNP/d81cU8SpA=;
 b=L1NeMVeW4LTwZtXCkgCv7KFW8rSvidZPAtOJw+GY5ZZJyNybf5sWCL+7ujV8VcDgZ7/PC2cHbheDrlKLuZpEkWuj6FY57MEJjLEQOivzHnEqBIWQ5UTPBNS96U3o2edBdAPCCwoEha90qlLCJz6MMMlt7ksxhprn2FEFcSQtd38=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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

DQrlnKggNi8yNy8yMDE5IDY6MTcgUE0sIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOg0KPiBBbSAy
Ny4wNi4xOSB1bSAxMjowMyBzY2hyaWViIEN1aSwgRmxvcmE6DQo+PiBzY2hlZHVsZXIgdGltZW91
dCBpcyBpbiBqaWZmaWVzDQo+PiB2MjogbW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZp
Y2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzIGFmdGVyDQo+PiBwYXJzaW5nIHRoZSB2YWx1ZQ0K
Pj4NCj4+IENoYW5nZS1JZDogSTI2NzA4YzE2M2RiOTQzZmY4ZDkzMGRkODFiY2FiNGI0YjlkODRl
YjINCj4+IFNpZ25lZC1vZmYtYnk6IEZsb3JhIEN1aSA8ZmxvcmEuY3VpQGFtZC5jb20+DQo+PiAt
LS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDcgKysr
KystLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4+
IGluZGV4IGU3NGExNzUuLmNjMjlkNzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYw0KPj4gQEAgLTEzMDAsNyArMTMwMCw5IEBAIGludCANCj4+IGFtZGdw
dV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPj4gwqDCoMKgwqDCoMKgICogQnkgZGVmYXVsdCB0aW1lb3V0IGZvciBub24gY29tcHV0
ZSBqb2JzIGlzIDEwMDAwLg0KPj4gwqDCoMKgwqDCoMKgICogQW5kIHRoZXJlIGlzIG5vIHRpbWVv
dXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KPj4gwqDCoMKgwqDCoMKgICovDQo+PiAtwqDC
oMKgIGFkZXYtPmdmeF90aW1lb3V0ID0gYWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9f
dGltZW91dCA9IA0KPj4gMTAwMDA7DQo+PiArwqDCoMKgIGFkZXYtPmdmeF90aW1lb3V0ID0gXA0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGFkZXYtPnNkbWFfdGltZW91dCA9IFwNCj4+ICvCoMKgwqDCoMKg
wqDCoCBhZGV2LT52aWRlb190aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcygxMDAwMCk7DQo+DQo+
IE9mIGhhbmQgdGhhdCBsb29rcyB2ZXJ5IG9kZCB0byBtZS4gVGhpcyBpcyBub3QgYSBtYWNybyBz
byB3aHkgdGhlIFwgaGVyZT8NCndpbGwgdXBkYXRlIGluIHYzDQo+DQo+PiDCoMKgwqDCoMKgIGFk
ZXYtPmNvbXB1dGVfdGltZW91dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0KPj4gwqAgwqDCoMKg
wqDCoCBpZiAoc3RybmxlbihpbnB1dCwgQU1ER1BVX01BWF9USU1FT1VUX1BBUkFNX0xFTlRIKSkg
ew0KPj4gQEAgLTEzMTQsNyArMTMxNiw4IEBAIGludCANCj4+IGFtZGdwdV9kZXZpY2VfZ2V0X2pv
Yl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHRpbWVvdXQgPD0gMCkgew0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmRleCsrOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KTsNCj4NCj4gWW91
IGNhbiBhY3R1YWxseSByZW1vdmUgdGhlICJpZiAodGltZW91dCA8PSAwKSIgYXMgd2VsbCwgDQo+
IG1zZWNzX3RvX2ppZmZpZXMgd2lsbCBkbyB0aGUgcmlnaHQgdGhpbmcgZm9yIG5lZ2F0aXZlIHZh
bHVlcy4NCklNSE8gY2hlY2sgZm9yIHRpbWVvdXQ9PTAgaXMgc3RpbGwgbmVlZGVkLiBtc2Vjc190
b19qaWZmaWVzKCkgd291bGQgDQpyZXR1cm4gMCBhbmQgdGhhdCdzIG5vdCBkZXNpcmVkIGZvciBz
Y2hlZHVsZXIgdGltZXIuDQo+DQo+IENocmlzdGlhbi4NCj4NCj4+IMKgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN3aXRjaCAoaW5kZXgrKykgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY2FzZSAwOg0KPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
