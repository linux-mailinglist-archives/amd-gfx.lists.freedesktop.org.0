Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731ACE0739
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 17:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47E96E848;
	Tue, 22 Oct 2019 15:23:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690041.outbound.protection.outlook.com [40.107.69.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91BA6E848
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 15:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtCYEqqe1fDWsPB6PWTN6OWxC1DArcM+EkENz/F8Zr4FhZYdwgmZ/dqkGmGYAWePHkEf5NbshogLoyEYQiDiEmw193I5EWfHhlGVu1g/EYhkwwagWYMF6g5XBBZ733/csRgDGGN5/gO+DImK1f5a/kh06ucb8g3sldNVROwfrxXEtc9J+/AabvaSsxvb0Hy37TQYxR+0n9pxuUH6AO70qlO1trwQZ37vPSNBMyVUqAHJh4djd/YXQM339264McfiyIRHujQeBa1NFXopMvHFN+MWQvsJl//EZSaSD+KV19EaPyOGaH6VkFPgg3N1KuG0LTBq+tEoFCeMzTiO0SJnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+2dcAl3pDDwOXcYP7uyQLVsj3OoyaOsCQ2bQ+sYCKQ=;
 b=KHnCPNREu9pkfH/vOfMo40x+43+IDB8cwuxeaZ9c4BySEhM0OiPpAfx8GFvvY+QPsx8rON58eiSN9lqvFzELJ9AKai14BQ3/CBJ/GmxxcKntlY+U1ezNijnOEkEDuPmh6zgk9OI9F308jW2HcTvglMvUkm1q1Gd4cFwXVeWuoFIePwmbmkl02RyHZb+GSKgyDhM0KzkkapV0ZYUjhtrWpKUy7qHT/iIQilu08SeBDfLBnHR2/Dungh/+Ucx+BsgZ5ZDzAmm/DhkGJFRgLo8gPVVK9VVSAFFcYvYweVIEIN4CltC5kST35ge5emZLTUAYMg8ZaTehM5ZP00iDEfgiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1302.namprd12.prod.outlook.com (10.168.164.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 15:23:42 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.029; Tue, 22 Oct
 2019 15:23:42 +0000
From: James Zhu <jamesz@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Leo"
 <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Topic: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
Thread-Index: AQHViOfa3EMIa6k/q0ePItLmq/KJz6dmvhmg///fI4CAACpQgA==
Date: Tue, 22 Oct 2019 15:23:41 +0000
Message-ID: <1c9a54be-f3db-7087-41af-3f834d7862e0@amd.com>
References: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
 <DM5PR12MB2456F9E06D30C7AE9202E955E5680@DM5PR12MB2456.namprd12.prod.outlook.com>
 <411b35f0-9333-eac8-4cd3-25031869c082@gmail.com>
In-Reply-To: <411b35f0-9333-eac8-4cd3-25031869c082@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::39) To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bb7a0b8e-4ca2-41b0-08c2-08d75703d207
x-ms-traffictypediagnostic: CY4PR12MB1302:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1302B4F008E226D804F13379E4680@CY4PR12MB1302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(189003)(199004)(13464003)(446003)(66476007)(31686004)(66066001)(476003)(8676002)(486006)(36756003)(81156014)(8936002)(81166006)(31696002)(6246003)(25786009)(229853002)(64756008)(66446008)(66946007)(6436002)(11346002)(2616005)(6486002)(6512007)(2501003)(66556008)(6116002)(71190400001)(186003)(6506007)(71200400001)(110136005)(4001150100001)(316002)(99286004)(305945005)(478600001)(76176011)(26005)(52116002)(5660300002)(2906002)(256004)(14454004)(3846002)(386003)(7736002)(102836004)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1302;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: okYQLMMbNAXO/NYh3DWLjsgqiWXH69/PZDwiWD5ANx/RuC/1qgwoKaqcRxBqGb1MWSZTGE8zylkn3xjRiSbGIy2qgPkcf+wAR5diNzeIhRhZkJLP13EU7kngxYD9bMoR4g5iWOXBYu5Bd6K8qw4CS6H3MEBfenQP+eEWMlRI92ZqaSnX4I187k9WCHwNyVp0crtIo3rycfyQh91aZ3f+dZubiC772KKN1nGx4I11Cl0yyv3Q2orOcago9ix3bvcJ9/0Huf/cBJBkoFQoPeb7fGNEUPDOfvQXFMuqGj6dYN1sAnAPkRXpd6rydsPtIuaDaXP/RP0O7dGg08KBriq3+sEoa4I7qGetnGYPW++s+A4rGCQaoq65lLP7erbiY/qj/GvEwvECYtm4YM625ci47T58faTAZBjBjs4N1gwIEqt0tUQPAdYBHV+x7gCeQyVU
Content-ID: <604312ED9CD4E94B912E979D66E61818@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7a0b8e-4ca2-41b0-08c2-08d75703d207
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 15:23:41.8448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRVNHwsJmjnQYibJewNuVEOe3RyiqRtf7Hyo9JefWRTRTNTKzy0GDdApIQ6kEhF7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+2dcAl3pDDwOXcYP7uyQLVsj3OoyaOsCQ2bQ+sYCKQ=;
 b=WT2zmTdsKabDwik+YQiKVk2/Of9DsanY7hIu+64EPPoVfsM7oLKkiylO5g0EIfmSCxUgNO5v7MZ/ABxvwNAAN22U6uUICiL2k8MUOcJSAtkQWHmfJZrIdowajpBFIjJ5o+WAzqMNs44ytV+tp3fZ1T/24ElgiWYK6nOISREnxLc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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

SGkgQ2hyaXN0aWFuLA0KDQpJIGNoZWNrZWQgdGhhdCBBcmN0dXJ1cyBmaXJtd2FyZSBoYXZlbid0
IGJlZW4gcHVibGlzaGVkIHlldC4NCg0KQmVzdCBSZWdhcmRzIQ0KDQpKYW1lcyBaaHUNCg0KT24g
MjAxOS0xMC0yMiA4OjUyIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEhhdmUgd2Ug
ZXZlciBwdWJsaXNoZWQgYW4gb2xkZXIgdmVyc2lvbiBvZiB0aGUgZmlybXdhcmU/DQo+DQo+IEkg
c3Ryb25nbHkgYXNzdW1lIHRoZSBhbnN3ZXIgaXMgIm5vIiBhbmQgaWYgdGhhdCdzIHRoZSBjYXNl
IGZlZWwgZnJlZSANCj4gdG8gYWRkIGFuIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Lg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+
DQo+IEFtIDIyLjEwLjE5IHVtIDE2OjUwIHNjaHJpZWIgTGl1LCBMZW86DQo+PiBSZXZpZXdlZC1i
eTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPg0KPj4NCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPiBPbiBCZWhhbGYgT2YgDQo+PiBaaHUsIEphbWVzDQo+PiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDIyLCAyMDE5IDEwOjQ5IEFNDQo+PiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4+IENjOiBaaHUsIEphbWVzIDxKYW1lcy5aaHVAYW1kLmNvbT4NCj4+IFN1YmplY3Q6
IFtQQVRDSF0gZHJtL2FtZGdwdS92Y246IEVuYWJsZSBWQ04yLjUgZW5jb2RpbmcNCj4+DQo+PiBB
ZnRlciBWQ04yLjUgZmlybXdhcmUgKFZlcnNpb24gRU5DOiAxLjHCoCBSZXZpc2lvbjogMTEpLA0K
Pj4gVkNOMi41IGVuY29kaW5nIGNhbiB3b3JrIHByb3Blcmx5Lg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgfCAzIC0tLQ0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml81LmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml81LmMNCj4+IGluZGV4IGQyNzBkZjguLmZmNmNjNzcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jDQo+PiBAQCAtMjY1LDkgKzI2NSw2IEBAIHN0YXRpYyBp
bnQgdmNuX3YyXzVfaHdfaW5pdCh2b2lkICpoYW5kbGUpDQo+PiDCoCDCoMKgwqDCoMKgwqDCoMKg
wqAgZm9yIChpID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2kpIHsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJpbmcgPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19l
bmNbaV07DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBkaXNhYmxlIGVuY29kZSByaW5n
cyB0aWxsIHRoZSByb2J1c3RuZXNzIG9mIHRoZSBGVyAqLw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGFtZGdwdV9y
aW5nX3Rlc3RfaGVscGVyKHJpbmcpOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHIpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZG9uZTsNCj4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
