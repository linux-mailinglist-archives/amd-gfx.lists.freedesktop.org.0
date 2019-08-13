Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C28ACB7
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 04:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023D06E507;
	Tue, 13 Aug 2019 02:32:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448C66E507
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 02:32:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5XmUQikfSIFyQzPk3RRxlF9FrSFodjDg7Np35427m7NA4yAITPOUzw7CO8Q1m23Sez4t+sQL7yi/E0gMxX10lpq286zsrtoh+BPgSNFB/K7dcRMnN4q13ISYdUGS6HPNuDIDA06fCaJTU/CXQfQsSQU81EbDGR5knyZJHcGRIYuBDUgwa0bnva85bpfVSBo+Xqa0U+xrgfYEQMr1EUAWCrJVSFXZlQpDGV1x7KaRkiZSEbjXBXkUDjUVmPA9MQqI7ZDgcvOHm119aiUMWpUcgRQAxLVv0U9b7G21u7zD8fHoLKtJam2GKgKG0JJEF2NaZ3WfsNlNu8w/MbhZcoCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNGbcJyvNrlwUWzfE77IfO4Y/VB7dmnXzMKaJu0Pt0M=;
 b=gchT2WqjXJHlVuOk0H6qQVLwgzT7HaTAEtMuTQqJFvi0gU1G4DIk7UTwm5Ge0CFDIVIjT1rD3l1YvVLbLb4LiMUcOro5xW7yhHivMTtYc2P68CPf6p0JPl1oB5Y/0arKQ7j1tmdKBucuI1mQyFd625zhb/iSTXp4c6rdxkOcW6yRJaSkrDtnd1rlza8t9r464wY8VowIn8+5F6n2HkXyWKDIQMYKND1c5VLYBY/CcROEPsAWn+ZWyucX925w2GtlfqeOhzAZcd/Hhm62YcbSBpSmUXgY3jKhcGDZgtvLn6kQ9WNPWbQ4GoJ0WJSCZ9r5G7+SH/Gt1SGEiQ+i8LkPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB2909.namprd12.prod.outlook.com (20.179.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Tue, 13 Aug 2019 02:32:36 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::60ad:404b:ae0c:7bb9]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::60ad:404b:ae0c:7bb9%7]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 02:32:36 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] SWDEV-197284 - drm/amdgpu: Only use the peek function in
 productor side is not correct
Thread-Topic: [PATCH] SWDEV-197284 - drm/amdgpu: Only use the peek function in
 productor side is not correct
Thread-Index: AQHVUOHW0MbZfUxBLk6/NJAFYTJ6iqb3vR+AgACfwIA=
Date: Tue, 13 Aug 2019 02:32:36 +0000
Message-ID: <MN2PR12MB29756562F2194B2EAA2146438FD20@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1565595762-8141-1-git-send-email-Emily.Deng@amd.com>
 <d05d8b60-ab08-67ec-b57b-6de6b2e40d3e@gmail.com>
In-Reply-To: <d05d8b60-ab08-67ec-b57b-6de6b2e40d3e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec85d25a-aade-40f0-3f40-08d71f9680c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2909; 
x-ms-traffictypediagnostic: MN2PR12MB2909:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29093FE85127B3E78ED793AC8FD20@MN2PR12MB2909.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(13464003)(52536014)(99286004)(86362001)(305945005)(7736002)(14454004)(74316002)(53936002)(25786009)(316002)(66574012)(55016002)(6246003)(6436002)(110136005)(81156014)(8676002)(9686003)(229853002)(2501003)(5660300002)(7696005)(6116002)(3846002)(76176011)(446003)(26005)(186003)(33656002)(81166006)(66066001)(11346002)(14444005)(6506007)(66946007)(256004)(66476007)(66446008)(64756008)(71190400001)(486006)(2906002)(66556008)(76116006)(71200400001)(476003)(8936002)(102836004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2909;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vsP6FvvsVsgo3ZncRrBFNyKD3tKDx1jk5Ng2B9ZXP8wBNkbGP3cjt4Z9MA6YW0yeLVEhEdioqqpER5NMkB+dbe0nVSLLOwDGAMcerVNnDxxNdJAIIqv0C1UaKVjHDRHK4vi3NAN9/wBkPo4FrAS5QhvUG1do0pxjdbV8r0w+6o4++EkGi4wo8wKTKe70g1zTye0vaPBQ3wWVJwTUZPNir3ixQOoQ6vVjqVrya6J0p7jRmf9U1c0ovlenLjeOCqltHvOYyyCCa8ebMQGvAX+TuiCa+lgJJ/L1SN5jcZpvFBERAogkcs1+5BypT0p3L3DRN2BI7c6nzjnYaKH3vbhoNHihAfJCrzfzKqcMbBKhSDynvGzok1NsL9/ATty2MYbmBEbyQRKytXAkQ43eTdffnN7f/5CKpMIReKgvIWrw95Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec85d25a-aade-40f0-3f40-08d71f9680c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 02:32:36.0304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22RsWSamlaoOZ4ZEWnB0IdWnmD4U/n3Pd1axUZh/FBt3gFkGORPwZv88sy7R619G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2909
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNGbcJyvNrlwUWzfE77IfO4Y/VB7dmnXzMKaJu0Pt0M=;
 b=sGU5jpg8u3TYXW6XmXsYeD19NC9z3lyOuCMjUedMNq07zQEqKvkxk2NQ5tk5cWmzwtzguj02y3jjG2i1wfhpzyEq8GjD4je7PBW9y6+i8BRGSN8xmfr9+qAWz6/koAxU5ptn8d2dIpXxqtSWMNtPieGG38E/r8oPCoMYnlWsGNc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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

T2ssIHBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4NCg0KDQpCZXN0IHdpc2hlcw0KRW1pbHkgRGVu
Zw0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBDaHJpc3RpYW4gS8O2bmln
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBBdWd1
c3QgMTMsIDIwMTkgMTowMCBBTQ0KPlRvOiBEZW5nLCBFbWlseSA8RW1pbHkuRGVuZ0BhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIXSBT
V0RFVi0xOTcyODQgLSBkcm0vYW1kZ3B1OiBPbmx5IHVzZSB0aGUgcGVlaw0KPmZ1bmN0aW9uIGlu
IHByb2R1Y3RvciBzaWRlIGlzIG5vdCBjb3JyZWN0DQo+DQo+QW0gMTIuMDguMTkgdW0gMDk6NDIg
c2NocmllYiBFbWlseSBEZW5nOg0KPj4gRm9yIHNwc2MgcXVldWUsIHVzZSBwZWVrIGZ1bmN0aW9u
IHdvdWxkIGNhdXNlIGVycm9yIGluIHByb2R1Y3RvciBzaWRlLg0KPj4gQXMgZm9yIHRoZSBsYXN0
IGVsZW1lbnQsIHdoZW4gdGhlIHB1c2ggam9iIGlzIG9jY3VycmluZyBkdXJpbmcgcG9wDQo+PiBq
b2IsIHRoZSBwZWVrIGZ1bmN0aW9uIHdpbGwgbm90IGJlIHVwZGF0ZWQgaW4gdGltZSwgYW5kIGl0
IHdpbGwgcmV0dXJuIE5VTEwuDQo+Pg0KPj4gU28gdXNlIHF1ZXVlIGNvdW50IGZvciBkb3VibGUg
Y29uZmlybWluZyB0aGUgam9iIHF1ZXVlIGlzIGVtcHR5Lg0KPg0KPkZvciB0aGUgdXBzdHJlYW0g
YnJhbmNoIEknbSBnb2luZyB0byBwdXNoIG15IHBhdGNoIHdoaWNoIGlzIG5vdCBhcyBpbnZhc2l2
ZQ0KPmFzIHRoaXMgb25lLg0KPg0KPkNocmlzdGlhbi4NCj4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBFbWlseSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDQgKystLQ0KPj4gICBpbmNsdWRlL2Ry
bS9zcHNjX3F1ZXVlLmggICAgICAgICAgICAgICAgIHwgNyArKystLS0tDQo+PiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jDQo+PiBiL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMNCj4+IGluZGV4IDM1ZGRiZWMuLmU3
NDg5NGYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2Vu
dGl0eS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5j
DQo+PiBAQCAtOTUsNyArOTUsNyBAQCBzdGF0aWMgYm9vbCBkcm1fc2NoZWRfZW50aXR5X2lzX2lk
bGUoc3RydWN0DQo+ZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KQ0KPj4gICAJcm1iKCk7IC8qIGZv
ciBsaXN0X2VtcHR5IHRvIHdvcmsgd2l0aG91dCBsb2NrICovDQo+Pg0KPj4gICAJaWYgKGxpc3Rf
ZW1wdHkoJmVudGl0eS0+bGlzdCkgfHwNCj4+IC0JICAgIHNwc2NfcXVldWVfcGVlaygmZW50aXR5
LT5qb2JfcXVldWUpID09IE5VTEwpDQo+PiArCSAgICAoKHNwc2NfcXVldWVfcGVlaygmZW50aXR5
LT5qb2JfcXVldWUpID09IE5VTEwpICYmDQo+PiArIXNwc2NfcXVldWVfY291bnQoJmVudGl0eS0+
am9iX3F1ZXVlKSkpDQo+PiAgIAkJcmV0dXJuIHRydWU7DQo+Pg0KPj4gICAJcmV0dXJuIGZhbHNl
Ow0KPj4gQEAgLTI4MSw3ICsyODEsNyBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfZmluaShzdHJ1
Y3QgZHJtX3NjaGVkX2VudGl0eQ0KPiplbnRpdHkpDQo+PiAgIAkvKiBDb25zdW1wdGlvbiBvZiBl
eGlzdGluZyBJQnMgd2Fzbid0IGNvbXBsZXRlZC4gRm9yY2VmdWxseQ0KPj4gICAJICogcmVtb3Zl
IHRoZW0gaGVyZS4NCj4+ICAgCSAqLw0KPj4gLQlpZiAoc3BzY19xdWV1ZV9wZWVrKCZlbnRpdHkt
PmpvYl9xdWV1ZSkpIHsNCj4+ICsJaWYgKChzcHNjX3F1ZXVlX3BlZWsoJmVudGl0eS0+am9iX3F1
ZXVlKSA9PSBOVUxMKSAmJg0KPj4gKyFzcHNjX3F1ZXVlX2NvdW50KCZlbnRpdHktPmpvYl9xdWV1
ZSkpIHsNCj4+ICAgCQlpZiAoc2NoZWQpIHsNCj4+ICAgCQkJLyogUGFyayB0aGUga2VybmVsIGZv
ciBhIG1vbWVudCB0byBtYWtlIHN1cmUgaXQgaXNuJ3QNCj5wcm9jZXNzaW5nDQo+PiAgIAkJCSAq
IG91ciBlbml0eS4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9zcHNjX3F1ZXVlLmggYi9p
bmNsdWRlL2RybS9zcHNjX3F1ZXVlLmggaW5kZXgNCj4+IDEyNWYwOTYuLjc4MDkyYjkgMTAwNjQ0
DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9zcHNjX3F1ZXVlLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJt
L3Nwc2NfcXVldWUuaA0KPj4gQEAgLTU0LDkgKzU0LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHNw
c2NfcXVldWVfaW5pdChzdHJ1Y3Qgc3BzY19xdWV1ZQ0KPj4gKnF1ZXVlKQ0KPj4NCj4+ICAgc3Rh
dGljIGlubGluZSBzdHJ1Y3Qgc3BzY19ub2RlICpzcHNjX3F1ZXVlX3BlZWsoc3RydWN0IHNwc2Nf
cXVldWUgKnF1ZXVlKQ0KPj4gICB7DQo+PiAtCXJldHVybiBxdWV1ZS0+aGVhZDsNCj4+ICsJcmV0
dXJuIFJFQURfT05DRShxdWV1ZS0+aGVhZCk7DQo+PiAgIH0NCj4+IC0NCj4+ICAgc3RhdGljIGlu
bGluZSBpbnQgc3BzY19xdWV1ZV9jb3VudChzdHJ1Y3Qgc3BzY19xdWV1ZSAqcXVldWUpDQo+PiAg
IHsNCj4+ICAgCXJldHVybiBhdG9taWNfcmVhZCgmcXVldWUtPmpvYl9jb3VudCk7IEBAIC03MCw5
ICs2OSw5IEBAIHN0YXRpYw0KPj4gaW5saW5lIGJvb2wgc3BzY19xdWV1ZV9wdXNoKHN0cnVjdCBz
cHNjX3F1ZXVlICpxdWV1ZSwgc3RydWN0IHNwc2Nfbm9kZQ0KPj4gKm4NCj4+DQo+PiAgIAlwcmVl
bXB0X2Rpc2FibGUoKTsNCj4+DQo+PiArCWF0b21pY19pbmMoJnF1ZXVlLT5qb2JfY291bnQpOw0K
Pj4gICAJdGFpbCA9IChzdHJ1Y3Qgc3BzY19ub2RlICoqKWF0b21pY19sb25nX3hjaGcoJnF1ZXVl
LT50YWlsLA0KPihsb25nKSZub2RlLT5uZXh0KTsNCj4+ICAgCVdSSVRFX09OQ0UoKnRhaWwsIG5v
ZGUpOw0KPj4gLQlhdG9taWNfaW5jKCZxdWV1ZS0+am9iX2NvdW50KTsNCj4+DQo+PiAgIAkvKg0K
Pj4gICAJICogSW4gY2FzZSBvZiBmaXJzdCBlbGVtZW50IHZlcmlmeSBuZXcgbm9kZSB3aWxsIGJl
IHZpc2libGUgdG8gdGhlDQo+PiBjb25zdW1lciBAQCAtOTMsNiArOTIsNyBAQCBzdGF0aWMgaW5s
aW5lIHN0cnVjdCBzcHNjX25vZGUNCj4qc3BzY19xdWV1ZV9wb3Aoc3RydWN0IHNwc2NfcXVldWUg
KnF1ZXVlKQ0KPj4gICAJLyogVmVyaWZ5IHJlYWRpbmcgZnJvbSBtZW1vcnkgYW5kIG5vdCB0aGUg
Y2FjaGUgKi8NCj4+ICAgCXNtcF9ybWIoKTsNCj4+DQo+PiArCWF0b21pY19kZWMoJnF1ZXVlLT5q
b2JfY291bnQpOw0KPj4gICAJbm9kZSA9IFJFQURfT05DRShxdWV1ZS0+aGVhZCk7DQo+Pg0KPj4g
ICAJaWYgKCFub2RlKQ0KPj4gQEAgLTExMyw3ICsxMTMsNiBAQCBzdGF0aWMgaW5saW5lIHN0cnVj
dCBzcHNjX25vZGUNCj4qc3BzY19xdWV1ZV9wb3Aoc3RydWN0IHNwc2NfcXVldWUgKnF1ZXVlKQ0K
Pj4gICAJCX0NCj4+ICAgCX0NCj4+DQo+PiAtCWF0b21pY19kZWMoJnF1ZXVlLT5qb2JfY291bnQp
Ow0KPj4gICAJcmV0dXJuIG5vZGU7DQo+PiAgIH0NCj4+DQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
