Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF085575B
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 20:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DC66E191;
	Tue, 25 Jun 2019 18:45:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45D46E191
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 18:45:07 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB2821.namprd12.prod.outlook.com (20.177.229.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 18:45:06 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 18:45:05 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernstp@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/amd/amdgpu: Check stream in
 amdgpu_dm_commit_planes
Thread-Topic: [PATCH 4/6] drm/amd/amdgpu: Check stream in
 amdgpu_dm_commit_planes
Thread-Index: AQHVKp+9dHd0rdDWCE+EL5tWWg+8GKastvOA
Date: Tue, 25 Jun 2019 18:45:05 +0000
Message-ID: <e57dacfc-66fd-81e1-ec6d-7056fe70736d@amd.com>
References: <20190624151544.13934-1-ernstp@gmail.com>
 <20190624151544.13934-4-ernstp@gmail.com>
In-Reply-To: <20190624151544.13934-4-ernstp@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::31) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dfaa880-e219-4c29-a8f3-08d6f99d3d24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2821; 
x-ms-traffictypediagnostic: BYAPR12MB2821:
x-microsoft-antispam-prvs: <BYAPR12MB28216074944240850707CEB0ECE30@BYAPR12MB2821.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(376002)(39860400002)(366004)(189003)(199004)(31686004)(6512007)(478600001)(66476007)(53546011)(66946007)(66556008)(316002)(386003)(6506007)(52116002)(7736002)(53936002)(25786009)(6486002)(72206003)(66446008)(26005)(305945005)(68736007)(6436002)(73956011)(64756008)(102836004)(99286004)(2906002)(2501003)(76176011)(31696002)(486006)(66066001)(81156014)(6116002)(36756003)(5660300002)(14454004)(186003)(3846002)(6246003)(81166006)(8936002)(71190400001)(71200400001)(476003)(2616005)(446003)(11346002)(66574012)(256004)(86362001)(14444005)(110136005)(229853002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2821;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mAlwsonauZ2VRmycLELxWNcAEs3dCHeY/z2Sd6suWCHvTANvgvJizQtqSzI5D8DYyEvb5vof2UrdE1EWjHd19JDiL8YNExyGcWi2i2wvXlAWLlnpPCqPg1GkjMxuJBpVhJMhr8Oe6ZBw8chRE92GOPyrq7Y75YzQLMtJH9/QnDevlLW2MmOL8lMpF/rb0loeG5BxgEixFhj5SGjuwJWMMaIa+2kP/xuBPDgAT5eTjGihLZtk0NS1kxdW3D9+0ljDsa7wkbXcDv0NI7YNvJwkA9mQ+L7qC1KAEdWrYog1FiP3U3iLgL+3ZBdAQZMqkypxI83s9Kb10gtbw+4kRWz9klNYkc+lg39nLouPBYH3tN5bwkM1ymS9Q92RXC1FMD4qnIy4dXguDLCszDbfesiS0sFDhNVKrIgRPWcjZNNsZsU=
Content-ID: <84D0629DAB5D6747AD0C1FB1D0A691C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfaa880-e219-4c29-a8f3-08d6f99d3d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 18:45:05.8203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2821
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WLFI4G6sqTKziHOzZ2FDQFd2ggl4xe1TVloQTzAH/w=;
 b=mPV5Yw3/LUB949vDo6q4CRv7gZVg31bj5uLtBqLzljG1X2sjZvMv0MiCpfOebpRICdi2zFaVrXFo30DB3BwjJ7hOPNyXtX2PXvvz9EZHSpheMxmetbOucHFmEG05u2bs7fBNuXTn1Mvbcc8gjz/SSZxSHHUQe/5vt6OnqaSen5M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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

T24gNi8yNC8xOSAxMToxNSBBTSwgRXJuc3QgU2rDtnN0cmFuZCB3cm90ZToNCj4gUmVwb3J0ZWQg
Ynkgc21hdGNoOg0KPiBhbWRncHVfZG0uYzo1NjM3IGFtZGdwdV9kbV9jb21taXRfcGxhbmVzKCkg
ZXJyb3I6IHdlIHByZXZpb3VzbHkgYXNzdW1lZCAnYWNydGNfc3RhdGUtPnN0cmVhbScgY291bGQg
YmUgbnVsbA0KPiBUaGlzIHNlZW1zIHRvIGJlIGNoZWNrZWQgZm9yIG51bGwgcHJldHR5IGNvbnNp
c3RlbnRseSBlbHNld2hlcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFcm5zdCBTasO2c3RyYW5k
IDxlcm5zdHBAZ21haWwuY29tPg0KDQpUaGlzIGlzIGFscmVhZHkgcmV2aWV3ZWQgYW5kIG1lcmdl
ZCwgYnV0IHRoaXMgTlVMTCBjaGVjayBpcyBhY3R1YWxseSANCnVubmVjZXNzYXJ5LiBUaGlzIGZ1
bmN0aW9uIGRvZXNuJ3QgcnVuIGluIHRoZSBuZXdfY3J0Y19zdGF0ZS0+c3RyZWFtIGlzIA0KTlVM
TC4NCg0KVGVjaG5pY2FsbHkgdGhlIGJlaGF2aW9yIGRvZXMgY2hhbmdlIGluc2lkZSANCmRjX2Nv
bW1pdF91cGRhdGVzX2Zvcl9zdHJlYW0uIFdlIGRvbid0IGFjdHVhbGx5IGRlZmVyZW5jZSB0aGUg
c3RyZWFtIA0KYW55d2hlcmUgYXMgZmFyIGFzIEkgY2FuIHRlbGwsIGJ1dCB3ZSBkbyBhbiBwcmVw
YXJlL29wdGltaXplIGJhbmR3aWR0aCANCmFuZCBhIHN0YXRlIHN3YXAuIFRoZSBtaXNzaW5nIHN0
YXRlIHN3YXAgd291bGQgbWF0dGVyIGhlcmUsIGJ1dCBvbmNlIA0KYWdhaW4sIHdlIGRvbid0IGFj
dHVhbGx5IHJ1biB0aGlzIGZ1bmN0aW9uIGF0IGFsbC4NCg0KQWxsIHRoZXNlIGNoZWNrcyBzaG91
bGQgcHJvYmFibHkganVzdCBiZSBkcm9wcGVkLg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoNCj4g
LS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyB8IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jDQo+IGluZGV4IDU4ZDdiYmM1YWRhNy4uMzYwYjMxYTVjMDI4IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMNCj4gQEAgLTU2NjksNyArNTY2OSw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRf
cGxhbmVzKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gICAJfQ0KPiAgIA0KPiAg
IAkvKiBVcGRhdGUgdGhlIHBsYW5lcyBpZiBjaGFuZ2VkIG9yIGRpc2FibGUgaWYgd2UgZG9uJ3Qg
aGF2ZSBhbnkuICovDQo+IC0JaWYgKHBsYW5lc19jb3VudCB8fCBhY3J0Y19zdGF0ZS0+YWN0aXZl
X3BsYW5lcyA9PSAwKSB7DQo+ICsJaWYgKChwbGFuZXNfY291bnQgfHwgYWNydGNfc3RhdGUtPmFj
dGl2ZV9wbGFuZXMgPT0gMCkgJiYNCj4gKwkJYWNydGNfc3RhdGUtPnN0cmVhbSkgew0KPiAgIAkJ
aWYgKG5ld19wY3J0Y19zdGF0ZS0+bW9kZV9jaGFuZ2VkKSB7DQo+ICAgCQkJYnVuZGxlLT5zdHJl
YW1fdXBkYXRlLnNyYyA9IGFjcnRjX3N0YXRlLT5zdHJlYW0tPnNyYzsNCj4gICAJCQlidW5kbGUt
PnN0cmVhbV91cGRhdGUuZHN0ID0gYWNydGNfc3RhdGUtPnN0cmVhbS0+ZHN0Ow0KPiANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
