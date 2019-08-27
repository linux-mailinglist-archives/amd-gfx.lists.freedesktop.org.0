Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB7D9E372
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 10:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556668970E;
	Tue, 27 Aug 2019 08:59:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164988970E
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 08:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJdBZq1K1vJiwW906ujVloBbXMGeB0NWFVUBZBYmwvbjSHBkROY4PnFzI5MDpSjzjJd9kfjHyfxK1jD9/JGWmBeG1N9eeI79/avq5MHxvF1jwlvceS96+j+1CeoXqaB3p/IJie/xHRqrw1UHhBjQ4Y64mrNpFP5Q3eTrcgwFtGCn4T7HGBXVxkJoeJmutdQByVQ5YgrXHVYdmhEtYJHC02dQPT9wYg44SFXprHcn3tu+EbL5nij+Kiw7WQxRgU24Jo6oDorV1aUxO1DOJDg30YqS74s1W5hWGf4uEeECwB7EWbF2l1A4zU1XSGGdJbgyOtL+jvZMsi/F7W589Gpp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEqaw6VebYTqaKltvV7uA30D0mip1oFYLNFGzr5KRXg=;
 b=X/UFg9nK46ucZXhDWMWO/rDt4s1dj5FgaX8Krr7GCGvSAqekz9khcBFwcDA88MxV72fISrQH3qKhT05FCOOZ0UKkeCzv5fOLFMQuH47mTKGIAJv/uSr5aYAbzWoNlODqOT525sUdQ5Ad/tJOT81czHuIFY7eb1jkQK0MIXJMXWnQL7Bl8kZukFzEfW9L7vMCD8M3mD95ciTRILb5iC3co/W0Z26T5qzyfpy085lB64gtpNLblXeaio+HQOyjaUlvWlfhFkBsy50TkjsDt9DWGvtC7BiPSyYOiESoQbnbwBbexcuYgb6p6ZrcFNEPH1r/vgtgoIKN6on3cDyn4AMX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5SPR00MB111.namprd12.prod.outlook.com (10.174.247.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Tue, 27 Aug 2019 08:59:47 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 08:59:47 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Index: AQHVXGMAt/Kzb1cSiUGWAryuYKkGfqcOssCA
Date: Tue, 27 Aug 2019 08:59:47 +0000
Message-ID: <623cdcb3-6302-86e0-afc0-dfd36675313a@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
 <20190826230355.25007-4-Felix.Kuehling@amd.com>
In-Reply-To: <20190826230355.25007-4-Felix.Kuehling@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0123.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad4497a8-c1f7-4cc4-dec1-08d72acce94a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5SPR00MB111; 
x-ms-traffictypediagnostic: DM5SPR00MB111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5SPR00MB1115E76D50462FC1795D79B83A00@DM5SPR00MB111.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(71200400001)(71190400001)(6512007)(2501003)(58126008)(8936002)(52116002)(66446008)(66946007)(64756008)(66556008)(66476007)(110136005)(65956001)(65806001)(305945005)(316002)(53936002)(14454004)(8676002)(81156014)(81166006)(36756003)(46003)(478600001)(6246003)(446003)(256004)(76176011)(14444005)(25786009)(102836004)(486006)(66574012)(86362001)(31696002)(11346002)(7736002)(6436002)(5660300002)(4326008)(6486002)(386003)(6506007)(31686004)(6116002)(229853002)(2906002)(186003)(476003)(99286004)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR00MB111;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WxQCZ3u89i4j0NqhHktnZ6YX2CAqvDDlFNnL5uFj9nwM7w6aiN2yv0gojkTIPzeCPGDc77Kqjjs3+Vu6W/Py7IqA4BWmqCNtlwXiiopCdDxm7unS94smjvpg/gqagomQm7xWcHXU5riHbDiAAfxA73dAlXHEodV4Y7o2ZkyOm1iBAM07n/y18YSEGbCuiJz+KHmqQANqYgvSyKRrr8GB0j64W89yi+sVemQsoL7JhIvoSFFS6cQXT+wnoo5lUTUoEA7q/fDHpryM5YKILC+tQd7iBxeIdxiVnJQ7WZOu8PfaQIpAWk2JYvNnjGPJWkgRTSdNiKPWqtd7F5tB7Q27C649P4w4pl3Dn/9GCWIe+rV90Zxu3WydT2ywPNMJ7vDSTfBy/UJNTCz/sZFPmVH3/IiP19rGucp11+GcCUkDytQ=
Content-ID: <8F3F01F4AEFA0E4BA29670C2C4773B2E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4497a8-c1f7-4cc4-dec1-08d72acce94a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 08:59:47.4296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8YVXzqWcSBkLLYD+p7jen2WDmG4wLfon/BHEmVDWFfp1TlNecNL1sOZP97TgHPk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB111
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEqaw6VebYTqaKltvV7uA30D0mip1oFYLNFGzr5KRXg=;
 b=BSCCMf3wQuzq1hEOjW51UciIgu5KOJVX75l/YUZV5A6ul67sZ7WM470jIC1hdaUJ4x88BU335Q1+FQruJQWTUneRDKpYoZRbdbO+a8X/OX3j9rDILeUXBuuS22zLDJ5vCMJLJLZQw66Seood2ywAtWRD/0K1GeYbxzH3xOJJbj8=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDguMTkgdW0gMDE6MDcgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IEZvciBjb21w
dXRlIFZSQU0gYWxsb2NhdGlvbnMgb24gQXJ0dXJ1cyB1c2UgdGhlIG5ldyBSVyBtdHlwZQ0KPiBm
b3Igbm9uLWNvaGVyZW50IGxvY2FsIG1lbW9yeSwgQ0MgbXR5cGUgZm9yIGNvaGVyZW50IGxvY2Fs
DQo+IG1lbW9yeSBhbmQgUFRFX1NOT09QRUQgYml0IGZvciBpbnZhbGlkYXRpbmcgbm9uLWRpcnR5
IGNhY2hlDQo+IGxpbmVzIG9uIHJlbW90ZSBYR01JIG1hcHBpbmdzLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KSSB3b3VsZCBn
aXZlIGFuIHJiIG9uIHRoZSBwYXJ0IGluIGFtZGdwdV92bV9ib19zcGxpdF9tYXBwaW5nKCksIGJ1
dCANCmNhbid0IGZ1bGx5IGp1ZGdlIHRoZSBLRkQgcGFydCBmb3IgY29ycmVjdG5lc3MuDQoNClNv
IG9ubHkgQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4NCg0KPiAtLS0NCj4gICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1
dm0uYyAgfCAyMCArKysrKysrKysrKysrKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmMgICAgICAgIHwgIDQgKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCAxYjczNDBhMThm
NjcuLmM1YzE4ZTI5MmFlMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBAQCAtMzU3LDYgKzM1Nyw3IEBAIHN0YXRpYyBp
bnQgdm1fdXBkYXRlX3BkcyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgc3RydWN0IGFtZGdwdV9zeW5j
ICpzeW5jKQ0KPiAgIA0KPiAgIHN0YXRpYyB1aW50MzJfdCBnZXRfcHRlX2ZsYWdzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qga2dkX21lbSAqbWVtKQ0KPiAgIHsNCj4gKwlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYm9fYWRldiA9IGFtZGdwdV90dG1fYWRldihtZW0tPmJvLT50Ym8u
YmRldik7DQo+ICAgCWJvb2wgY29oZXJlbnQgPSBtZW0tPmFsbG9jX2ZsYWdzICYgQUxMT0NfTUVN
X0ZMQUdTX0NPSEVSRU5UOw0KPiAgIAl1aW50MzJfdCBtYXBwaW5nX2ZsYWdzOw0KPiAgIA0KPiBA
QCAtMzY2LDggKzM2NywyMyBAQCBzdGF0aWMgdWludDMyX3QgZ2V0X3B0ZV9mbGFncyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGtnZF9tZW0gKm1lbSkNCj4gICAJaWYgKG1lbS0+
YWxsb2NfZmxhZ3MgJiBBTExPQ19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkNCj4gICAJCW1hcHBpbmdf
ZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfRVhFQ1VUQUJMRTsNCj4gICANCj4gLQltYXBwaW5nX2Zs
YWdzIHw9IGNvaGVyZW50ID8NCj4gLQkJQU1ER1BVX1ZNX01UWVBFX1VDIDogQU1ER1BVX1ZNX01U
WVBFX05DOw0KPiArCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7DQo+ICsJY2FzZSBDSElQX0FS
Q1RVUlVTOg0KPiArCQlpZiAobWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19WUkFN
KSB7DQo+ICsJCQlpZiAoYm9fYWRldiA9PSBhZGV2KQ0KPiArCQkJCW1hcHBpbmdfZmxhZ3MgfD0g
Y29oZXJlbnQgPw0KPiArCQkJCQlBTURHUFVfVk1fTVRZUEVfQ0MgOiBBTURHUFVfVk1fTVRZUEVf
Ulc7DQo+ICsJCQllbHNlDQo+ICsJCQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVf
VUM7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQltYXBwaW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8NCj4g
KwkJCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBBTURHUFVfVk1fTVRZUEVfTkM7DQo+ICsJCX0NCj4g
KwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJbWFwcGluZ19mbGFncyB8PSBjb2hlcmVudCA/
DQo+ICsJCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBBTURHUFVfVk1fTVRZUEVfTkM7DQo+ICsJfQ0K
PiAgIA0KPiAgIAlyZXR1cm4gYW1kZ3B1X2dtY19nZXRfcHRlX2ZsYWdzKGFkZXYsIG1hcHBpbmdf
ZmxhZ3MpOw0KPiAgIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4g
aW5kZXggN2RkY2EzZWViNmNmLi4xODlhZDU2OTk5NDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bS5jDQo+IEBAIC0xNTkyLDYgKzE1OTIsMTAgQEAgc3RhdGljIGlu
dCBhbWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
Cj4gICAJCX0NCj4gICAJCWZsYWdzICY9IH5BTURHUFVfUFRFX1ZBTElEOw0KPiAgIAl9DQo+ICsJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTICYmDQo+ICsJICAgICEoZmxhZ3Mg
JiBBTURHUFVfUFRFX1NZU1RFTSkgJiYNCj4gKwkgICAgbWFwcGluZy0+Ym9fdmEtPmlzX3hnbWkp
DQo+ICsJCWZsYWdzIHw9IEFNREdQVV9QVEVfU05PT1BFRDsNCj4gICANCj4gICAJdHJhY2VfYW1k
Z3B1X3ZtX2JvX3VwZGF0ZShtYXBwaW5nKTsNCj4gICANCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
