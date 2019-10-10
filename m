Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50035D27F0
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 13:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73D16EB00;
	Thu, 10 Oct 2019 11:27:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A66B6EB01
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 11:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTXmVHbQQlXJ9o4fVa6QWSbOm7DCJqD7eWSH3i3zUXdmYWc1yVm0S0pYA2lMPvYlumsqxI7X9Val/tZ0L2jwwilkRArbE7/fpoVXqMuth2REEViOdhiwdhEQD8uSDL77W7NUhRfqPD5VImfUrmS/t5J9BEhfBdeWhhc8je+zjJooSL4mo5TzaM1T1y43O5MqizwSSpupScJ3J6pYqjZY9etCldZW9q8oNCBqqADwNYe5AVMU2w5/pAowva6GcWzVQaB0CxpGpdYnW9DwMNkFRXtW66wDm0USqZw3hcI8I6tNnwwzOkSOhE3YVrkbp4xavN08X9ArnfSLQsaUDg8g1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9aTEyrD2i9q6xil0I4RWarn+DPbzVsEufBVdwW3nWQ=;
 b=J0ThynyF57rEqwLTXz2EH97Yh2Vhl0DdkMvdbUqUoaOHBGFotv9arZcrLhUxz4R21WZeahIroT4YE4+MT1/fVUL/mFV4HusdbDB3Qyq3bArZ1uSGDHdO1oDbroIC5LZsZ55q0APwynSgVutnQ5ipsrm3M45A6c9VByRU9prHzXoK64RZ2PAZH7jcnHALoXgv/ctGAduVADHHKhrpRTqZ4h62245WBpHxbg4qWTEOHZssqkqAxxyG8WdJgO6NJ5wPpn/d4u63/oiou0gWk1HzxJSJcYKK3AGUAaqqhjAHTb2vcuC8nLOxROJO8EDhBZU0WySvLp/RnsG8mdIr7Z5X9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1865.namprd12.prod.outlook.com (10.175.87.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 11:27:02 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0%7]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 11:27:02 +0000
From: Nirmoy <nirmodas@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Nirmoy Das
 <nirmoy.aiemd@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [RFC PATCH] drm/amdgpu: fix amdgpu_vm_handle_fault return value
Thread-Topic: [RFC PATCH] drm/amdgpu: fix amdgpu_vm_handle_fault return value
Thread-Index: AQHVf1drnY4Hi0o/4UiJ4OgK3ekqdqdTupeAgAAB+oA=
Date: Thu, 10 Oct 2019 11:27:01 +0000
Message-ID: <132de37c-a5f0-1b24-0f47-d581f689d943@amd.com>
References: <20191010104214.38728-1-nirmoy.das@amd.com>
 <df4bd681-d745-4cb0-3dec-38e826f4c9fe@amd.com>
In-Reply-To: <df4bd681-d745-4cb0-3dec-38e826f4c9fe@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:208:160::22) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:c5:8f31:4000:7337:b3fc:bace:7417]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31cffba9-dfee-4f7c-0fc2-08d74d74c551
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1865:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB186510B82AE4823D865D9F8F8B940@DM5PR12MB1865.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(189003)(199004)(66476007)(64756008)(6512007)(102836004)(476003)(6116002)(66446008)(66556008)(31696002)(486006)(66946007)(52116002)(186003)(14454004)(6636002)(446003)(256004)(2616005)(7736002)(14444005)(6486002)(5660300002)(6246003)(71200400001)(71190400001)(305945005)(229853002)(6506007)(478600001)(316002)(25786009)(6436002)(54906003)(53546011)(386003)(31686004)(46003)(110136005)(36756003)(11346002)(81166006)(8676002)(81156014)(2906002)(4326008)(8936002)(76176011)(99286004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1865;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GeMKwouDJ61S7zqh2QwNLhkmes9i1Uyvg3UNuDzu9WNxKZpMoiVAbGZJYq6cK3V5dg2k5/UjfFHvQQS/NCIK944zxploV2w1dQUJtrKm+5tXHQArxxtGZiAZmSeWoS4CGyQXfl3j5EMNJAfNRxRH2I7ne5kMq+7tSmy5j5uzCMGda4mekvaU4kCe0prxWraFd6fgPwYycRCk02Yqj8avfSyaz7ZY5EKsnrz4L3rUO9fLoDy4SocpW2GrktgKGHpzM4WKeUZA51oeNYe0yHOCuhY1kd0AxLHQodp+mBs50sVMR/Actj5FQrQhQBTQUscntKiS9GJjKVcmUwVaRglfAfz1ST5Q0M+BBazFWnL0p/aw+2U+gcV/sUD6+UZK6TMEMSoTlepcM/RM2wpUsKFPM8R2gMxqAiAs1GKzM8EhCao=
Content-ID: <FFCE3CC7D95E6F40AE0CAE769EB3A2FD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cffba9-dfee-4f7c-0fc2-08d74d74c551
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 11:27:01.9942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +7sILB03GsOU6CRTDBibKOeLOoXVz/jZmfqCsHuX6uzKq/IFu1JdDHunYKU8lr7GOZt7QiexGOBhnU6cbCKVsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1865
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9aTEyrD2i9q6xil0I4RWarn+DPbzVsEufBVdwW3nWQ=;
 b=yNHmkUty6PwKVdkjeNm230l5ouB9IaDULitm+56MP0cnNwDMbHH52gt8F2PnvqAZcrzjSrEBR8gwb2ilTvYQxhEYyAL/mzcPuH3V3Q7dh5sNJfRmjWFqiJo4J3P1YuBOQImDFHCaaQsC/H0mBj0NspDTBE8bozrkd6NmuTO9dHI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
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
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAxMC8xMC8xOSAxOjE5IFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4gQW0gMTAu
MTAuMTkgdW0gMTI6NDIgc2NocmllYiBOaXJtb3kgRGFzOg0KPj4gYW1kZ3B1X3ZtX2hhbmRsZV9m
YXVsdCBzaG91bGQgcmV0dXJuIHRydWUgb24gc3VjY2Vzcw0KPiBOQUssIHRoYXQgaXMgaW50ZW50
aW9uYWwuDQo+DQo+IFRoZXJlIGlzIGEgZm9sbG93IHVwIHBhdGNoIHdoaWNoIGRpZG4ndCBtYWRl
IGl0IGludG8gb3VyIHNlcnZlciBicmFuY2gNCj4gd2hpY2ggaW1wbGVtZW50cyBmYXVsdHMgaGFu
ZGxpbmcuDQoNCkluIHRoYXQgY2FzZSBJIHRoaW5rIGl0IGlzIGdvb2QgYXMgaXQgaXMuDQoNClRo
YW5rcywNCg0KTmlybW95DQoNCj4gV2UgY291bGQgYWN0dWFsbHkgY2hhbmdlIHRoZSByZXR1cm4g
dmFsdWUgdG8gdm9pZCB1bnRpbCB0aGF0IG9uZSBsYW5kcywNCj4gQ2hyaXN0aWFuLg0KPg0KPj4g
U2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPg0KPj4gLS0tDQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0NCj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+PiBpbmRleCBkOWJlY2U5ODdlNjAu
LjZmNDY4YzZmZmVmMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYw0KPj4gQEAgLTMyMTUsNSArMzIxNSw1IEBAIGJvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVs
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgaW50IHBhc2lkLA0KPj4gICAg
ZXJyb3JfdW5yZWY6DQo+PiAgICAJYW1kZ3B1X2JvX3VucmVmKCZyb290KTsNCj4+ICAgIA0KPj4g
LQlyZXR1cm4gZmFsc2U7DQo+PiArCXJldHVybiAociA9PSAwKSA/IHRydWUgOiBmYWxzZTsNCj4+
ICAgIH0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
