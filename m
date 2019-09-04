Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880ABA96AD
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 00:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97C689CB2;
	Wed,  4 Sep 2019 22:47:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720042.outbound.protection.outlook.com [40.107.72.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DED289CB2
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 22:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgrMMoNQ7TyandLPoE9KlSeOHle0BnJuqqmUyb7YUQkkNnuFmyUJPF+523vhS0CMuX0itaLa5szR3R8EoEoz9reEXW0I+N4j0JTVcv8GSg8B8BCrM+EdlXUk8OE5XBbCYui+P3VPfuH+k5MEyGCJYRcEcg0Hb2Gf+YP0VQ9YPPtEX5OliQFv3eSUXGOeT0JGY8UsSWjanuxSRZfo2V0A9Vc8CPMdx2y1A/pb7VtuFvBDEfcHino+HGG3q/7sB/tl18jkoagk6+MCAacp+JD0IYLyReJhQVNKYzrmQdPrgFBMczMa8nZnaejALXN6fniYstffCA5wc5VOsJkqD0hoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfBOkZ3/8EWnNDBDa0M+XeuFqSJXi37PHX64kdlwS88=;
 b=NPwbpVUP4deyfHvlMsc2ii8EwjhfzftcbA6uu1VbVhvmMs1MTemab6coI5/2/vmAOF9bIyHHonl6SM6I1+vwDChhgqzWVMqY8Be4CWyDnPv5619NI+eMTJeY0lGEHd+GUUglDPCQzX0VM/RXLvecBot60fxjmFof49eeIYnaDE9VuDJCrItGwmLYrag6UK2OkbFCEUqkBcsBKt7Ext/oIItcijVZVCAKDwx/763YkuD47Ymf1mH495iUDP2lHLTjqQYUOZMozRtQrWePh9lSPj1khLCaLNOa1PW3yR/L0ZqSQU5mhQm5sgSmAyNgQJusr0xvhW+8/PX1cOrr4ikqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2825.namprd12.prod.outlook.com (20.177.221.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 22:47:25 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:47:25 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Topic: [PATCH 9/9] drm/amdgpu: add graceful VM fault handling v2
Thread-Index: AQHVYzHR/sgWShj45kG3d7zhWR3IDKccHwwA
Date: Wed, 4 Sep 2019 22:47:25 +0000
Message-ID: <4b5365d3-cc8c-1c2a-2675-f74baa4b9e8b@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
 <20190904150230.13885-10-christian.koenig@amd.com>
In-Reply-To: <20190904150230.13885-10-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YT1PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::41)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b11d5dd5-59a4-452b-3dec-08d73189db33
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2825; 
x-ms-traffictypediagnostic: DM6PR12MB2825:
x-microsoft-antispam-prvs: <DM6PR12MB282514EDB32ADCE3F4DBAC3192B80@DM6PR12MB2825.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(199004)(189003)(71200400001)(31696002)(6486002)(8676002)(186003)(110136005)(81166006)(81156014)(65806001)(65956001)(66066001)(53546011)(6506007)(386003)(66574012)(26005)(6512007)(446003)(86362001)(8936002)(14444005)(36756003)(31686004)(52116002)(6246003)(58126008)(256004)(478600001)(66556008)(66476007)(486006)(71190400001)(66446008)(53936002)(229853002)(5660300002)(11346002)(2616005)(64756008)(316002)(476003)(2906002)(14454004)(99286004)(7736002)(76176011)(6116002)(3846002)(6436002)(102836004)(25786009)(2501003)(305945005)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2825;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EslCkS1gA/hTiefYJbVhDuLZon64ow10MUhHjPgLjTbmXddwakfDedBu214sbHdnskwPtRoodZ1iNqWcwYHfTu2yupRiCaB/pyaRw3k1PfG0fBCXaInsxOsPYpvJpoyfgIBkv0JX7mj2h06pvGV8BY3gGRg5/PEp3HGFWXKwgxz/30nLggyCLzGl/6oiC+joWF1zs1HKY5ZnCp4e4wS8tvQO9KJUE7ODh7x2wKaSTt0bQyYcSgQa1jajrbcQsA2b2VEFqJo05XBU3dgtYhDnCe6a16JJp/HyA3ryJkdfwFDA7OzNiHGynmNFHdkDbkvsIqREV3MWdVp5e0isFSQj/vpVK1ANQyW0oYYiv/98A07dbXhVbXqKnperzD9DZR19OrqJvN8gFllr78ZhZ7QsE81B2L8X0+l2+mvFC5ohqoA=
x-ms-exchange-transport-forked: True
Content-ID: <F62041B011EB694EA64E33671D604730@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11d5dd5-59a4-452b-3dec-08d73189db33
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:47:25.6102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QJgWbSRkSDsDP6XgnCww2q2MMXNspa0Je8tbdv4iiqQNfmhfH2s1m7ftXlAa30ZVGTQo1yhr6fkdMIvJ8hN/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2825
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfBOkZ3/8EWnNDBDa0M+XeuFqSJXi37PHX64kdlwS88=;
 b=Y+jysEA/PLqFX1lTpcfDB0IcUfUoyKpzFEHnrNt/7lMq95x2Q042oOk5lgk1/bHuaH/CvST9BHFKf/6C9IT33zXqVRIgX2PZt8NIi9QnNhnwnZDuSfKpDt2dUu2L4L1j0xzk5NdaVRP62T346NVQMg9VU8BbivjoG5wk/AnYNas=
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

T24gMjAxOS0wOS0wNCAxMTowMiBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBOZXh0
IHN0ZXAgdG93YXJkcyBITU0gc3VwcG9ydC4gRm9yIG5vdyBqdXN0IHNpbGVuY2UgdGhlIHJldHJ5
IGZhdWx0IGFuZA0KPiBvcHRpb25hbGx5IHJlZGlyZWN0IHRoZSByZXF1ZXN0IHRvIHRoZSBkdW1t
eSBwYWdlLg0KPg0KPiB2MjogbWFrZSBzdXJlIHRoZSBWTSBpcyBub3QgZGVzdHJveWVkIHdoaWxl
IHdlIGhhbmRsZSB0aGUgZmF1bHQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHwgIDIgKw0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgIHwgIDQgKysNCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZtLmMNCj4gaW5kZXggOTUxNjA4ZmMxOTI1Li40MTBkODk5NjZhNjYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IEBAIC0zMTQyLDMgKzMxNDIs
NzcgQEAgdm9pZCBhbWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkN
Cj4gICAJCX0NCj4gICAJfQ0KPiAgIH0NCj4gKw0KPiArLyoqDQo+ICsgKiBhbWRncHVfdm1faGFu
ZGxlX2ZhdWx0IC0gZ3JhY2VmdWwgaGFuZGxpbmcgb2YgVk0gZmF1bHRzLg0KPiArICogQGFkZXY6
IGFtZGdwdSBkZXZpY2UgcG9pbnRlcg0KPiArICogQHBhc2lkOiBQQVNJRCBvZiB0aGUgVk0NCj4g
KyAqIEBhZGRyOiBBZGRyZXNzIG9mIHRoZSBmYXVsdA0KPiArICoNCj4gKyAqIFRyeSB0byBncmFj
ZWZ1bGx5IGhhbmRsZSBhIFZNIGZhdWx0LiBSZXR1cm4gdHJ1ZSBpZiB0aGUgZmF1bHQgd2FzIGhh
bmRsZWQgYW5kDQo+ICsgKiBzaG91bGRuJ3QgYmUgcmVwb3J0ZWQgYW55IG1vcmUuDQo+ICsgKi8N
Cj4gK2Jvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgdW5zaWduZWQgaW50IHBhc2lkLA0KPiArCQkJICAgIHVpbnQ2NF90IGFkZHIpDQo+ICt7DQo+
ICsJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gJmFkZXYtPnNkbWEuaW5zdGFuY2VbMF0ucGFn
ZTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpyb290Ow0KPiArCXVpbnQ2NF90IHZhbHVlLCBmbGFn
czsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X3ZtICp2bTsNCj4gKwlsb25nIHI7DQo+ICsNCj4gKwlpZiAo
IXJpbmctPnNjaGVkLnJlYWR5KQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlzcGluX2xv
Y2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7DQo+ICsJdm0gPSBpZHJfZmluZCgmYWRl
di0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBhc2lkKTsNCj4gKwlpZiAodm0pDQo+ICsJCXJvb3Qg
PSBhbWRncHVfYm9fcmVmKHZtLT5yb290LmJhc2UuYm8pOw0KPiArCWVsc2UNCj4gKwkJcm9vdCA9
IE5VTEw7DQo+ICsJc3Bpbl91bmxvY2soJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7DQo+
ICsNCj4gKwlpZiAoIXJvb3QpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCXIgPSBhbWRn
cHVfYm9fcmVzZXJ2ZShyb290LCB0cnVlKTsNCj4gKwlpZiAocikNCj4gKwkJZ290byBlcnJvcl91
bnJlZjsNCj4gKw0KPiArCXNwaW5fbG9jaygmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrKTsN
Cj4gKwl2bSA9IGlkcl9maW5kKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwgcGFzaWQpOw0K
PiArCXNwaW5fdW5sb2NrKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2spOw0KDQpJIHRoaW5r
IHRoaXMgZGVzZXJ2ZXMgYSBjb21tZW50LiBJZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5LCB5
b3UncmUgDQpsb29raW5nIHVwIHRoZSB2bSB0d2ljZSBzbyB0aGF0IHlvdSBoYXZlIHRoZSBWTSBy
b290IHJlc2VydmF0aW9uIHRvIA0KcHJvdGVjdCBhZ2FpbnN0IHVzZXItYWZ0ZXItZnJlZS4gT3Ro
ZXJ3aXNlIHRoZSB2bSBwb2ludGVyIGlzIG9ubHkgdmFsaWQgDQphcyBsb25nIGFzIHlvdSdyZSBo
b2xkaW5nIHRoZSBzcGluLWxvY2suDQoNCg0KPiArDQo+ICsJaWYgKCF2bSB8fCB2bS0+cm9vdC5i
YXNlLmJvICE9IHJvb3QpDQoNClRoZSBjaGVjayBvZiB2bS0+cm9vdC5iYXNlLmJvIHNob3VsZCBw
cm9iYWJseSBzdGlsbCBiZSB1bmRlciB0aGUgDQpzcGluX2xvY2suIEJlY2F1c2UgeW91J3JlIG5v
dCBzdXJlIHlldCBpdCdzIHRoZSByaWdodCBWTSwgeW91IGNhbid0IHJlbHkgDQpvbiB0aGUgcmVz
ZXJ2YXRpb24gaGVyZSB0byBwcmV2ZW50IHVzZS1hZnRlci1mcmVlLg0KDQoNCj4gKwkJZ290byBl
cnJvcl91bmxvY2s7DQo+ICsNCj4gKwlhZGRyIC89IEFNREdQVV9HUFVfUEFHRV9TSVpFOw0KPiAr
CWZsYWdzID0gQU1ER1BVX1BURV9WQUxJRCB8IEFNREdQVV9QVEVfU05PT1BFRCB8DQo+ICsJCUFN
REdQVV9QVEVfU1lTVEVNOw0KPiArDQo+ICsJaWYgKGFtZGdwdV92bV9mYXVsdF9zdG9wID09IEFN
REdQVV9WTV9GQVVMVF9TVE9QX05FVkVSKSB7DQo+ICsJCS8qIFJlZGlyZWN0IHRoZSBhY2Nlc3Mg
dG8gdGhlIGR1bW15IHBhZ2UgKi8NCj4gKwkJdmFsdWUgPSBhZGV2LT5kdW1teV9wYWdlX2FkZHI7
DQo+ICsJCWZsYWdzIHw9IEFNREdQVV9QVEVfRVhFQ1VUQUJMRSB8IEFNREdQVV9QVEVfUkVBREFC
TEUgfA0KPiArCQkJQU1ER1BVX1BURV9XUklURUFCTEU7DQo+ICsJfSBlbHNlIHsNCj4gKwkJdmFs
dWUgPSAwOw0KPiArCX0NCj4gKw0KPiArCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmco
YWRldiwgdm0sIHRydWUsIE5VTEwsIGFkZHIsIGFkZHIgKyAxLA0KPiArCQkJCQlmbGFncywgdmFs
dWUsIE5VTEwsIE5VTEwpOw0KPiArCWlmIChyKQ0KPiArCQlnb3RvIGVycm9yX3VubG9jazsNCj4g
Kw0KPiArCXIgPSBhbWRncHVfdm1fdXBkYXRlX3BkZXMoYWRldiwgdm0sIHRydWUpOw0KPiArDQo+
ICtlcnJvcl91bmxvY2s6DQo+ICsJYW1kZ3B1X2JvX3VucmVzZXJ2ZShyb290KTsNCj4gKwlpZiAo
ciA8IDApDQo+ICsJCURSTV9FUlJPUigiQ2FuJ3QgaGFuZGxlIHBhZ2UgZmF1bHQgKCVsZClcbiIs
IHIpOw0KPiArDQo+ICtlcnJvcl91bnJlZjoNCj4gKwlhbWRncHVfYm9fdW5yZWYoJnJvb3QpOw0K
PiArDQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uaA0KPiBpbmRleCAwYTk3ZGM4MzlmM2IuLjRkYmJlMWI2YjQxMyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4gQEAgLTQxMyw2ICs0MTMsOCBA
QCB2b2lkIGFtZGdwdV92bV9jaGVja19jb21wdXRlX2J1ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7DQo+ICAgDQo+ICAgdm9pZCBhbWRncHVfdm1fZ2V0X3Rhc2tfaW5mbyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgaW50IHBhc2lkLA0KPiAgIAkJCSAgICAgc3RydWN0
IGFtZGdwdV90YXNrX2luZm8gKnRhc2tfaW5mbyk7DQo+ICtib29sIGFtZGdwdV92bV9oYW5kbGVf
ZmF1bHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVuc2lnbmVkIGludCBwYXNpZCwNCj4g
KwkJCSAgICB1aW50NjRfdCBhZGRyKTsNCj4gICANCj4gICB2b2lkIGFtZGdwdV92bV9zZXRfdGFz
a19pbmZvKHN0cnVjdCBhbWRncHVfdm0gKnZtKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jDQo+IGluZGV4IDlkMTU2NzlkZjZlMC4uMTVhMWNlNTFiZWZhIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gQEAgLTM1Myw2ICszNTMs
MTAgQEAgc3RhdGljIGludCBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwNCj4gICAJfQ0KPiAgIA0KPiAgIAkvKiBJZiBpdCdzIHRoZSBmaXJzdCBm
YXVsdCBmb3IgdGhpcyBhZGRyZXNzLCBwcm9jZXNzIGl0IG5vcm1hbGx5ICovDQo+ICsJaWYgKHJl
dHJ5X2ZhdWx0ICYmICFpbl9pbnRlcnJ1cHQoKSAmJg0KPiArCSAgICBhbWRncHVfdm1faGFuZGxl
X2ZhdWx0KGFkZXYsIGVudHJ5LT5wYXNpZCwgYWRkcikpDQo+ICsJCXJldHVybiAxOyAvKiBUaGlz
IGFsc28gcHJldmVudHMgc2VuZGluZyBpdCB0byBLRkQgKi8NCg0KVGhlICFpbl9pbnRlcnJ1cHQo
KSBpcyBtZWFudCB0byBvbmx5IGRvIHRoaXMgb24gdGhlIHJlcm91dGVkIGludGVycnVwdCANCnJp
bmcgdGhhdCdzIGhhbmRsZWQgYnkgYSB3b3JrZXIgZnVuY3Rpb24/DQoNCkxvb2tzIGxpa2UgYW1k
Z3B1X3ZtX2hhbmRsZV9mYXVsdCBuZXZlciByZXR1cm5zIHRydWUgZm9yIG5vdy4gU28gd2UnbGwg
DQpuZXZlciBnZXQgdG8gdGhlICJyZXR1cm4gMSIgaGVyZS4NCg0KUmVnYXJkcywNCiDCoCBGZWxp
eA0KDQoNCj4gKw0KPiAgIAlpZiAoIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgew0KPiAgIAkJLyoN
Cj4gICAJCSAqIElzc3VlIGEgZHVtbXkgcmVhZCB0byB3YWl0IGZvciB0aGUgc3RhdHVzIHJlZ2lz
dGVyIHRvDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
