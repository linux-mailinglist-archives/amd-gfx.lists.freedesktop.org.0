Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060F9C8F0
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 08:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0746E178;
	Mon, 26 Aug 2019 06:08:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730069.outbound.protection.outlook.com [40.107.73.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4296E178
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 06:08:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vts43419RDl8PvUZeNXpFAxFxEuSMNxqWEadSfwQgnYtLxHD5khaoW3niwdT6SlLKYxPmL+5sYipazGfOy6oUBkMI9Su+MS4DFL/nCH/+k7jX4F+0ghnG7cyHSD3FUmLHUnAUqNq29P0NsX2TPr9HmxHJ1sXmwN2iOLq5dIzD0Jjo7MTtTwJ4TZof4GrdenYo69QFoVrwD7PzO+WgG0XzwC+R0U3qk4aCRM9mzwEnFSHcJNbAumDpCc5b2JWv6vFtNMcSwhw8MDJXRulGqg1gQiyrjk8B++y4o3wt7bQW8bYmEHKJI9ZetcSsVqzeuhHmqHyR7JBJrAPaRSwtgqwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFZLV7aaUnTyzt6+GlWeI0rKbe9BycFZbJ2LsP4TiHQ=;
 b=JOO4YsLa9JRnjrq/Wcq/xlB1YV4vFcaCicor8kyHmpumMjvo243S4rdxsApfXX39PtDj5JwfFc3fD7/nmWRsPHJm0X+7WdlEQ11Kv/pK8xmUO7AXL0zV6f+laRX4DgNKhyGyKmJvRuL4hkAdO+2+qUCkiilYUkBiBcElFZVwXdhsjc6zhTr1yCUNPmlEc1Td3VNMCfz8xgNscnrLtpG3R4Q+tucrHZck4zlOozb/0P3Z3fLephDisFaZjW3J7/B/SsgYEPSfKTV5Pcn/VDy7XMHJ/+ZxOBrNVkx1f+0cp+I+y9Lah5DeYKiQ04SfCUJGdx5hoXFcfvILXStR1dq1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4207.namprd12.prod.outlook.com (52.135.50.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 06:08:49 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 06:08:49 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/8] drm/amdgpu: add new amdgpu nbio header file
Thread-Topic: [PATCH 1/8] drm/amdgpu: add new amdgpu nbio header file
Thread-Index: AQHVW8IXS34k/ljoIUmzIYtrrYTzMacM8aUQ
Date: Mon, 26 Aug 2019 06:08:49 +0000
Message-ID: <MN2PR12MB3054CBBCC20F57B265374831B0A10@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <1566791700-1912-1-git-send-email-Hawking.Zhang@amd.com>
 <1566791700-1912-2-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1566791700-1912-2-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0303033-0bfe-4e15-fd87-08d729ebdcb7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4207; 
x-ms-traffictypediagnostic: MN2PR12MB4207:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4207406300D297EF2C4FAD2AB0A10@MN2PR12MB4207.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(13464003)(199004)(53936002)(66066001)(8936002)(316002)(110136005)(86362001)(74316002)(6436002)(52536014)(305945005)(8676002)(81156014)(81166006)(7736002)(66556008)(5660300002)(76116006)(64756008)(66446008)(33656002)(11346002)(446003)(486006)(2906002)(476003)(6506007)(53546011)(71200400001)(71190400001)(2501003)(6116002)(478600001)(14454004)(6636002)(3846002)(26005)(14444005)(66946007)(66476007)(256004)(76176011)(7696005)(102836004)(229853002)(25786009)(9686003)(55016002)(6306002)(6246003)(966005)(4326008)(99286004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4207;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5MurpqG4cQgY7/+P/W+A4Wn6lT+8tZ7oWMNDs77c8X2wQrX2efM/lfQaknByEpEvxf+Jj85QH0XnRPlT4/BTO1rtMYY8zQJPkK1p30Od5F2INX3Jp6ySrTc+qJsOMrWGXd3Wc46wYlK4MMPkyDKuPrPfaHeDuqaYbF7rMWxx4iQyA+xIqh6PTdhaekUZojg26mQkFTIxi3jPLlR4GnzPwqxVXGWhwqmZbSirjEyFX39Qvz0ZoYq62oezb0TdTX4N0PjTwIFfWQfnaQPBtpFqSFuiHOjSa7JKvKewKbF2hw96XuNm9SAo/7Eai0u+NcsMKov+Xf9GHhczrAXNTizgxjWm/FwKtYX9BPAkpv5FZ76HnhrlZe03Dp6n9WtQTUH+Zc1N8L80+BiNAQLqa2gX3AjdmKkbOhqHem31c3qcFt8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0303033-0bfe-4e15-fd87-08d729ebdcb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 06:08:49.1424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9kZiYv/XsZc5j8bmsMxRkh1HZICijYKqwVK2fVOPraNcj/hSuR8gAzTsfW8pLVQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFZLV7aaUnTyzt6+GlWeI0rKbe9BycFZbJ2LsP4TiHQ=;
 b=A9M2HRhClfGeCRjDg2nv+K8eLj8ZtOnHgmocMd2oAie+x/8qbkc9CZ7o/4BqM7BN1i4JWVldfkQ32OJpv8yFzQnb4mgdiOseKOw1rR2rZyIMsI7Bwoz5cERrrFpiwHY/v3YhturCO9/+KzstJl3Z5PwnV8dtlf1P9FqDbmt9psQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2ggIzEgfiAjNiBhbmQgcGF0Y2ggIzggYXJlOg0KDQpSZXZpZXdlZC1ieTogVGFvIFpob3Ug
PHRhby56aG91MUBhbWQuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZg0KPiBIYXdraW5nIFpoYW5nDQo+IFNlbnQ6IDIwMTnlubQ45pyIMjbml6UgMTE6NTUN
Cj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXIN
Cj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+IENjOiBaaGFuZywgSGF3a2luZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS84XSBkcm0vYW1kZ3B1OiBh
ZGQgbmV3IGFtZGdwdSBuYmlvIGhlYWRlciBmaWxlDQo+IA0KPiBNb3JlIG5iaW8gZnVuY2l0b25h
bGl0aWVzIHdpbGwgYmUgYWRkZWQgYW5kIG5iaW8gY291bGQgYmUgdHJlYXRlZCBhcyBhbiBpcA0K
PiBibG9jayBsaWtlIGdmeC9zZG1hLmV0Yw0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGF3a2luZyBa
aGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmggfCA4Nw0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbmJpby5oDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X25iaW8uaA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgNCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uMDU2MzQ3Ng0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9uYmlvLmgNCj4gQEAgLTAs
MCArMSw4NyBAQA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAyMDE5IEFkdmFuY2VkIE1pY3JvIERl
dmljZXMsIEluYy4NCj4gKyAqDQo+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBm
cmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbg0KPiArb2J0YWluaW5nIGENCj4gKyAqIGNvcHkg
b2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUN
Cj4gKyJTb2Z0d2FyZSIpLA0KPiArICogdG8gZGVhbCBpbiB0aGUgU29mdHdhcmUgd2l0aG91dCBy
ZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQNCj4gK2xpbWl0YXRpb24NCj4gKyAqIHRoZSBy
aWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLA0K
PiArc3VibGljZW5zZSwNCj4gKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUs
IGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tDQo+ICt0aGUNCj4gKyAqIFNvZnR3YXJlIGlz
IGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6
DQo+ICsgKg0KPiArICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlz
c2lvbiBub3RpY2Ugc2hhbGwgYmUNCj4gK2luY2x1ZGVkIGluDQo+ICsgKiBhbGwgY29waWVzIG9y
IHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0d2FyZS4NCj4gKyAqDQo+ICsgKiBUSEUg
U09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lO
RCwNCj4gK0VYUFJFU1MgT1INCj4gKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlU
RUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YNCj4gK01FUkNIQU5UQUJJTElUWSwNCj4gKyAqIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuICBJTiBOTw0K
PiBFVkVOVA0KPiArU0hBTEwNCj4gKyAqIFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhP
UihTKSBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwNCj4gK0RBTUFHRVMgT1INCj4gKyAqIE9USEVS
IExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1INCj4g
K09USEVSV0lTRSwNCj4gKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04g
V0lUSCBUSEUgU09GVFdBUkUgT1INCj4gVEhFIFVTRQ0KPiArT1INCj4gKyAqIE9USEVSIERFQUxJ
TkdTIElOIFRIRSBTT0ZUV0FSRS4NCj4gKyAqDQo+ICsgKi8NCj4gKyNpZm5kZWYgX19BTURHUFVf
TkJJT19IX18NCj4gKyNkZWZpbmUgX19BTURHUFVfTkJJT19IX18NCj4gKw0KPiArLyoNCj4gKyAq
IGFtZGdwdSBuYmlvIGZ1bmN0aW9ucw0KPiArICovDQo+ICtzdHJ1Y3QgbmJpb19oZHBfZmx1c2hf
cmVnIHsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwMDsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2Nw
MTsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwMjsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwMzsN
Cj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwNDsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwNTsNCj4g
Kwl1MzIgcmVmX2FuZF9tYXNrX2NwNjsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwNzsNCj4gKwl1
MzIgcmVmX2FuZF9tYXNrX2NwODsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX2NwOTsNCj4gKwl1MzIg
cmVmX2FuZF9tYXNrX3NkbWEwOw0KPiArCXUzMiByZWZfYW5kX21hc2tfc2RtYTE7DQo+ICsJdTMy
IHJlZl9hbmRfbWFza19zZG1hMjsNCj4gKwl1MzIgcmVmX2FuZF9tYXNrX3NkbWEzOw0KPiArCXUz
MiByZWZfYW5kX21hc2tfc2RtYTQ7DQo+ICsJdTMyIHJlZl9hbmRfbWFza19zZG1hNTsNCj4gKwl1
MzIgcmVmX2FuZF9tYXNrX3NkbWE2Ow0KPiArCXUzMiByZWZfYW5kX21hc2tfc2RtYTc7DQo+ICt9
Ow0KPiArDQo+ICtzdHJ1Y3QgYW1kZ3B1X25iaW9fZnVuY3Mgew0KPiArCWNvbnN0IHN0cnVjdCBu
YmlvX2hkcF9mbHVzaF9yZWcgKmhkcF9mbHVzaF9yZWc7DQo+ICsJdTMyICgqZ2V0X2hkcF9mbHVz
aF9yZXFfb2Zmc2V0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICsJdTMyICgqZ2V0
X2hkcF9mbHVzaF9kb25lX29mZnNldCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiAr
CXUzMiAoKmdldF9wY2llX2luZGV4X29mZnNldCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Ow0KPiArCXUzMiAoKmdldF9wY2llX2RhdGFfb2Zmc2V0KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldik7DQo+ICsJdTMyICgqZ2V0X3Jldl9pZCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Ow0KPiArCXZvaWQgKCptY19hY2Nlc3NfZW5hYmxlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgYm9vbCBlbmFibGUpOw0KPiArCXZvaWQgKCpoZHBfZmx1c2gpKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3JpbmcNCj4gKnJpbmcpOw0KPiArCXUzMiAoKmdldF9t
ZW1zaXplKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICsJdm9pZCAoKnNkbWFfZG9v
cmJlbGxfcmFuZ2UpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQNCj4gaW5zdGFuY2Us
DQo+ICsJCQlib29sIHVzZV9kb29yYmVsbCwgaW50IGRvb3JiZWxsX2luZGV4LCBpbnQNCj4gZG9v
cmJlbGxfc2l6ZSk7DQo+ICsJdm9pZCAoKnZjbl9kb29yYmVsbF9yYW5nZSkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIGJvb2wNCj4gdXNlX2Rvb3JiZWxsLA0KPiArCQkJCSAgIGludCBkb29y
YmVsbF9pbmRleCwgaW50IGluc3RhbmNlKTsNCj4gKwl2b2lkICgqZW5hYmxlX2Rvb3JiZWxsX2Fw
ZXJ0dXJlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCQkJIGJvb2wgZW5hYmxl
KTsNCj4gKwl2b2lkICgqZW5hYmxlX2Rvb3JiZWxsX3NlbGZyaW5nX2FwZXJ0dXJlKShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZQ0KPiAqYWRldiwNCj4gKwkJCQkJCSAgYm9vbCBlbmFibGUpOw0KPiArCXZv
aWQgKCppaF9kb29yYmVsbF9yYW5nZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJ
CQkJICBib29sIHVzZV9kb29yYmVsbCwgaW50IGRvb3JiZWxsX2luZGV4KTsNCj4gKwl2b2lkICgq
dXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19nYXRpbmcpKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+
ICphZGV2LA0KPiArCQkJCQkJIGJvb2wgZW5hYmxlKTsNCj4gKwl2b2lkICgqdXBkYXRlX21lZGl1
bV9ncmFpbl9saWdodF9zbGVlcCkoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsDQo+ICsJ
CQkJCQlib29sIGVuYWJsZSk7DQo+ICsJdm9pZCAoKmdldF9jbG9ja2dhdGluZ19zdGF0ZSkoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkJICAgICAgdTMyICpmbGFncyk7DQo+ICsJ
dm9pZCAoKmloX2NvbnRyb2wpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gKwl2b2lk
ICgqaW5pdF9yZWdpc3RlcnMpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gKwl2b2lk
ICgqZGV0ZWN0X2h3X3ZpcnQpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsNCj4gKwl2b2lk
ICgqcmVtYXBfaGRwX3JlZ2lzdGVycykoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyB9Ow0K
PiArDQo+ICtzdHJ1Y3QgYW1kZ3B1X25iaW8gew0KPiArCWNvbnN0IHN0cnVjdCBuYmlvX2hkcF9m
bHVzaF9yZWcgKmhkcF9mbHVzaF9yZWc7DQo+ICsJY29uc3Qgc3RydWN0IGFtZGdwdV9uYmlvX2Z1
bmNzICpmdW5jczsgfTsNCj4gKw0KPiArI2VuZGlmDQo+IC0tDQo+IDIuNy40DQo+IA0KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
