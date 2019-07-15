Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901ED68657
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 11:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E1E897E3;
	Mon, 15 Jul 2019 09:31:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800041.outbound.protection.outlook.com [40.107.80.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DD9897E3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 09:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDw1GRlH2oKLYiHtPysr9rYg8UNylYRE6moms+WK4G9zY8Ceoxx+aNI2VVFVkONkar+qpJPLPqY7ZINHe8fKcE6vpZdjWvJ43hiA8iuNNMuun7ot8e1Sgqm/uWPgMa7dD2EOlFm3b0NksL7vbleOqLUWhEgQLnAQl5NPcdGuh6i1d+tacCALKwp7je77pzUrqd6Dt9p9zwoWS+4N1jgbNOCwiwE+H/qHm5jgh6DB30cq8R+FyArPLES8wbYxSS0whLgJGWT7AE8oPXwjXziGZHkn0YVMIHELqkMhGASnhiKJfnw3gSrwVFFfLnToxUVBiWKfAyoztTD9ot9CeikZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1o90Ih1dzyKTnha+dS9GKoW9s/humR9N0u2Ye+ocjc=;
 b=WFKLsXLMljWJ0S39RTPPXz0SdhhiiYXc/IyOflh6b22oGVhjeLlBoCE7GTj+zRXb79yNOO6O9sqjknr5U3H9hEnzrp7Z0QdPkHoFBitN55kK+IGLAK2lp30B1JWqGe2WIADJ5PoFN2nWhKrcLYR5OXm6RPa5DpjagFr64f2xj7IsSQtvriZQ1kRs7W4iACjfIQCdsxzEo7siUcQuVG1qiqh1DY5f4aEiCoZ3SFQ2RaKbnAZDcD0CbwEHo4X/s3R9e3tfAkHIUxA2O+/RTBLqkn/TqkyJUVQCrm2Lu8dIekTluscx3VyLas3zYScL4teAOzuno4l7DVWrvH9ao/bXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1178.namprd12.prod.outlook.com (10.168.233.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Mon, 15 Jul 2019 09:31:00 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Mon, 15 Jul
 2019 09:30:59 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: Re: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwIC8YI0Xjw0H02CS/7Sp4MSRKbD2JCAgAdrA7CAAC5ngA==
Date: Mon, 15 Jul 2019 09:30:59 +0000
Message-ID: <550628f4-eb76-23aa-bc33-e9841e6d017b@amd.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
 <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
 <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::25) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 686cf05b-700c-4b63-4a0d-08d70907256f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1178; 
x-ms-traffictypediagnostic: DM5PR12MB1178:
x-microsoft-antispam-prvs: <DM5PR12MB1178F206C113581952D1812E83CF0@DM5PR12MB1178.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(199004)(189003)(13464003)(99286004)(6486002)(31696002)(6506007)(386003)(36756003)(8676002)(25786009)(86362001)(76176011)(53546011)(446003)(46003)(11346002)(186003)(478600001)(6116002)(476003)(6512007)(102836004)(65826007)(52116002)(305945005)(7736002)(6246003)(6636002)(53936002)(2906002)(229853002)(2616005)(71190400001)(71200400001)(6436002)(58126008)(110136005)(4326008)(316002)(31686004)(64126003)(14444005)(256004)(486006)(14454004)(66946007)(66446008)(66556008)(66476007)(64756008)(81156014)(5660300002)(81166006)(8936002)(65956001)(68736007)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1178;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kjQPGYnOJPTIVL6BJ08IUJ507DYweV/Sxfs4K9EgcEnjPU0S/2LSebtlAVLP/JPU8/K7D52zKD/3Ow+k8Diix9xhKrFGhvm4vMZLR7sVVal1yAmyz53xIosqTgmWr6XkizB6Sd2poo5Z3EBzEYeEJHh2jY8QY5MZk+aq1XSs4xiiBDuWm6uClhXb8LO0btHGaLfkqMPsYaFGbYbzg668vzonSYSACX4GiCGHB44LtjlFdhPHogznnICKAW2MFVNQehXikoe0wm3+C9fmFWApbiydO6iETn7LhaVD0ZJ9AoBrQv1S7N3V5USwZFdf7fLR3wnWgWbhNvHCFFtztT7nF98o5IPpY0qZ4sgx3RyRMCfd7proMFlMwzHReRy3RtJvcTbuUW2wnP1WkNUcnwJweBTpHlv/L0aWmtnDwONhNic=
Content-ID: <25643871FCDB064EBB121E747D685516@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686cf05b-700c-4b63-4a0d-08d70907256f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 09:30:59.8129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1178
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1o90Ih1dzyKTnha+dS9GKoW9s/humR9N0u2Ye+ocjc=;
 b=1N6/YLazbY/S1mDrzdnRvi2MHF35gp60zeAgVWklhMuGg3Cz9yxTl8pc0Dwi3UEyXyECOKz0uJq7EP0Wy3XfnNlttY3blVnzRFWxv4Q8BjAZBjubFEJ1Q/pN+KfKtr1TKpS1Ei8cWxiSMEL9gvj/EKdZa5VAps51BCyC+EK3EDA=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgZ3V5cywNCg0KPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCB0aGlzPyBGb3Ig
cGVyIHZtIGJvLCBpdCBzZWVtcyBhbHdheXMgZGVsYXkgdG8gZnJlZSB0aGUgdHRtIGJvLg0KWWVh
aCwgYW5kIHRoYXQgaXMgY29ycmVjdCBiZWhhdmlvci4NCg0KU2luY2Ugd2UgZG9uJ3Qga25vdyB3
aG8gaXMgdXNpbmcgYSBwZXItdm0gQk8gd2UgbmVlZCB0byB3YWl0IGZvciBhbGwgDQpjb21tYW5k
IHN1Ym1pc3Npb25zIGluIGZsaWdodCB3aGVuIGl0IGlzIGZyZWVkLg0KDQpGb3IgdGhpcyB3ZSBj
b3B5IHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSBzaGFyZWQgcmVzZXJ2YXRpb24gb2JqZWN0IGlu
dG8gDQp0aGUgcHJpdmF0ZSBvbmUgaW4gdHRtX2JvX2luZGl2aWR1YWxpemVfcmVzdi4NCg0KUmVn
YXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMTUuMDcuMTkgdW0gMDg6NDkgc2NocmllYiBEZW5nLCBF
bWlseToNCj4gSGkgRGF2aWQsDQo+ICAgICAgIFlvdSBhcmUgcmlnaHQsIGl0IHdpbGwgY29weSBw
ZXItdm0gcmVzdi4NCj4gICAgICAgQnV0IGN1cnJlbnRseSwgaXQgc3RpbGwgaGFzIHRoZSBkZWxh
eSBmcmVlIGlzc3VlIHdoaWNoIG5vbiBwZXIgdm0gYm8gZG9lc24ndCBoYXMuIE1heWJlIGl0IGFs
cmVhZHkgaGFzIG5ldyBmZW5jZXMgYXBwZW5kIHRvIHRoaXMgcmVzdiBvYmplY3QgYmVmb3JlIGNv
cHkuDQo+DQo+IEhpIENocmlzdGlhbiwNCj4gICAgICBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlv
biBhYm91dCB0aGlzPyBGb3IgcGVyIHZtIGJvLCBpdCBzZWVtcyBhbHdheXMgZGVsYXkgdG8gZnJl
ZSB0aGUgdHRtIGJvLg0KPg0KPiBCZXN0IHdpc2hlcw0KPiBFbWlseSBEZW5nDQo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogWmhvdSwgRGF2aWQoQ2h1bk1pbmcpIDxEYXZp
ZDEuWmhvdUBhbWQuY29tPg0KPj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDEwLCAyMDE5IDk6Mjgg
UE0NCj4+IFRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IEZpeCB0
aGUgbWVtb3J5IGRlbGF5IGZyZWUgaXNzdWUNCj4+DQo+PiBJdCBkb2Vzbid0IG1ha2Ugc2Vuc2Ug
dGhhdCBmcmVlaW5nIEJPIHN0aWxsIHVzZXMgcGVyLXZtIHJlc3YuDQo+Pg0KPj4gSSByZW1lbWJl
ciB3aGVuIEJPIGlzIGluIHJlbGVhc2UgbGlzdCwgaXRzIHJlc3Ygd2lsbCBiZSBmcm9tIHBlci12
bSByZXN2IGNvcHkuDQo+PiBDb3VsZCB5b3UgY2hlY2sgaXQ/DQo+Pg0KPj4gLURhdmlkDQo+Pg0K
Pj4g5ZyoIDIwMTkvNy8xMCAxNzoyOSwgRW1pbHkgRGVuZyDlhpnpgZM6DQo+Pj4gRm9yIHZ1bGth
biBjdHMgYWxsb2NhdGlvbiB0ZXN0IGNhc2VzLCB0aGV5IHdpbGwgY3JlYXRlIGEgc2VyaWVzIG9m
DQo+Pj4gYm9zLCBhbmQgdGhlbiBmcmVlIHRoZW0uIEFzIGl0IGhhcyBsb3RzIG9mIGFsbG9jdGlv
biB0ZXN0IGNhc2VzIHdpdGgNCj4+PiB0aGUgc2FtZSB2bSwgYXMgcGVyIHZtIGJvIGZlYXR1cmUg
ZW5hYmxlLCBhbGwgb2YgdGhvc2UgYm9zJyByZXN2IGFyZQ0KPj4+IHRoZSBzYW1lLiBCdXQgdGhl
IGJvIGZyZWUgaXMgcXVpdGUgc2xvdywgYXMgdGhleSB1c2UgdGhlIHNhbWUgcmVzdg0KPj4+IG9i
amVjdCwgZm9yIGV2ZXJ5IHRpbWUsIGZyZWUgYSBibywgaXQgd2lsbCBjaGVjayB0aGUgcmVzdiB3
aGV0aGVyDQo+Pj4gc2lnbmFsLCBpZiBpdCBzaWduYWwsIHRoZW4gd2lsbCBmcmVlIGl0LiBCdXQg
YXMgdGhlIHRlc3QgY2FzZXMgd2lsbA0KPj4+IGNvbnRpbnVlIHRvIGNyZWF0ZSBibywgYW5kIHRo
ZSByZXN2IGZlbmNlIGlzIGluY3JlYXNpbmcuIFNvIHRoZSBmcmVlIGlzIG1vcmUNCj4+IHNsb3dl
ciB0aGFuIGNyZWF0aW5nLiBJdCB3aWxsIGNhdXNlIG1lbW9yeSBleGhhdXN0aW5nLg0KPj4+IE1l
dGhvZDoNCj4+PiBXaGVuIHRoZSByZXN2IHNpZ25hbCwgcmVsZWFzZSBhbGwgdGhlIGJvcyB3aGlj
aCBhcmUgdXNlIHRoZSBzYW1lIHJlc3YNCj4+PiBvYmplY3QuDQo+Pj4NCj4+PiBTaWduZWQtb2Zm
LWJ5OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0K
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBpbmRleCBmOWEzZDRjLi41N2VjNTli
IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+Pj4gQEAgLTU0Myw2ICs1NDMsNyBAQCBz
dGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0DQo+PiB0dG1fYnVmZmVyX29iamVj
dCAqYm8sDQo+Pj4gICAgew0KPj4+ICAgIAlzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiA9IGJv
LT5iZGV2LT5nbG9iOw0KPj4+ICAgIAlzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpyZXN2Ow0K
Pj4+ICsJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpyZXN2X2JvLCAqcmVzdl9ib19uZXh0Ow0K
Pj4+ICAgIAlpbnQgcmV0Ow0KPj4+DQo+Pj4gICAgCWlmICh1bmxpa2VseShsaXN0X2VtcHR5KCZi
by0+ZGRlc3Ryb3kpKSkNCj4+PiBAQCAtNTY2LDEwICs1NjcsMTQgQEAgc3RhdGljIGludCB0dG1f
Ym9fY2xlYW51cF9yZWZzKHN0cnVjdA0KPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPj4+ICAg
IAkJCQkJCQkgICBpbnRlcnJ1cHRpYmxlLA0KPj4+ICAgIAkJCQkJCQkgICAzMCAqIEhaKTsNCj4+
Pg0KPj4+IC0JCWlmIChscmV0IDwgMCkNCj4+PiArCQlpZiAobHJldCA8IDApIHsNCj4+PiArCQkJ
a3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+ICAgIAkJ
CXJldHVybiBscmV0Ow0KPj4+IC0JCWVsc2UgaWYgKGxyZXQgPT0gMCkNCj4+PiArCQl9DQo+Pj4g
KwkJZWxzZSBpZiAobHJldCA9PSAwKSB7DQo+Pj4gKwkJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVm
LCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+PiAgICAJCQlyZXR1cm4gLUVCVVNZOw0KPj4+ICsJ
CX0NCj4+Pg0KPj4+ICAgIAkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4gICAgCQlp
ZiAodW5sb2NrX3Jlc3YgJiYgIWtjbF9yZXNlcnZhdGlvbl9vYmplY3RfdHJ5bG9jayhiby0+cmVz
dikpDQo+PiB7IEBADQo+Pj4gLTU4Miw2ICs1ODcsNyBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVh
bnVwX3JlZnMoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0DQo+PiAqYm8sDQo+Pj4gICAgCQkJICog
aGVyZS4NCj4+PiAgICAJCQkgKi8NCj4+PiAgICAJCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xv
Y2spOw0KPj4+ICsJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlz
dCk7DQo+Pj4gICAgCQkJcmV0dXJuIDA7DQo+Pj4gICAgCQl9DQo+Pj4gICAgCQlyZXQgPSAwOw0K
Pj4+IEBAIC01OTEsMTUgKzU5NywyOSBAQCBzdGF0aWMgaW50IHR0bV9ib19jbGVhbnVwX3JlZnMo
c3RydWN0DQo+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQo+Pj4gICAgCQlpZiAodW5sb2NrX3Jl
c3YpDQo+Pj4gICAgCQkJa2NsX3Jlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOw0K
Pj4+ICAgIAkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+PiArCQlrcmVmX3B1dCgm
Ym8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4gICAgCQlyZXR1cm4gcmV0
Ow0KPj4+ICAgIAl9DQo+Pj4NCj4+PiAgICAJdHRtX2JvX2RlbF9mcm9tX2xydShibyk7DQo+Pj4g
ICAgCWxpc3RfZGVsX2luaXQoJmJvLT5kZGVzdHJveSk7DQo+Pj4gICAgCWtyZWZfcHV0KCZiby0+
bGlzdF9rcmVmLCB0dG1fYm9fcmVmX2J1Zyk7DQo+Pj4gLQ0KPj4+ICAgIAlzcGluX3VubG9jaygm
Z2xvYi0+bHJ1X2xvY2spOw0KPj4+ICAgIAl0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZShibyk7
DQo+Pj4gKwlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+
Pj4gKw0KPj4+ICsJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4gKwlsaXN0X2Zvcl9l
YWNoX2VudHJ5X3NhZmUocmVzdl9ibywgcmVzdl9ib19uZXh0LCAmYm8tPmJkZXYtDQo+Pj4gZGRl
c3Ryb3ksIGRkZXN0cm95KSB7DQo+Pj4gKwkJaWYgKHJlc3ZfYm8tPnJlc3YgPT0gYm8tPnJlc3Yp
IHsNCj4+PiArCQkJdHRtX2JvX2RlbF9mcm9tX2xydShyZXN2X2JvKTsNCj4+PiArCQkJbGlzdF9k
ZWxfaW5pdCgmcmVzdl9iby0+ZGRlc3Ryb3kpOw0KPj4+ICsJCQlzcGluX3VubG9jaygmZ2xvYi0+
bHJ1X2xvY2spOw0KPj4+ICsJCQl0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZShyZXN2X2JvKTsN
Cj4+PiArCQkJa3JlZl9wdXQoJnJlc3ZfYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlz
dCk7DQo+Pj4gKwkJCXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+ICsJCX0NCj4+PiAr
CX0NCj4+PiArCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4NCj4+PiAgICAJaWYg
KHVubG9ja19yZXN2KQ0KPj4+ICAgIAkJa2NsX3Jlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8t
PnJlc3YpOw0KPj4+IEBAIC02MzksOSArNjU5LDggQEAgc3RhdGljIGJvb2wgdHRtX2JvX2RlbGF5
ZWRfZGVsZXRlKHN0cnVjdA0KPj4gdHRtX2JvX2RldmljZSAqYmRldiwgYm9vbCByZW1vdmVfYWxs
KQ0KPj4+ICAgIAkJCXR0bV9ib19jbGVhbnVwX3JlZnMoYm8sIGZhbHNlLCAhcmVtb3ZlX2FsbCwg
dHJ1ZSk7DQo+Pj4gICAgCQl9IGVsc2Ugew0KPj4+ICAgIAkJCXNwaW5fdW5sb2NrKCZnbG9iLT5s
cnVfbG9jayk7DQo+Pj4gKwkJCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFz
ZV9saXN0KTsNCj4+PiAgICAJCX0NCj4+PiAtDQo+Pj4gLQkJa3JlZl9wdXQoJmJvLT5saXN0X2ty
ZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+ICAgIAkJc3Bpbl9sb2NrKCZnbG9iLT5scnVf
bG9jayk7DQo+Pj4gICAgCX0NCj4+PiAgICAJbGlzdF9zcGxpY2VfdGFpbCgmcmVtb3ZlZCwgJmJk
ZXYtPmRkZXN0cm95KTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
