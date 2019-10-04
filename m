Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89620CBE74
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 17:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069B76EBC4;
	Fri,  4 Oct 2019 15:02:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730064.outbound.protection.outlook.com [40.107.73.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B686EBC4
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 15:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqVjQ6HnpV+ZU7nop6+yXTs8a6FtgfhTjgUwIcMDhCFf+53MnYmQsohqArHc5Q9XpvvPZCm3vozRASLcrXX0gsS+1peaCm3flaoBfRYmGfkckxL53ed2aY1sNHR0t07RcgxpCtpPHpXnod6C8aP4EqRH7v6HbIy6uzNRQudZbAVWquQTieH5G70fDd6ukMZrt8vq/OMTJu8cYbWLNtSS1B+H5isJg5zxRqjvbK7kfkUTWYVJerAiWD9J4JT8jFUUWLhtusQJI/qyZT9KNk5GXOSvSYHZoL4gM7wS8KfjcMTlS23L9+pSZbDM/haBB/KvYC49lGSNcYJ1CCbWlRjgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmPT4ktfr7oTz1U/+FrO1SsmHOi5fXHVJ7IubcNi5SM=;
 b=PJCPgXSubYsi0G6q5MGVLOZNQ0gpJJq4HDaNjBfWO9N7GSXY0SxhahTJrmgPgeVCJtA4oqNS+z8cKHGiHU4CztBvEYar6mx0W49UPd4Abp6rlzU6A5nXZ6TPOu/6C7PTY0+xGExqgOxIqrQJmC8l9hSC0YIVVXB/AEikUYFoOI71eg+nQu2+uUioTXVwUvH2H/4chUjzceaw3iBOkrOTncwkVzjBhTOJHomUnA78WD9cvDCEHBAJwSdKo8LGulLRd50G1btDvKg4hFoq/JYHfVKvsPys/A2uoQV62t5sL1sSUWtllA0ju13kGO140kzg8eFwKBb3IeeFH8HX2L//ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1947.namprd12.prod.outlook.com (10.175.90.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 15:02:49 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 15:02:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "thejoe@gmail.com" <thejoe@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Topic: [PATCH] drm/amdgpu: user pages array memory leak fix
Thread-Index: AQHVeiL9DA79jEoNj0W1Xmdl96gb6adKfjMAgAAXEoA=
Date: Fri, 4 Oct 2019 15:02:49 +0000
Message-ID: <6640c636-79d1-6159-a1db-5f39f70096a1@amd.com>
References: <20191003194423.14468-1-Philip.Yang@amd.com>
 <e86d92cd-7bae-6704-00db-1a79ccbb1011@amd.com>
In-Reply-To: <e86d92cd-7bae-6704-00db-1a79ccbb1011@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::32) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d0333d3-ebac-4401-8c6a-08d748dbec27
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1947:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1947E4E917DE9990AC6BB617839E0@DM5PR12MB1947.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(189003)(199004)(66946007)(99286004)(110136005)(8936002)(66446008)(66476007)(53546011)(2201001)(14454004)(64756008)(66556008)(5660300002)(2501003)(6306002)(6512007)(6246003)(6436002)(316002)(229853002)(58126008)(36756003)(7736002)(14444005)(81166006)(256004)(65806001)(478600001)(71200400001)(8676002)(305945005)(65956001)(25786009)(6486002)(186003)(52116002)(2906002)(6116002)(86362001)(102836004)(966005)(71190400001)(31686004)(11346002)(476003)(446003)(486006)(46003)(6506007)(2616005)(76176011)(386003)(81156014)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1947;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WhzgP6PYE/j8pdArVsgQ+zoO7CaA9AyR0QBGIoZOGs1TkBA1PvO5o+dWC47XjcGg+BgtF3uJRtOJIf3U2+wgXDKW/YCDBhNiVAHgYlJM8vXIOlvUSWwRFvUN7URyL7Zw0rtEPsB2i5cwLnrxC7FnX9aYmL6bWqXsmdUC98wQ/FeMq4ZMHDdXVH0ym7vUHNHP0M4SHyy8fuUawbovub3+v/UcG7m1nS4m+cX531XSNXgGV+Jf427d65IJYYDWzKa10XceNJhewSUEn0ceLL5EJpqsx2e2n8lDrmJmNbdGIsxDK2pd+zj46iGsrcN9xZx7uQRmW5bxilB1i/TUfjwLrzH1O0Y70wqXwIbV1Kq5N7WFbbQhDTWKgKJEZUcG7ueaiqiTIbkFSuWv7+VWE8wdq9f2E55nYyqbP4FgljUB2aCk6NiF4m13A99LIQBX+nfQq8bs5FNkeBI19fXT6jvARg==
Content-ID: <7AC8B235056FE8429D8AD2115D55295F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0333d3-ebac-4401-8c6a-08d748dbec27
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 15:02:49.4476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jHNWs9P24VrSVnAKiaA0p3P2y7GTMIoQUmPZcHcu1GtNjMG30m7mVeKJSv+M/7U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1947
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmPT4ktfr7oTz1U/+FrO1SsmHOi5fXHVJ7IubcNi5SM=;
 b=YfRLqXupCJjNIvioKxAZBIrOOjvDnliU6NF75IrvluB3RU068GZrAHvDtvLGo/ZXqpSs5aYhFMV8k9hTVC5GbsM35PoeWCVqAjMGLu2/4r6OlglMWia5PDhaAFOmP2F0NrsT1TglPP9ztAwoTshK7mOSks6sr5ZBN8IFfmlo8VY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgUGhpbGlwLA0KDQpBbSAwNC4xMC4xOSB1bSAxNTo0MCBzY2hyaWViIFlhbmcsIFBoaWxpcDoN
Cj4gVGhhbmtzIEpvZSBmb3IgdGhlIHRlc3QsIEkgd2lsbCBhZGQgeW91ciBUZXN0ZWQtYnkuDQo+
DQo+IEhpIENocmlzdGlhbiwNCj4NCj4gTWF5IHlvdSBoZWxwIHJldmlldz8gVGhlIGNoYW5nZSBy
ZW1vdmVzIHRoZSBnZXQgdXNlciBwYWdlcyBmcm9tDQo+IGdlbV91c2VycHRyX2lvY3RsLCB0aGlz
IHdhcyBkb25lIGlmIGZsYWdzIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSBpcw0KPiBzZXQs
IGFuZCBkZWxheSB0aGUgZ2V0IHVzZXIgcGFnZXMgdG8gYW1kZ3B1X2NzX3BhcnNlcl9ib3MsIGFu
ZCBjaGVjayBpZg0KPiB1c2VyIHBhZ2VzIGFyZSBpbnZhbGlkYXRlZCB3aGVuIGFtZGdwdV9jc19z
dWJtaXQuIEkgZG9uJ3QgZmluZCBpc3N1ZSBmb3INCj4gb3Zlcm5pZ2h0IHRlc3QsIGJ1dCBub3Qg
c3VyZSBpZiB0aGVyZSBpcyBwb3RlbnRpYWwgc2lkZSBlZmZlY3QuDQoNClllYWgsIHNlZW4gdGhh
dC4NCg0KVGhlIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSB3YXMgZXhwbGljaXRseSBhZGRl
ZCB0byBjYXVzZSBhIA0KdmFsaWRhdGlvbiBkdXJpbmcgQk8gY3JlYXRpb24gYmVjYXVzZSBvZiBz
b21lIHZlcnkgc3R1cGlkIGFwcGxpY2F0aW9ucy4NCg0KSSBkaWRuJ3Qgd2FudGVkIHRvIHJlamVj
dCB0aGF0IHdpdGhvdXQgb2ZmZXJpbmcgYW4gYWx0ZXJuYXRpdmUsIGJ1dCB3ZSANCnNlcmlvdXNs
eSBjYW4ndCBkbyB0aGlzIG9yIGl0IHdvdWxkIGJyZWFrIFZ1bGthbi9PcGVuR0wuDQoNCkkgbmVl
ZCBtb3JlIHRpbWUgdG8gdGFrZSBhIGNsb3NlciBsb29rLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFRo
YW5rcywNCj4gUGhpbGlwDQo+DQo+IE9uIDIwMTktMTAtMDMgMzo0NCBwLm0uLCBZYW5nLCBQaGls
aXAgd3JvdGU6DQo+PiB1c2VyX3BhZ2VzIGFycmF5IHNob3VsZCBhbHdheXMgYmUgZnJlZWQgYWZ0
ZXIgdmFsaWRhdGlvbiByZWdhcmRsZXNzIGlmDQo+PiB1c2VyIHBhZ2VzIGFyZSBjaGFuZ2VkIGFm
dGVyIGJvIGlzIGNyZWF0ZWQgYmVjYXVzZSB3aXRoIEhNTSBjaGFuZ2UgcGFyc2UNCj4+IGJvIGFs
d2F5cyBhbGxvY2F0ZSB1c2VyIHBhZ2VzIGFycmF5IHRvIGdldCB1c2VyIHBhZ2VzIGZvciB1c2Vy
cHRyIGJvLg0KPj4NCj4+IERvbid0IG5lZWQgdG8gZ2V0IHVzZXIgcGFnZXMgd2hpbGUgY3JlYXRp
bmcgdWVycHRyIGJvIGJlY2F1c2UgdXNlciBwYWdlcw0KPj4gd2lsbCBvbmx5IGJlIHVzZWQgd2hp
bGUgdmFsaWRhdGluZyBhZnRlciBwYXJzaW5nIHVzZXJwdHIgYm8uDQo+Pg0KPj4gQnVnemlsbGE6
IGh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3VidW50dS8rc291cmNlL2xpbnV4LytidWcvMTg0
NDk2Mg0KPj4NCj4+IHYyOiByZW1vdmUgdW51c2VkIGxvY2FsIHZhcmlhYmxlIGFuZCBhbWVuZCBj
b21taXQNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1k
LmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
LmMgIHwgIDQgKy0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dl
bS5jIHwgMjMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYw0KPj4gaW5kZXggNDliNzY3YjcyMzhmLi45NjExODZlNzExM2Ug
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4+IEBAIC00
NzQsNyArNDc0LDYgQEAgc3RhdGljIGludCBhbWRncHVfY3NfbGlzdF92YWxpZGF0ZShzdHJ1Y3Qg
YW1kZ3B1X2NzX3BhcnNlciAqcCwNCj4+ICAgIA0KPj4gICAgCWxpc3RfZm9yX2VhY2hfZW50cnko
bG9iaiwgdmFsaWRhdGVkLCB0di5oZWFkKSB7DQo+PiAgICAJCXN0cnVjdCBhbWRncHVfYm8gKmJv
ID0gdHRtX3RvX2FtZGdwdV9ibyhsb2JqLT50di5ibyk7DQo+PiAtCQlib29sIGJpbmRpbmdfdXNl
cnB0ciA9IGZhbHNlOw0KPj4gICAgCQlzdHJ1Y3QgbW1fc3RydWN0ICp1c2VybW07DQo+PiAgICAN
Cj4+ICAgIAkJdXNlcm1tID0gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcm1tKGJvLT50Ym8udHRtKTsN
Cj4+IEBAIC00OTEsMTQgKzQ5MCwxMyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19saXN0X3ZhbGlk
YXRlKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLA0KPj4gICAgDQo+PiAgICAJCQlhbWRncHVf
dHRtX3R0X3NldF91c2VyX3BhZ2VzKGJvLT50Ym8udHRtLA0KPj4gICAgCQkJCQkJICAgICBsb2Jq
LT51c2VyX3BhZ2VzKTsNCj4+IC0JCQliaW5kaW5nX3VzZXJwdHIgPSB0cnVlOw0KPj4gICAgCQl9
DQo+PiAgICANCj4+ICAgIAkJciA9IGFtZGdwdV9jc192YWxpZGF0ZShwLCBibyk7DQo+PiAgICAJ
CWlmIChyKQ0KPj4gICAgCQkJcmV0dXJuIHI7DQo+PiAgICANCj4+IC0JCWlmIChiaW5kaW5nX3Vz
ZXJwdHIpIHsNCj4+ICsJCWlmIChsb2JqLT51c2VyX3BhZ2VzKSB7DQo+PiAgICAJCQlrdmZyZWUo
bG9iai0+dXNlcl9wYWdlcyk7DQo+PiAgICAJCQlsb2JqLT51c2VyX3BhZ2VzID0gTlVMTDsNCj4+
ICAgIAkJfQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPj4gaW5k
ZXggYTgyOGUzZDBiZmJkLi4zY2NkNjFkNjk5NjQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPj4gQEAgLTI4Myw3ICsyODMsNiBAQCBpbnQgYW1kZ3B1
X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+
ICAgIGludCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwNCj4+ICAgIAkJCSAgICAgc3RydWN0IGRybV9maWxlICpmaWxwKQ0KPj4gICAg
ew0KPj4gLQlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyB0cnVlLCBmYWxzZSB9Ow0K
Pj4gICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsNCj4+
ICAgIAlzdHJ1Y3QgZHJtX2FtZGdwdV9nZW1fdXNlcnB0ciAqYXJncyA9IGRhdGE7DQo+PiAgICAJ
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqOw0KPj4gQEAgLTMyNiwzMiArMzI1LDEyIEBAIGlu
dCBhbWRncHVfZ2VtX3VzZXJwdHJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwNCj4+ICAgIAkJCWdvdG8gcmVsZWFzZV9vYmplY3Q7DQo+PiAgICAJfQ0KPj4gICAgDQo+
PiAtCWlmIChhcmdzLT5mbGFncyAmIEFNREdQVV9HRU1fVVNFUlBUUl9WQUxJREFURSkgew0KPj4g
LQkJciA9IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoYm8sIGJvLT50Ym8udHRtLT5wYWdl
cyk7DQo+PiAtCQlpZiAocikNCj4+IC0JCQlnb3RvIHJlbGVhc2Vfb2JqZWN0Ow0KPj4gLQ0KPj4g
LQkJciA9IGFtZGdwdV9ib19yZXNlcnZlKGJvLCB0cnVlKTsNCj4+IC0JCWlmIChyKQ0KPj4gLQkJ
CWdvdG8gdXNlcl9wYWdlc19kb25lOw0KPj4gLQ0KPj4gLQkJYW1kZ3B1X2JvX3BsYWNlbWVudF9m
cm9tX2RvbWFpbihibywgQU1ER1BVX0dFTV9ET01BSU5fR1RUKTsNCj4+IC0JCXIgPSB0dG1fYm9f
dmFsaWRhdGUoJmJvLT50Ym8sICZiby0+cGxhY2VtZW50LCAmY3R4KTsNCj4+IC0JCWFtZGdwdV9i
b191bnJlc2VydmUoYm8pOw0KPj4gLQkJaWYgKHIpDQo+PiAtCQkJZ290byB1c2VyX3BhZ2VzX2Rv
bmU7DQo+PiAtCX0NCj4+IC0NCj4+ICAgIAlyID0gZHJtX2dlbV9oYW5kbGVfY3JlYXRlKGZpbHAs
IGdvYmosICZoYW5kbGUpOw0KPj4gICAgCWlmIChyKQ0KPj4gLQkJZ290byB1c2VyX3BhZ2VzX2Rv
bmU7DQo+PiArCQlnb3RvIHJlbGVhc2Vfb2JqZWN0Ow0KPj4gICAgDQo+PiAgICAJYXJncy0+aGFu
ZGxlID0gaGFuZGxlOw0KPj4gICAgDQo+PiAtdXNlcl9wYWdlc19kb25lOg0KPj4gLQlpZiAoYXJn
cy0+ZmxhZ3MgJiBBTURHUFVfR0VNX1VTRVJQVFJfVkFMSURBVEUpDQo+PiAtCQlhbWRncHVfdHRt
X3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoYm8tPnRiby50dG0pOw0KPj4gLQ0KPj4gICAgcmVsZWFz
ZV9vYmplY3Q6DQo+PiAgICAJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdvYmopOw0KPj4g
ICAgDQo+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
