Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E37EB228
	for <lists+amd-gfx@lfdr.de>; Thu, 31 Oct 2019 15:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159F26EE99;
	Thu, 31 Oct 2019 14:08:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5842C6EE99
 for <amd-gfx@lists.freedesktop.org>; Thu, 31 Oct 2019 14:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W48znbgZLKu0Z+AsOi5hlCY88EipulD3nvouEFFcBDV0PciJDWF0Ji4AHGKBEhz+OZf4AwSTZk1sJai3Z//kN+XsUYUWJBp8HywAelYSgUMqRrzEmX1KCZwWncK0uRxcJuswXZf19FStvmJ61RWa79U5gtTYcRGrulzcYN+Y0I9AfsHiLwF9pPvmxGYqYjHGLkuDclsghm9P+q1s+3beVjKB0KYVgdZc8oeNIodTOlEnMLbTeS+CZGq9ILsr0fYsdGMI38tTOHumh8yOpVKBVKEISlKTgaG/wD4+vlB315AdwZbZ3SHFpqCAEl1EAR4oKGWyFL+WtNOW+gvvwQ0pJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl0XyEL7GyPBFFwZ+qFeYu4TBXPWUBwtGxKJIffscP8=;
 b=Ku7Dlv+uKCPA9+b+1cj3j/HFzp+to7V3yOPzZOAHuuLKBIIRMzh7Cl5rHQwhKN9f36Uyct9krmCWDUojTjR0wue3kx+p/Kfmukbq5C5A+w5DHHmD7qnV+r9vM6qCRDRnKh34jVz206lCjYvRgllYdYxQ0KaLM2uIvCRS3USpGeZXapL30yxg8F43J8Q+3pti3QXMnWI6/jn6cnVeHTRwgYljFgL6KsjlEa882+O+gKKBgX7nPR4REX92gAWL3s/H8wbooPzTV1ZMpiSxNMBV9ulyPu9Ty43TBNWQZw+fMD732DSHjEQ0MN1d30IUE8rKefgi6aNJjQo1HR7FpqB8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3814.namprd12.prod.outlook.com (52.132.245.84) by
 CH2PR12MB4167.namprd12.prod.outlook.com (20.180.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Thu, 31 Oct 2019 14:08:52 +0000
Received: from CH2PR12MB3814.namprd12.prod.outlook.com
 ([fe80::e848:be51:4d4c:cf50]) by CH2PR12MB3814.namprd12.prod.outlook.com
 ([fe80::e848:be51:4d4c:cf50%5]) with mapi id 15.20.2387.028; Thu, 31 Oct 2019
 14:08:52 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: remove PT BOs when unmapping
Thread-Topic: [PATCH] drm/amdgpu: remove PT BOs when unmapping
Thread-Index: AQHVjz9fDgCmcpDN4kO4KrasyvT2IKdzZzQAgAANGACAAAQXAIAAAPgAgAAC64CAARShAIAAOgoA
Date: Thu, 31 Oct 2019 14:08:52 +0000
Message-ID: <90bf5487-96cc-9971-332f-a97ab3e5ccc9@amd.com>
References: <3f4b6803-ec66-44ca-b55a-8bccf4236632@email.android.com>
 <b8ad3c90-42d0-512d-5ba0-af330eab30a1@amd.com>
 <b5d9309e-a32b-8243-8c4d-cfd4e77e09e1@amd.com>
 <461cc802-e7c5-f968-1cb4-5e55a306e780@gmail.com>
 <d2d9f2a2-5a79-8fd4-f6ee-5ce2dc6cfbd9@amd.com>
 <3f62c442-ed58-d8b8-faac-9289c83fd0da@amd.com>
 <68bc3b87-cd95-83c1-162b-61ad3d5979dd@amd.com>
In-Reply-To: <68bc3b87-cd95-83c1-162b-61ad3d5979dd@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::16) To CH2PR12MB3814.namprd12.prod.outlook.com
 (2603:10b6:610:28::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [70.29.37.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e399cdba-cc84-4ce4-0bb8-08d75e0bdbc8
x-ms-traffictypediagnostic: CH2PR12MB4167:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4167361C51887DE18D4583E1F7630@CH2PR12MB4167.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02070414A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(189003)(199004)(6486002)(66946007)(5660300002)(52116002)(8676002)(30864003)(86362001)(31696002)(14454004)(7736002)(2351001)(53546011)(99286004)(6506007)(316002)(386003)(305945005)(66476007)(446003)(2906002)(66556008)(6306002)(6512007)(76176011)(478600001)(966005)(66066001)(11346002)(66446008)(64756008)(31686004)(5640700003)(81156014)(25786009)(229853002)(186003)(66574012)(6116002)(4326008)(102836004)(6246003)(3846002)(2501003)(6916009)(486006)(26005)(256004)(71200400001)(2616005)(71190400001)(8936002)(476003)(6436002)(36756003)(4001150100001)(81166006)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4167;
 H:CH2PR12MB3814.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Myw3pQs+5jLQWzw9QKn/nlmA8IzL+WhBAQdRJKjJNZ1s63deFsFYxq00x1nX8uolvT0nMZaLx/C5eLrTg2biDXAjx/L3/vNmfLef7HX0imhlTyLff5I+fa1RG6VV0cha598zafAkm9jep+hN7samh3oBX6D75LKAAEJf2oKLYA+mWZLMoVCRdpYCkn4zl666GPgW+sLNFcsYhFBWGmVJSIo50L6GBQDPdMQwu3ElQwah9fKtFKshs8xvbi/+DGiw7hvfYUzXLz20kztWWp6BFsh+zlF+Jy6pfdn1W4qAQiwNWH3AOjqc7K60NOSx/DXcZ3VsMLLKdTwlUeRCRHBX6MtHxNBhoxSNKZoYUMBSjQCt4Dq0QGwwwDnWSG68XwYGhgeCF1BVN8K7vTIGWt1CQvU2tWnhXv7i4KbXSHgSTPjDwdNZIMXfcQEkFFDkoC/Xs2Vmu8WGxz+yjSE/bj7djECT/aiQ+zfUz8PQh/gYB2c=
Content-ID: <9903BD54165FD448B0340DE9F19785E7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e399cdba-cc84-4ce4-0bb8-08d75e0bdbc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2019 14:08:52.5263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHI9+j+VQI85Mm/XcLto63nbXh9yKyBKcQf1EbHoC5AyF02SfKca3vzBnZ7uGuZKsimN9MDplHmMurYA8qYj+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl0XyEL7GyPBFFwZ+qFeYu4TBXPWUBwtGxKJIffscP8=;
 b=3ETlq8jpULBPVnf0KJBG4U5K4HFSM4I/hxk3acLa85xhfn4tjItMOvzG4+qHHllo1EDIs0wEEtOGcNLEC+if+eTPvho62yf6vvrQCIGP1OjNxLYHdSTFBslPQQu1Y74YxcM48wVRvKVGEmR9E8e3GyAtNmMDESElBI7pErhgX+I=
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SSBjb3VsZCB0cnkgaXQgb24gbXkgY2Fycml6by9wb2xhcmlzIHNldHVwLsKgIElzIHRoZXJlIGEg
dGVzdCBwcm9jZWR1cmUgSSANCmNvdWxkIGZvbGxsb3cgdG8gdHJpZ2dlciB0aGUgY2hhbmdlZCBj
b2RlIHBhdGhzPw0KDQoNClRvbQ0KDQpPbiAyMDE5LTEwLTMxIDY6NDEgYS5tLiwgS29lbmlnLCBD
aHJpc3RpYW4gd3JvdGU6DQo+IEp1c3QgdGVzdGVkIHRoaXMgYW5kIGFtZGdwdV92bV91cGRhdGVf
cHRlcygpIGluZGVlZCB3b3JrcyBhcyBleHBlY3RlZC4NCj4NCj4gV2hlbiB5b3UgZnJlZSBhdCBs
ZWFzdCBhIDJNQiB0aGUgbG93ZXN0IGxldmVsIG9mIHBhZ2UgdGFibGVzIGlzIGZyZWVkIA0KPiB1
cCBhZ2Fpbi4NCj4NCj4gQlRXOiBXaGF0IGhhcmR3YXJlIGhhdmUgeW91IHRlc3RlZCB0aGlzIG9u
PyBPbiBnZng4IGFuZCBvbGRlciBpdCBpcyANCj4gZXhwZWN0ZWQgdGhhdCBwYWdlIHRhYmxlcyBh
cmUgbmV2ZXIgZnJlZWQuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4NCj4gQW0gMzAu
MTAuMTkgdW0gMTk6MTEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPj4gVGhlbiBJIGRvbid0
IHNlZSBob3cgdGhpcyBwYXRjaCBhY3R1YWxseSBjaGFuZ2VzIGFueXRoaW5nLg0KPj4NCj4+IENv
dWxkIG9ubHkgYmUgYSBidWcgaW4gYW1kZ3B1X3ZtX3VwZGF0ZV9wdGVzKCkuIEdvaW5nIHRvIGlu
dmVzdGlnYXRlIA0KPj4gdGhpcywgYnV0IEkgd29uJ3QgaGF2ZSB0aW1lIHRvIGxvb2sgaW50byB0
aGUgdGlja2V0IGluIGRldGFpbC4NCj4+DQo+PiBSZWdhcmRzLA0KPj4gQ2hyaXN0aWFuLg0KPj4N
Cj4+IEFtIDMwLjEwLjE5IHVtIDE5OjAwIHNjaHJpZWIgSHVhbmcsIEppbkh1aUVyaWM6DQo+Pj4N
Cj4+PiBBY3R1YWxseSBJIGRvIHByZXZlbnQgdG8gcmVtb3ZlIGluLXVzZSBwdHMgYnkgdGhpczoN
Cj4+Pg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHIgPSBhbWRncHVfdm1fcmVt
b3ZlX3B0ZXMoYWRldiwgdm0sDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAobWFwcGluZy0+c3RhcnQgKyAweDFmZikgJiAo
fjB4MWZmbGwpLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKG1hcHBpbmctPmxhc3QgKyAxKSAmICh+MHgxZmZsbCkpOw0K
Pj4+DQo+Pj4gV2hpY2ggaXMgb25seSByZW1vdmluZyBhbGlnbmVkIHBhZ2UgdGFibGUgZm9yIDJN
LiBBbmQgSSBoYXZlIHRlc3RlZCANCj4+PiBpdCBhdCBsZWFzdCBvbiBLRkQgdGVzdHMgd2l0aG91
dCBhbnl0aGluZyBicm9rZW4uDQo+Pj4NCj4+PiBCeSB0aGUgd2F5LCBJIGFtIG5vdCBmYW1pbGlh
ciB3aXRoIG1lbW9yeSBzdGFmZi4gVGhpcyBwYXRjaCBpcyB0aGUgDQo+Pj4gYmVzdCBJIGNhbiBk
byBmb3Igbm93LiBDb3VsZCB5b3UgdGFrZSBhIGxvb2sgYXQgdGhlIEppcmEgdGlja2V0IA0KPj4+
IFNXREVWLTIwMTQ0MyA/IGFuZCBmaW5kIHRoZSBiZXR0ZXIgc29sdXRpb24uIFRoYW5rcyENCj4+
Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4NCj4+PiBFcmljDQo+Pj4NCj4+PiBPbiAyMDE5LTEwLTMwIDE6
NTcgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+Pj4gT25lIHRoaW5nIEkndmUgZm9y
Z290dGVuOg0KPj4+Pg0KPj4+PiBXaGF0IHlvdSBjb3VsZCBtYXliZSBkbyB0byBpbXByb3ZlIHRo
ZSBzaXR1YXRpb24gaXMgdG8gam9pbiANCj4+Pj4gYWRqYWNlbnQgcmFuZ2VzIGluIGFtZGdwdV92
bV9jbGVhcl9mcmVlZCgpLCBidXQgSSdtIG5vdCBzdXJlIGhvdyANCj4+Pj4gdGhlIGNoYW5jZXMg
YXJlIHRoYXQgdGhlIHJhbmdlcyBhcmUgZnJlZWQgYWxsIHRvZ2V0aGVyLg0KPj4+Pg0KPj4+PiBU
aGUgb25seSBvdGhlciBhbHRlcm5hdGl2ZSBJIGNhbiBzZWUgd291bGQgYmUgdG8gY2hlY2sgdGhl
IG1hcHBpbmdzIA0KPj4+PiBvZiBhIHJhbmdlIGluIGFtZGdwdV91cGRhdGVfcHRlcygpIGFuZCBz
ZWUgaWYgeW91IGNvdWxkIHdhbGsgdGhlIA0KPj4+PiB0cmVlIHVwIGlmIHRoZSB2YWxpZCBmbGFn
IGlzIG5vdCBzZXQgYW5kIHRoZXJlIGFyZSBubyBtYXBwaW5ncyBsZWZ0IA0KPj4+PiBmb3IgYSBw
YWdlIHRhYmxlLg0KPj4+Pg0KPj4+PiBSZWdhcmRzLA0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4+DQo+
Pj4+IEFtIDMwLjEwLjE5IHVtIDE4OjQyIHNjaHJpZWIgS29lbmlnLCBDaHJpc3RpYW46DQo+Pj4+
Pj4gVGhlIHZhaWxkIGZsYWcgZG9lc24ndCB0YWtlIGVmZmVjdCBpbiB0aGlzIGZ1bmN0aW9uLg0K
Pj4+Pj4gVGhhdCdzIGlycmVsZXZhbnQuDQo+Pj4+Pg0KPj4+Pj4gU2VlIHdoYXQgYW1kZ3B1X3Zt
X3VwZGF0ZV9wdGVzKCkgZG9lcyBpcyB0byBmaXJzdCBkZXRlcm1pbmUgdGhlIA0KPj4+Pj4gZnJh
Z21lbnQgc2l6ZToNCj4+Pj4+PiBhbWRncHVfdm1fZnJhZ21lbnQocGFyYW1zLCBmcmFnX3N0YXJ0
LCBlbmQsIGZsYWdzLCAmZnJhZywgJmZyYWdfZW5kKTsNCj4+Pj4+DQo+Pj4+PiBUaGVuIHdlIHdh
bGsgZG93biB0aGUgdHJlZToNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBhbWRncHVfdm1fcHRfc3Rh
cnQoYWRldiwgcGFyYW1zLT52bSwgc3RhcnQsICZjdXJzb3IpOw0KPj4+Pj4+IMKgwqDCoMKgwqDC
oMKgIHdoaWxlIChjdXJzb3IucGZuIDwgZW5kKSB7DQo+Pj4+Pg0KPj4+Pj4gQW5kIG1ha2Ugc3Vy
ZSB0aGF0IHRoZSBwYWdlIHRhYmxlcyBjb3ZlcmluZyB0aGUgYWRkcmVzcyByYW5nZSBhcmUgDQo+
Pj4+PiBhY3R1YWxseSBhbGxvY2F0ZWQ6DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHIgPSBhbWRncHVfdm1fYWxsb2NfcHRzKHBhcmFtcy0+YWRldiwgcGFyYW1zLT52bSwg
DQo+Pj4+Pj4gJmN1cnNvcik7DQo+Pj4+Pg0KPj4+Pj4gVGhlbiB3ZSB1cGRhdGUgdGhlIHRhYmxl
cyB3aXRoIHRoZSBmbGFncyBhbmQgYWRkcmVzc2VzIGFuZCBmcmVlIHVwIA0KPj4+Pj4gc3Vic2Vx
dWVudCB0YWJsZXMgaW4gdGhlIGNhc2Ugb2YgaHVnZSBwYWdlcyBvciBmcmVlZCB1cCBhcmVhczoN
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8q
IEZyZWUgYWxsIGNoaWxkIGVudHJpZXMgKi8NCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlIChjdXJzb3IucGZuIDwgZnJhZ19zdGFydCkg
ew0KPj4+Pj4+IGFtZGdwdV92bV9mcmVlX3B0cyhhZGV2LCBwYXJhbXMtPnZtLCAmY3Vyc29yKTsN
Cj4+Pj4+PiBhbWRncHVfdm1fcHRfbmV4dChhZGV2LCAmY3Vyc29yKTsNCj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pj4+DQo+Pj4+PiBU
aGlzIGlzIHRoZSBtYXhpbXVtIHlvdSBjYW4gZnJlZSwgY2F1c2UgYWxsIG90aGVyIHBhZ2UgdGFi
bGVzIGFyZSANCj4+Pj4+IG5vdCBjb21wbGV0ZWx5IGNvdmVyZWQgYnkgdGhlIHJhbmdlIGFuZCBz
byBwb3RlbnRpYWxseSBzdGlsbCBpbiB1c2UuDQo+Pj4+Pg0KPj4+Pj4gQW5kIEkgaGF2ZSB0aGUg
c3Ryb25nIHN1c3BpY2lvbiB0aGF0IHRoaXMgaXMgd2hhdCB5b3VyIHBhdGNoIGlzIA0KPj4+Pj4g
YWN0dWFsbHkgZG9pbmcgd3JvbmcuIEluIG90aGVyIHdvcmRzIHlvdSBhcmUgYWxzbyBmcmVlaW5n
IHBhZ2UgDQo+Pj4+PiB0YWJsZXMgd2hpY2ggYXJlIG9ubHkgcGFydGlhbGx5IGNvdmVyZWQgYnkg
dGhlIHJhbmdlIGFuZCBzbyANCj4+Pj4+IHBvdGVudGlhbGx5IHN0aWxsIGluIHVzZS4NCj4+Pj4+
DQo+Pj4+PiBTaW5jZSB3ZSBkb24ndCBoYXZlIGFueSB0cmFja2luZyBob3cgbWFueSBlbnRyaWVz
IGluIGEgcGFnZSB0YWJsZSANCj4+Pj4+IGFyZSBjdXJyZW50bHkgdmFsaWQgYW5kIGhvdyBtYW55
IGFyZSBpbnZhbGlkIHdlIGFjdHVhbGx5IGNhbid0IA0KPj4+Pj4gaW1wbGVtZW50IHdoYXQgeW91
IGFyZSB0cnlpbmcgdG8gZG8gaGVyZS4gU28gdGhlIHBhdGNoIGlzIA0KPj4+Pj4gZGVmaW5pdGVs
eSBzb21laG93IGJyb2tlbi4NCj4+Pj4+DQo+Pj4+PiBSZWdhcmRzLA0KPj4+Pj4gQ2hyaXN0aWFu
Lg0KPj4+Pj4NCj4+Pj4+IEFtIDMwLjEwLjE5IHVtIDE3OjU1IHNjaHJpZWIgSHVhbmcsIEppbkh1
aUVyaWM6DQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgdmFpbGQgZmxhZyBkb2Vzbid0IHRha2UgZWZmZWN0
IGluIHRoaXMgZnVuY3Rpb24uIA0KPj4+Pj4+IGFtZGdwdV92bV9hbGxvY19wdHMoKSBpcyBhbHdh
eXMgZXhlY3V0ZWQgdGhhdCBvbmx5IGRlcGVuZGVkIG9uIA0KPj4+Pj4+ICJjdXJzb3IucGZuIDwg
ZW5kIi4gVGhlIHZhbGlkIGZsYWcgaGFzIG9ubHkgYmVlbiBjaGVja2VkIG9uIGhlcmUgDQo+Pj4+
Pj4gZm9yIGFzaWMgYmVsb3cgR01DIHY5Og0KPj4+Pj4+DQo+Pj4+Pj4gaWYgKGFkZXYtPmFzaWNf
dHlwZSA8IENISVBfVkVHQTEwICYmDQo+Pj4+Pj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgKGZsYWdz
ICYgQU1ER1BVX1BURV9WQUxJRCkpLi4uDQo+Pj4+Pj4NCj4+Pj4+PiBSZWdhcmRzLA0KPj4+Pj4+
DQo+Pj4+Pj4gRXJpYw0KPj4+Pj4+DQo+Pj4+Pj4gT24gMjAxOS0xMC0zMCAxMjozMCBwLm0uLCBL
b2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQW0gMzAu
MTAuMjAxOSAxNzoxOSBzY2hyaWViICJIdWFuZywgSmluSHVpRXJpYyIgDQo+Pj4+Pj4+IDxKaW5I
dWlFcmljLkh1YW5nQGFtZC5jb20+Og0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgSSB0ZXN0ZWQgaXQg
dGhhdCBpdCBzYXZlcyBhIGxvdCBvZiB2cmFtIG9uIEtGRCBiaWcgYnVmZmVyDQo+Pj4+Pj4+ICAg
ICBzdHJlc3MgdGVzdC4gSSB0aGluayB0aGVyZSBhcmUgdHdvIHJlYXNvbnM6DQo+Pj4+Pj4+DQo+
Pj4+Pj4+ICAgICAxLiBDYWxsaW5nIGFtZGdwdV92bV91cGRhdGVfcHRlcygpIGR1cmluZyB1bm1h
cHBpbmcgd2lsbA0KPj4+Pj4+PiAgICAgYWxsb2NhdGUgdW5uZWNlc3NhcnkgcHRzLCBiZWNhdXNl
IHRoZXJlIGlzIG5vIGZsYWcgdG8NCj4+Pj4+Pj4gICAgIGRldGVybWluZSBpZiB0aGUgVkEgaXMg
bWFwcGluZyBvciB1bm1hcHBpbmcgaW4gZnVuY3Rpb24NCj4+Pj4+Pj4gICAgIGFtZGdwdV92bV91
cGRhdGVfcHRlcygpLiBJdCBzYXZlcyB0aGUgbW9zdCBvZiBtZW1vcnkuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IFRoYXQncyBub3QgY29ycmVjdC4gVGhlIHZhbGlkIGZsYWcgaXMgdXNlZCBmb3IgdGhpcy4N
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgIDIuIEludGVudGlvbmFsbHkgcmVtb3ZpbmcgdGhvc2UgdW5t
YXBwaW5nIHB0cyBpcyBsb2dpY2FsDQo+Pj4+Pj4+ICAgICBleHBlY3RhdGlvbiwgYWx0aG91Z2gg
aXQgaXMgbm90IHJlbW92aW5nIHNvIG11Y2ggcHRzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBXZWxsIEkg
YWN0dWFsbHkgZG9uJ3Qgc2VlIGEgY2hhbmdlIHRvIHdoYXQgdXBkYXRlX3B0ZXMgaXMgZG9pbmcg
DQo+Pj4+Pj4+IGFuZCBoYXZlIHRoZSBzdHJvbmcgc3VzcGljaW9uIHRoYXQgdGhlIHBhdGNoIGlz
IHNpbXBseSBicm9rZW4uDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFlvdSBlaXRoZXIgZnJlZSBwYWdlIHRh
YmxlcyB3aGljaCBhcmUgcG90ZW50aWFsbHkgc3RpbGwgaW4gdXNlIA0KPj4+Pj4+PiBvciB1cGRh
dGVfcHRlIGRvZXNuJ3QgZnJlZSBwYWdlIHRhYmxlcyB3aGVuIHRoZSB2YWxpZCBidXQgaXMgbm90
IA0KPj4+Pj4+PiBzZXQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFJlZ2FyZHMsDQo+Pj4+Pj4+IENocmlz
dGlhbi4NCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgIFJlZ2FyZHMsDQo+
Pj4+Pj4+DQo+Pj4+Pj4+ICAgICBFcmljDQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgICBPbiAyMDE5LTEw
LTMwIDExOjU3IGEubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+Pj4+Pg0KPj4+Pj4+
Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgIEFtIDMwLjEwLjIwMTkgMTY6NDcgc2NocmllYiAi
S3VlaGxpbmcsIEZlbGl4Ig0KPj4+Pj4+PiAgICAgICAgIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PiA8bWFpbHRvOkZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Og0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAg
ICAgICAgICBPbiAyMDE5LTEwLTMwIDk6NTIgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToN
Cj4+Pj4+Pj4gICAgICAgICAgICAgPiBBbSAyOS4xMC4xOSB1bSAyMTowNiBzY2hyaWViIEh1YW5n
LCBKaW5IdWlFcmljOg0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBUaGUgaXNzdWUgaXMgUFQgQk9z
IGFyZSBub3QgZnJlZWQgd2hlbiB1bm1hcHBpbmcgVkEsDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+
IHdoaWNoIGNhdXNlcyB2cmFtIHVzYWdlIGFjY3VtdWxhdGVkIGlzIGh1Z2UgaW4gc29tZQ0KPj4+
Pj4+PiAgICAgICAgICAgICA+PiBtZW1vcnkgc3RyZXNzIHRlc3QsIHN1Y2ggYXMga2ZkIGJpZyBi
dWZmZXIgc3RyZXNzDQo+Pj4+Pj4+ICAgICAgICAgICAgIHRlc3QuDQo+Pj4+Pj4+ICAgICAgICAg
ICAgID4+IEZ1bmN0aW9uIGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZygpIGlzIGNhbGxlZA0K
Pj4+Pj4+PiAgICAgICAgICAgICBieSBib3RoDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IGFtZGdw
dV92bV9ib191cGRhdGUoKSBhbmQNCj4+Pj4+Pj4gICAgICAgICAgICAgYW1kZ3B1X3ZtX2NsZWFy
X2ZyZWVkKCkuIFRoZQ0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBzb2x1dGlvbiBpcyByZXBsYWNp
bmcNCj4+Pj4+Pj4gICAgICAgICAgICAgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKCkgaW4N
Cj4+Pj4+Pj4gICAgICAgICAgICAgPj4gYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKCkgd2l0aCByZW1v
dmluZyBQVCBCT3MgZnVuY3Rpb24NCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gdG8gc2F2ZSB2cmFt
IHVzYWdlLg0KPj4+Pj4+PiAgICAgICAgICAgICA+DQo+Pj4+Pj4+ICAgICAgICAgICAgID4gTkFL
LCB0aGF0IGlzIGludGVudGlvbmFsIGJlaGF2aW9yLg0KPj4+Pj4+PiAgICAgICAgICAgICA+DQo+
Pj4+Pj4+ICAgICAgICAgICAgID4gT3RoZXJ3aXNlIHdlIGNhbiBydW4gaW50byBvdXQgb2YgbWVt
b3J5IHNpdHVhdGlvbnMNCj4+Pj4+Pj4gICAgICAgICAgICAgd2hlbiBwYWdlIHRhYmxlcw0KPj4+
Pj4+PiAgICAgICAgICAgICA+IG5lZWQgdG8gYmUgYWxsb2NhdGVkIGFnYWluIHVuZGVyIHN0cmVz
cy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgICAgICAgVGhhdCdzIGEgYml0IGFyYml0cmFyeSBh
bmQgaW5jb25zaXN0ZW50LiBXZSBhcmUNCj4+Pj4+Pj4gICAgICAgICAgICAgZnJlZWluZyBwYWdl
IHRhYmxlcyBpbg0KPj4+Pj4+PiAgICAgICAgICAgICBvdGhlciBzaXR1YXRpb25zLCB3aGVuIGEg
bWFwcGluZyB1c2VzIGh1Z2UgcGFnZXMgaW4NCj4+Pj4+Pj4gICAgICAgICAgICAgYW1kZ3B1X3Zt
X3VwZGF0ZV9wdGVzLiBXaHkgbm90IHdoZW4gYSBtYXBwaW5nIGlzDQo+Pj4+Pj4+ICAgICAgICAg
ICAgIGRlc3Ryb3llZCBjb21wbGV0ZWx5Pw0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgICAgICBJ
J20gYWN0dWFsbHkgYSBiaXQgc3VycHJpc2VkIHRoYXQgdGhlIGh1Z2UtcGFnZQ0KPj4+Pj4+PiAg
ICAgICAgICAgICBoYW5kbGluZyBpbg0KPj4+Pj4+PiAgICAgICAgICAgICBhbWRncHVfdm1fdXBk
YXRlX3B0ZXMgaXNuJ3Qga2lja2luZyBpbiB0byBmcmVlIHVwDQo+Pj4+Pj4+ICAgICAgICAgICAg
IGxvd2VyLWxldmVsIHBhZ2UNCj4+Pj4+Pj4gICAgICAgICAgICAgdGFibGVzIHdoZW4gYSBCTyBp
cyB1bm1hcHBlZC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgICBXZWxsIGl0IGRv
ZXMgZnJlZSB0aGUgbG93ZXIgbGV2ZWwsIGFuZCB0aGF0IGlzIGFscmVhZHkNCj4+Pj4+Pj4gICAg
ICAgICBjYXVzaW5nIHByb2JsZW1zICh0aGF0J3Mgd2h5IEkgYWRkZWQgdGhlIHJlc2VydmVkIHNw
YWNlKS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgICBXaGF0IHdlIGRvbid0IGRvIGlzIGZyZWVp
bmcgdGhlIGhpZ2hlciBsZXZlbHMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgICAgICAgRS5nLiB3aGVu
IHlvdSBmcmVlIGEgMk1CIEJPIHdlIGZyZWUgdGhlIGxvd2VzdCBsZXZlbCwgaWYNCj4+Pj4+Pj4g
ICAgICAgICB3ZSBmcmVlIGEgMUdCIEJPIHdlIGZyZWUgdGhlIHR3byBsb3dlc3QgbGV2ZWxzIGV0
Yy4uLg0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgIFRoZSBwcm9ibGVtIHdpdGggZnJlZWluZyB0
aGUgaGlnaGVyIGxldmVscyBpcyB0aGF0IHlvdQ0KPj4+Pj4+PiAgICAgICAgIGRvbid0IGtub3cg
d2hvIGlzIGFsc28gdXNpbmcgdGhpcy4gRS5nLiB3ZSB3b3VsZCBuZWVkIHRvDQo+Pj4+Pj4+ICAg
ICAgICAgY2hlY2sgYWxsIGVudHJpZXMgd2hlbiB3ZSB1bm1hcCBvbmUuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+ICAgICAgICAgSXQncyBzaW1wbHkgbm90IHdvcnRoIGl0IGZvciBhIG1heGltdW0gc2F2aW5n
IG9mIDJNQiBwZXIgVk0uDQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgICAgICAgV3JpdGluZyB0aGlzIEkn
bSBhY3R1YWxseSB3b25kZXJpbmcgaG93IHlvdSBlbmRlZCB1cCBpbg0KPj4+Pj4+PiAgICAgICAg
IHRoaXMgaXNzdWU/IFRoZXJlIHNob3VsZG4ndCBiZSBtdWNoIHNhdmluZ3MgZnJvbSB0aGlzLg0K
Pj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgIFJlZ2FyZHMsDQo+Pj4+Pj4+ICAgICAgICAgQ2hyaXN0
aWFuLg0KPj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgICAgICAgICBSZWdhcmRzLA0KPj4+
Pj4+PiAgICAgICAgICAgICDCoMKgIEZlbGl4DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAg
ICAgICAgICAgID4NCj4+Pj4+Pj4gICAgICAgICAgICAgPiBSZWdhcmRzLA0KPj4+Pj4+PiAgICAg
ICAgICAgICA+IENocmlzdGlhbi4NCj4+Pj4+Pj4gICAgICAgICAgICAgPg0KPj4+Pj4+PiAgICAg
ICAgICAgICA+Pg0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBDaGFuZ2UtSWQ6IEljMjRlMzViZmY4
Y2E4NTI2NWI0MThhNjQyMzczZjE4OWQ5NzJhOTI0DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IFNp
Z25lZC1vZmYtYnk6IEVyaWMgSHVhbmcNCj4+Pj4+Pj4gICAgICAgICAgICAgPEppbmh1aUVyaWMu
SHVhbmdAYW1kLmNvbT4NCj4+Pj4+Pj4gICAgICAgICAgICAgPG1haWx0bzpKaW5odWlFcmljLkh1
YW5nQGFtZC5jb20+DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IC0tLQ0KPj4+Pj4+PiAgICAgICAg
ICAgICA+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDU2DQo+Pj4+
Pj4+ICAgICAgICAgICAgID4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4+
Pj4+Pj4gICAgICAgICAgICAgPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+DQo+Pj4+Pj4+ICAgICAgICAg
ICAgID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
Yw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92bS5jDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IGluZGV4IDBmNGMzYjIuLjhhNDgwYzcg
MTAwNjQ0DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IEBA
IC0xOTMwLDYgKzE5MzAsNTEgQEAgc3RhdGljIHZvaWQNCj4+Pj4+Pj4gICAgICAgICAgICAgYW1k
Z3B1X3ZtX3BydF9maW5pKHN0cnVjdA0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBhbWRncHVfZGV2
aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4g
wqAgfQ0KPj4+Pj4+PiAgICAgICAgICAgICA+PiDCoCDCoCAvKioNCj4+Pj4+Pj4gICAgICAgICAg
ICAgPj4gKyAqIGFtZGdwdV92bV9yZW1vdmVfcHRlcyAtIGZyZWUgUFQgQk9zDQo+Pj4+Pj4+ICAg
ICAgICAgICAgID4+ICsgKg0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArICogQGFkZXY6IGFtZGdw
dSBkZXZpY2Ugc3RydWN0dXJlDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgKiBAdm06IGFtZGdw
dSB2bSBzdHJ1Y3R1cmUNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKyAqIEBzdGFydDogc3RhcnQg
b2YgbWFwcGVkIHJhbmdlDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgKiBAZW5kOiBlbmQgb2Yg
bWFwcGVkIGVudHJ5DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgKg0KPj4+Pj4+PiAgICAgICAg
ICAgICA+PiArICogRnJlZSB0aGUgcGFnZSB0YWJsZSBsZXZlbC4NCj4+Pj4+Pj4gICAgICAgICAg
ICAgPj4gKyAqLw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArc3RhdGljIGludCBhbWRncHVfdm1f
cmVtb3ZlX3B0ZXMoc3RydWN0DQo+Pj4+Pj4+ICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2UgKmFk
ZXYsDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgc3RydWN0IGFtZGdwdV92bSAqdm0sIHVpbnQ2
NF90IHN0YXJ0LCB1aW50NjRfdCBlbmQpDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICt7DQo+Pj4+
Pj4+ICAgICAgICAgICAgID4+ICvCoMKgwqAgc3RydWN0IGFtZGdwdV92bV9wdF9jdXJzb3IgY3Vy
c29yOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArwqDCoMKgIHVuc2lnbmVkIHNoaWZ0LCBudW1f
ZW50cmllczsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKw0KPj4+Pj4+PiAgICAgICAgICAgICA+
PiArIGFtZGdwdV92bV9wdF9zdGFydChhZGV2LCB2bSwgc3RhcnQsICZjdXJzb3IpOw0KPj4+Pj4+
PiAgICAgICAgICAgICA+PiArwqDCoMKgIHdoaWxlIChjdXJzb3IubGV2ZWwgPCBBTURHUFVfVk1f
UFRCKSB7DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWFtZGdw
dV92bV9wdF9kZXNjZW5kYW50KGFkZXYsICZjdXJzb3IpKQ0KPj4+Pj4+PiAgICAgICAgICAgICA+
PiArIHJldHVybiAtRU5PRU5UOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArwqDCoMKgIH0NCj4+
Pj4+Pj4gICAgICAgICAgICAgPj4gKw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArwqDCoMKgIHdo
aWxlIChjdXJzb3IucGZuIDwgZW5kKSB7DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgYW1kZ3B1
X3ZtX2ZyZWVfdGFibGUoY3Vyc29yLmVudHJ5KTsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKyBu
dW1fZW50cmllcyA9IGFtZGdwdV92bV9udW1fZW50cmllcyhhZGV2LA0KPj4+Pj4+PiAgICAgICAg
ICAgICBjdXJzb3IubGV2ZWwgLSAxKTsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKw0KPj4+Pj4+
PiAgICAgICAgICAgICA+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGN1cnNvci5lbnRyeSAhPQ0KPj4+
Pj4+PiAgICAgICAgICAgICAmY3Vyc29yLnBhcmVudC0+ZW50cmllc1tudW1fZW50cmllcyAtIDFd
KSB7DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgLyogTmV4dCBwdGIgZW50cnkgKi8NCj4+Pj4+
Pj4gICAgICAgICAgICAgPj4gKyBzaGlmdCA9IGFtZGdwdV92bV9sZXZlbF9zaGlmdChhZGV2LA0K
Pj4+Pj4+PiAgICAgICAgICAgICBjdXJzb3IubGV2ZWwgLSAxKTsNCj4+Pj4+Pj4gICAgICAgICAg
ICAgPj4gKyBjdXJzb3IucGZuICs9IDFVTEwgPDwgc2hpZnQ7DQo+Pj4+Pj4+ICAgICAgICAgICAg
ID4+ICsgY3Vyc29yLnBmbiAmPSB+KCgxVUxMIDw8IHNoaWZ0KSAtIDEpOw0KPj4+Pj4+PiAgICAg
ICAgICAgICA+PiArIGN1cnNvci5lbnRyeSsrOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArwqDC
oMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKyAvKiBOZXh0IHB0
YiBlbnRyeSBpbiBuZXh0IHBkMCBlbnRyeSAqLw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArIGFt
ZGdwdV92bV9wdF9hbmNlc3RvcigmY3Vyc29yKTsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKyBz
aGlmdCA9IGFtZGdwdV92bV9sZXZlbF9zaGlmdChhZGV2LA0KPj4+Pj4+PiAgICAgICAgICAgICBj
dXJzb3IubGV2ZWwgLSAxKTsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gKyBjdXJzb3IucGZuICs9
IDFVTEwgPDwgc2hpZnQ7DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgY3Vyc29yLnBmbiAmPSB+
KCgxVUxMIDw8IHNoaWZ0KSAtIDEpOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArIGFtZGdwdV92
bV9wdF9kZXNjZW5kYW50KGFkZXYsICZjdXJzb3IpOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiAr
wqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArwqDCoMKgIH0NCj4+Pj4+
Pj4gICAgICAgICAgICAgPj4gKw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArwqDCoMKgIHJldHVy
biAwOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArfQ0KPj4+Pj4+PiAgICAgICAgICAgICA+PiAr
DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsvKioNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gwqDC
oCAqIGFtZGdwdV92bV9jbGVhcl9mcmVlZCAtIGNsZWFyIGZyZWVkIEJPcyBpbg0KPj4+Pj4+PiAg
ICAgICAgICAgICB0aGUgUFQNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gwqDCoCAqDQo+Pj4+Pj4+
ICAgICAgICAgICAgID4+IMKgwqAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQo+Pj4+
Pj4+ICAgICAgICAgICAgID4+IEBAIC0xOTQ5LDcgKzE5OTQsNiBAQCBpbnQNCj4+Pj4+Pj4gICAg
ICAgICAgICAgYW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+Pj4+
Pj4+ICAgICAgICAgICAgID4+ICphZGV2LA0KPj4+Pj4+PiAgICAgICAgICAgICA+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKQ0KPj4+Pj4+
PiAgICAgICAgICAgICA+PiDCoCB7DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IMKgwqDCoMKgwqAg
c3RydWN0IGFtZGdwdV9ib192YV9tYXBwaW5nICptYXBwaW5nOw0KPj4+Pj4+PiAgICAgICAgICAg
ICA+PiAtwqDCoMKgIHVpbnQ2NF90IGluaXRfcHRlX3ZhbHVlID0gMDsNCj4+Pj4+Pj4gICAgICAg
ICAgICAgPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICpmID0gTlVMTDsNCj4+Pj4+Pj4g
ICAgICAgICAgICAgPj4gwqDCoMKgwqDCoCBpbnQgcjsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4g
wqAgQEAgLTE5NTgsMTMgKzIwMDIsMTAgQEAgaW50DQo+Pj4+Pj4+ICAgICAgICAgICAgIGFtZGdw
dV92bV9jbGVhcl9mcmVlZChzdHJ1Y3QNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gc3RydWN0IGFtZGdwdV9ib192YV9t
YXBwaW5nLCBsaXN0KTsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gbGlzdF9kZWwoJm1hcHBpbmct
Pmxpc3QpOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiDCoCAtwqDCoMKgwqDCoMKgwqAgaWYgKHZt
LT5wdGVfc3VwcG9ydF9hdHMgJiYNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gLSBtYXBwaW5nLT5z
dGFydCA8IEFNREdQVV9HTUNfSE9MRV9TVEFSVCkNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gLSBp
bml0X3B0ZV92YWx1ZSA9IEFNREdQVV9QVEVfREVGQVVMVF9BVEM7DQo+Pj4+Pj4+ICAgICAgICAg
ICAgID4+ICvCoMKgwqDCoMKgwqDCoCByID0gYW1kZ3B1X3ZtX3JlbW92ZV9wdGVzKGFkZXYsIHZt
LA0KPj4+Pj4+PiAgICAgICAgICAgICA+PiArIChtYXBwaW5nLT5zdGFydCArIDB4MWZmKSAmICh+
MHgxZmZsbCksDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+ICsgKG1hcHBpbmctPmxhc3QgKyAxKSAm
ICh+MHgxZmZsbCkpOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiDCoCAtwqDCoMKgwqDCoMKgwqAg
ciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LA0KPj4+Pj4+PiAgICAgICAgICAg
ICB2bSwgZmFsc2UsIE5VTEwsDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IC0gbWFwcGluZy0+c3Rh
cnQsIG1hcHBpbmctPmxhc3QsDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IC0gaW5pdF9wdGVfdmFs
dWUsIDAsIE5VTEwsICZmKTsNCj4+Pj4+Pj4gICAgICAgICAgICAgPj4gYW1kZ3B1X3ZtX2ZyZWVf
bWFwcGluZyhhZGV2LCB2bSwgbWFwcGluZywgZik7DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAocikgew0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBkbWFfZmVu
Y2VfcHV0KGYpOw0KPj4+Pj4+PiAgICAgICAgICAgICA+PiBAQCAtMTk4MCw3ICsyMDIxLDYgQEAg
aW50DQo+Pj4+Pj4+ICAgICAgICAgICAgIGFtZGdwdV92bV9jbGVhcl9mcmVlZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZQ0KPj4+Pj4+PiAgICAgICAgICAgICA+PiAqYWRldiwNCj4+Pj4+Pj4gICAgICAg
ICAgICAgPj4gwqDCoMKgwqDCoCB9DQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IHJldHVybiAwOw0K
Pj4+Pj4+PiAgICAgICAgICAgICA+PiAtDQo+Pj4+Pj4+ICAgICAgICAgICAgID4+IMKgIH0NCj4+
Pj4+Pj4gICAgICAgICAgICAgPj4gwqAgwqAgLyoqDQo+Pj4+Pj4+ICAgICAgICAgICAgID4NCj4+
Pj4+Pj4gICAgICAgICAgICAgPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4+Pj4+PiAgICAgICAgICAgICA+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+
Pj4+Pj4+ICAgICAgICAgICAgID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4+
Pj4gICAgICAgICAgICAgPG1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4+
Pj4+Pj4gICAgICAgICAgICAgPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngNCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+DQo+Pj4+
Pg0KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4+Pj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQo+Pj4+DQo+Pg0KPg0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
