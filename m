Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37BE3AAB
	for <lists+amd-gfx@lfdr.de>; Thu, 24 Oct 2019 20:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E181F6E5CD;
	Thu, 24 Oct 2019 18:09:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232B76E5C6
 for <amd-gfx@lists.freedesktop.org>; Thu, 24 Oct 2019 18:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoLPCrmnXcKVMfVbE04X6CN46sTPr30Th3lPW0jKbq4PrGkQPxLxPRncgFkzziw/5WfBxQEPOzHYJjH/NoyqIniux4IvwQYsl6ECjSh3LAkaEj+Ishh3asK0JpY+WfOygeGgOCjGx+lZbKzuXGMOonG9gCa16oWg+750MM8SpQ1E6XoPNtXoLQ+DkIv1xnkE2iXQTixhhAjoM68K7/CIU0uN+QfV5/lwCI8UXmHiP2SYfdk9ZVLFVUaPOW7eqQpcd3NHVPYwzuSPy06Jd02VNbCHswRprLnblj7UqhRzptPFQxq7ZJ4cxeG1t71ya437AX1AtjvQ3YWf/GEDSGd5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrttFoJZyk9+iA6HuMfPepJE23BOCjc6bPMu6z/BbIY=;
 b=AL6FWqkpsTQp+1BeFWC1tLqriHUO+K3qqwO2dcvWF0jz2T26+nzEKdCbZpEcqlMtPqwYBGNfW0hCbb8jHXdEiD0oHusN27yFOwwYmHKCM5Mk06iZUNtz3/j51mZ+FjT9T6CGdEWBUicof+wZZa4lwa5OTpAUOm4Rp0QvxDsr990nVLelZ/4KG1tM3aOT0I7U4OhYDOCpKJN3/9mH+hDx4zX6JPXVUSdreztzP/0ZiV9OwMXWtJeFdj4oEQe7zWZdy2o1PHu7Bx886VRv6IjobrUB+zv6bVRbPRTfOWvmE5DHaIv6KrciSRIOBG9HOdPv51lzZ1PW23al0htA2Fk9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3355.namprd12.prod.outlook.com (20.178.198.10) by
 DM6PR12MB2908.namprd12.prod.outlook.com (20.179.71.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Thu, 24 Oct 2019 18:09:55 +0000
Received: from DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::6006:422c:ecdf:e550]) by DM6PR12MB3355.namprd12.prod.outlook.com
 ([fe80::6006:422c:ecdf:e550%6]) with mapi id 15.20.2367.027; Thu, 24 Oct 2019
 18:09:55 +0000
From: "Tuikov, Luben" <Luben.Tuikov@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] Ring range argument improvements (v2)
Thread-Topic: [PATCH] Ring range argument improvements (v2)
Thread-Index: AQHVieZvemwsQR9ADEq08vsG6uJzd6dpzpSAgABKFoA=
Date: Thu, 24 Oct 2019 18:09:54 +0000
Message-ID: <5131bb2f-8603-a7e8-47ed-01e46fe7ad23@amd.com>
References: <20191023210441.19992-1-luben.tuikov@amd.com>
 <20191023211113.20593-1-luben.tuikov@amd.com>
 <61b98913-8e29-582c-504f-d226d4e8d09b@amd.com>
In-Reply-To: <61b98913-8e29-582c-504f-d226d4e8d09b@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::21) To DM6PR12MB3355.namprd12.prod.outlook.com
 (2603:10b6:5:38::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ee82ea3-3088-4db5-656c-08d758ad5f35
x-ms-traffictypediagnostic: DM6PR12MB2908:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB29089F458D07D24066403676996A0@DM6PR12MB2908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(2616005)(14454004)(6436002)(6512007)(6246003)(305945005)(316002)(110136005)(99286004)(81156014)(8676002)(52116002)(7736002)(76176011)(81166006)(66066001)(478600001)(36756003)(6486002)(8936002)(4001150100001)(66556008)(31696002)(66946007)(86362001)(229853002)(66446008)(64756008)(14444005)(25786009)(31686004)(486006)(256004)(476003)(3846002)(6116002)(446003)(11346002)(5660300002)(71200400001)(71190400001)(2501003)(102836004)(186003)(2906002)(66476007)(53546011)(6506007)(26005)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2908;
 H:DM6PR12MB3355.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XFpVADSOYU0wOUEVUOc8GFrA/AIWT0D0y/HKqMdXcVhqLTQGvVrAL0x7c7jn1+WG+I3+hGUYAmK/GgT2XVp3NVmLyrVrzAH9oqMq26cDJCUwHKFWx/CwmfFZaj+RZKpjr8OVbLImzIZ/XNPFlZDWBEpi6/08RXZ7vC8/S2sJBpK5x84w71m0aXGCXoqSMOfsPzxPdtaqdSmwrUazXC1yhN0sYgeSazBLX4yFnr8lWkK6E28bES1HBijBlT6cFql7yTvXgRBwbtQrkcwSBUAUg62+s5Z+Z+Q+3+3sI8Oaw95ub388rvGB5/o6YxQSyjJnaXZB78cGpAzkXt21zjmaoTrmfhfc6UUQNlervs5X3j6tmDmCQb1JCNmIesIIZj2TyfD0fN7R0YcqWjQmKgsF8EigGQ+6+uXU4jZAM1OLOPQ5uxyPryha4qqaoPJRAnuM
Content-ID: <A319F11BAEC38E459A52607AA59814CE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee82ea3-3088-4db5-656c-08d758ad5f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 18:09:54.8714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjMU3rqqW1yM+4+IDPWWHUUtz0aCzDNi3AZhlE+43Wy51HUXU92knYzomC4LTujH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrttFoJZyk9+iA6HuMfPepJE23BOCjc6bPMu6z/BbIY=;
 b=r8Ig64lHkBDpVQxLXFF7xLBfpGOI1CEDauLHPYu6x1Y6OkcQPaF3c5eWROIwWF2WKgMeXkzFsFSEYYDXEY6qm8lsmQNTKkSttHc8OcV0ZaoEmMhgF1iDh7lkOKEl26+gvjpRvwUo0DyJ6tyj3y6/D/oSJk2LUCQFk+fp4bgoJMQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luben.Tuikov@amd.com; 
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

SGkgVG9tLA0KDQpUaGFua3MgZm9yIGRlYnVnZ2luZyBpdCENCg0KSSdsbCByZWFwcGx5IGFuZCBy
ZXNlbmQgaXQuDQoNClJlZ2FyZHMsDQpMdWJlbg0KDQpPbiAyMDE5LTEwLTI0IDk6NDQgYS5tLiwg
U3REZW5pcywgVG9tIHdyb3RlOg0KPiBUaGlzIGRpZmYgZml4ZXMgeW91ciBwYXRjaCwgY2FuIHlv
dSByZXNlbmQgcGxlYXNlPw0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS9zcmMvYXBwL3JpbmdfcmVh
ZC5jIGIvc3JjL2FwcC9yaW5nX3JlYWQuYw0KPiBpbmRleCA5Y2JlY2IwLi5jMWM5MTg3IDEwMDY0
NA0KPiAtLS0gYS9zcmMvYXBwL3JpbmdfcmVhZC5jDQo+ICsrKyBiL3NyYy9hcHAvcmluZ19yZWFk
LmMNCj4gQEAgLTEyMCwxNiArMTIwLDE2IEBAIHZvaWQgdW1yX3JlYWRfcmluZyhzdHJ1Y3QgdW1y
X2FzaWMgKmFzaWMsIGNoYXIgDQo+ICpyaW5ncGF0aCkNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhc2ljLT5hc2ljbmFtZSwgcmluZ25hbWUsICh1bnNpZ25lZCBsb25nKXdwdHIg
Pj4gMiwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc2ljLT5hc2ljbmFtZSwg
cmluZ25hbWUsICh1bnNpZ25lZCBsb25nKWRydl93cHRyID4+IDIpOw0KPiANCj4gK8KgwqDCoMKg
wqDCoCBpZiAoZW5hYmxlX2RlY29kZXIpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGVjb2Rlci5wbTQuY3VyX29wY29kZSA9IDB4RkZGRkZGRkY7DQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRlY29kZXIuc2RtYS5jdXJfb3Bjb2RlID0gMHhGRkZGRkZGRjsNCj4g
K8KgwqDCoMKgwqDCoCB9DQo+ICDCoMKgwqDCoMKgwqDCoCBkbyB7DQo+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdmFsdWUgPSByaW5nX2RhdGFbKHN0YXJ0KzEyKT4+Ml07DQo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCIlcy4lcy5yaW5nWyVzJTRsdSVz
XSA9PSAlczB4JTA4bHglc8KgwqAgIiwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXNpYy0+YXNpY25hbWUsIHJpbmduYW1lLA0KPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCTFVFLCAodW5zaWduZWQgbG9u
ZylzdGFydCA+PiAyLCBSU1QsDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFlFTExPVywgKHVuc2lnbmVkIGxvbmcpdmFsdWUsIFJTVCk7DQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlbmFibGVfZGVjb2Rlcikgew0KPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVjb2Rlci5wbTQuY3VyX29w
Y29kZSA9IDB4RkZGRkZGRkY7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZWNvZGVyLnNkbWEuY3VyX29wY29kZSA9IDB4RkZGRkZGRkY7DQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwcmludGYoIiAlYyVjJWMgIiwNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKHN0YXJ0ID09IHJwdHIpID8gJ3InIDogJy4nLA0KPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc3RhcnQgPT0gd3B0cikg
PyAndycgOiAnLicsDQo+IA0KPiBPbiAyMDE5LTEwLTIzIDU6MTEgcC5tLiwgVHVpa292LCBMdWJl
biB3cm90ZToNCj4+IFRoZSB2YWxpZCBjb250ZW50cyBvZiByaW5ncyBpcyBpbnZhcmlhYmx5IHRo
ZQ0KPj4gcmFuZ2UgW3JwdHIsIHdwdHIpLiBBdWdtZW50IHRoZSByaW5nIHJhbmdlIHRvDQo+PiBp
bnRlcnByZXQgdGhlICcuJyAoImhlcmUiKSBub3RhdGlvbiB0byBtZWFuIHJwdHINCj4+IG9yIHdw
dHIgd2hlbiBnaXZlbiBvbiB0aGUgbGVmdCBvciByaWdodCBvZiB0aGUNCj4+IHJhbmdlIGxpbWl0
cy4gVGhpcyBhdWdtZW50cyB0aGUgcmFuZ2Ugbm90YXRpb24gYXMNCj4+IGZvbGxvd3M6DQo+Pg0K
Pj4gMSkgTm8gcmFuZ2UgZ2l2ZW4sIHByaW50IHRoZSB3aG9sZSByaW5nLg0KPj4NCj4+IDIpIFsu
XSBvciBbLjouXSwgcHJpbnQgW3JwdHIsIHdwdHJdLA0KPj4NCj4+IDMpIFsuOmtdLCBrID49IDAs
IHByaW50IFtycHRyLCBycHRyICsga10sIHRoaXMgaXMNCj4+IGEgcmFuZ2UgcmVsYXRpdmUgdG8g
dGhlIGxlZnQgbGltaXQsIHJwdHIsIHRoZQ0KPj4gY29uc3VtZXIgcG9pbnRlci4NCj4+DQo+PiA0
KSBbazouXSBvciBba10sIGsgPj0gMCwgcHJpbnQgW3dwdHIgLSBrLCB3cHRyXSwgdGhpcyBpcw0K
Pj4gYSByYW5nZSByZWxhdGl2ZSB0byB0aGUgcmlnaHQgbGltaXQsIHdwdHIsIHRoZQ0KPj4gcHJv
ZHVjZXIgcG9pbnRlci4NCj4+DQo+PiA1KSBbazpyXSwgYm90aCBncmVhdGVyIHRoYW4gMCwgcHJp
bnQgW2sscl0gb2YgdGhlDQo+PiBuYW1lZCByaW5nLiBUaGlzIGlzIGFuIGFic29sdXRlIHJhbmdl
IGxpbWl0DQo+PiBub3RhdGlvbi4NCj4+DQo+PiBJbiBhbnkgY2FzZSwgdGhlIHJpbmcgY29udGVu
dHMgaXMgaW50ZXJwcmV0ZWQsIGlmDQo+PiB0aGUgcmluZyBjb250ZW50cyBjYW4gYmUgaW50ZXJw
cmV0ZWQuDQo+Pg0KPj4gdjI6IEZpeCBzcGVsbGluZyBtaXN0YWtlIGluIHRoZSBjb21taXQgbWVz
c2FnZToNCj4+ICJ0aGVuIiAtLT4gInRoYW4iLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEx1YmVu
IFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZG9jL3Vtci4xICAg
ICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4+ICAgc3JjL2FwcC9y
aW5nX3JlYWQuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2MvdW1yLjEgYi9kb2MvdW1yLjENCj4+IGluZGV4
IDFlNTg1ZmEuLjEzN2ZmMWUgMTAwNjQ0DQo+PiAtLS0gYS9kb2MvdW1yLjENCj4+ICsrKyBiL2Rv
Yy91bXIuMQ0KPj4gQEAgLTIxNiwxNyArMjE2LDMwIEBAIERpc2Fzc2VtYmxlICdzaXplJyBieXRl
cyAoaW4gaGV4KSBmcm9tIGEgZ2l2ZW4gYWRkcmVzcyAoaW4gaGV4KS4gIFRoZSBzaXplIGNhbiBi
DQo+PiAgIHNwZWNpZmllZCBhcyB6ZXJvIHRvIGhhdmUgdW1yIHRyeSBhbmQgY29tcHV0ZSB0aGUg
c2hhZGVyIHNpemUuDQo+PiAgIA0KPj4gICAuU0ggUmluZyBhbmQgUE00IERlY29kaW5nDQo+PiAt
LklQICItLXJpbmcsIC1SIDxzdHJpbmc+KGZyb206dG8pIg0KPj4gLVJlYWQgdGhlIGNvbnRlbnRz
IG9mIGEgcmluZyBuYW1lZCBieSB0aGUgc3RyaW5nIHdpdGhvdXQgdGhlDQo+PiAtLkIgYW1kZ3B1
X3JpbmdfDQo+PiAtcHJlZml4LiAgQnkgZGVmYXVsdCBpdCB3aWxsIHJlYWQgYW5kIGRpc3BsYXkg
dGhlIGVudGlyZSByaW5nLiAgQQ0KPj4gLXN0YXJ0aW5nIGFuZCBlbmRpbmcgYWRkcmVzcyBjYW4g
YmUgc3BlY2lmaWVkIGluIGRlY2ltYWwgb3IgYSAnLicgY2FuDQo+PiAtYmUgdXNlZCB0byBpbmRp
Y2F0ZSByZWxhdGl2ZSB0byB0aGUgY3VycmVudA0KPj4gKy5JUCAiLS1yaW5nLCAtUiA8c3RyaW5n
PltyYW5nZV0iDQo+PiArUmVhZCB0aGUgY29udGVudHMgb2YgdGhlIHJpbmcgbmFtZWQgYnkgdGhl
IHN0cmluZw0KPj4gKy5CIGFtZGdwdV9yaW5nXzxzdHJpbmc+LA0KPj4gK2kuZS4gd2l0aG91dCB0
aGUNCj4+ICsuQiBhbWRncHVfcmluZw0KPj4gK3ByZWZpeC4gQnkgZGVmYXVsdCBpdCByZWFkcyBh
bmQgcHJpbnRzIHRoZSBlbnRpcmUgcmluZy4gIEENCj4+ICtyYW5nZSBpcyBvcHRpb25hbCBhbmQg
aGFzIHRoZSBmb3JtYXQgJ1tzdGFydDplbmRdJy4gVGhlDQo+PiArc3RhcnRpbmcgYW5kIGVuZGlu
ZyBhZGRyZXNzIGFyZSBub24tbmVnYXRpdmUgaW50ZWdlcnMgb3INCj4+ICt0aGUgJy4nIChkb3Qp
IHN5bWJvbCwgd2hpY2ggaW5kaWNhdGVzIHRoZQ0KPj4gKy5CIHJwdHINCj4+ICt3aGVuIG9uIHRo
ZSBsZWZ0IHNpZGUgYW5kDQo+PiAgIC5CIHdwdHINCj4+IC1wb2ludGVyLiAgRm9yIGV4YW1wbGUs
ICItUiBnZngiIHdvdWxkIHJlYWQgdGhlIGVudGlyZSBnZnggcmluZywNCj4+IC0iLVIgZ2Z4WzA6
MTZdIiB3b3VsZCBkaXNwbGF5IHRoZSBjb250ZW50cyBmcm9tIDAgdG8gMTYgaW5jbHVzaXZlbHks
IGFuZA0KPj4gLSItUiBnZnhbLl0iIG9yICItUiBnZnhbLjouXSIgd291bGQgZGlzcGxheSB0aGUg
bGFzdCAzMiB3b3JkcyByZWxhdGl2ZQ0KPj4gLXRvIHJwdHIuDQo+PiArd2hlbiBvbiB0aGUgcmln
aHQgc2lkZSBvZiB0aGUgcmFuZ2UuDQo+PiArRm9yIGluc3RhbmNlLA0KPj4gKyItUiBnZngiIHBy
aW50cyB0aGUgZW50aXJlIGdmeCByaW5nLCAiLVIgZ2Z4WzA6MTZdIiBwcmludHMNCj4+ICt0aGUg
Y29udGVudHMgZnJvbSAwIHRvIDE2IGluY2x1c2l2ZWx5LCBhbmQgIi1SIGdmeFsuXSIgb3INCj4+
ICsiLVIgZ2Z4Wy46Ll0iIHByaW50cyB0aGUgcmFuZ2UgW3JwdHIsd3B0cl0uIFdoZW4gb25lIG9m
DQo+PiArdGhlIHJhbmdlIGxpbWl0cyBpcyBhIG51bWJlciB3aGlsZSB0aGUgb3RoZXIgaXMgdGhl
IGRvdCwgJy4nLA0KPj4gK3RoZW4gdGhlIG51bWJlciBpbmRpY2F0ZXMgdGhlIHJlbGF0aXZlIHJh
bmdlIGJlZm9yZSBvciBhZnRlciB0aGUNCj4+ICtjb3JyZXNwb25kaW5nIHJpbmcgcG9pbnRlci4g
Rm9yIGluc3RhbmNlLCAiLVIgc2RtYTBbMTY6Ll0iDQo+PiArcHJpbnRzIFt3cHRyLTE2LCB3cHRy
XSB3b3JkcyBvZiB0aGUgU0RNQTAgcmluZywgYW5kDQo+PiArIi1SIHNkbWExWy46MzJdIiBwcmlu
dHMgW3JwdHIsIHJwdHIrMzJdIGRvdWJsZS13b3JkcyBvZiB0aGUNCj4+ICtTRE1BMSByaW5nLiBU
aGUgY29udGVudHMgb2YgdGhlIHJpbmcgaXMgYWx3YXlzIGludGVycHJldGVkLA0KPj4gK2lmIGl0
IGNhbiBiZSBpbnRlcnByZXRlZC4NCj4+ICAgLklQICItLWR1bXAtaWIsIC1kaSBbdm1pZEBdYWRk
cmVzcyBsZW5ndGggW3BtXSINCj4+ICAgRHVtcCBhbiBJQiBwYWNrZXQgYXQgYW4gYWRkcmVzcyB3
aXRoIGFuIG9wdGlvbmFsIFZNSUQuICBUaGUgbGVuZ3RoIGlzIHNwZWNpZmllZA0KPj4gICBpbiBi
eXRlcy4gIFRoZSB0eXBlIG9mIGRlY29kZXIgPHBtPiBpcyBvcHRpb25hbCBhbmQgZGVmYXVsdHMg
dG8gUE00IHBhY2tldHMuDQo+PiBkaWZmIC0tZ2l0IGEvc3JjL2FwcC9yaW5nX3JlYWQuYyBiL3Ny
Yy9hcHAvcmluZ19yZWFkLmMNCj4+IGluZGV4IGVmMGM3MTEuLjljYmVjYjAgMTAwNjQ0DQo+PiAt
LS0gYS9zcmMvYXBwL3JpbmdfcmVhZC5jDQo+PiArKysgYi9zcmMvYXBwL3JpbmdfcmVhZC5jDQo+
PiBAQCAtMjgsNyArMjgsNyBAQA0KPj4gICB2b2lkIHVtcl9yZWFkX3Jpbmcoc3RydWN0IHVtcl9h
c2ljICphc2ljLCBjaGFyICpyaW5ncGF0aCkNCj4+ICAgew0KPj4gICAJY2hhciByaW5nbmFtZVsz
Ml0sIGZyb21bMzJdLCB0b1szMl07DQo+PiAtCWludCB1c2VfZGVjb2RlciwgZW5hYmxlX2RlY29k
ZXIsIGdwcnM7DQo+PiArCWludCAgZW5hYmxlX2RlY29kZXIsIGdwcnM7DQo+PiAgIAl1aW50MzJf
dCB3cHRyLCBycHRyLCBkcnZfd3B0ciwgcmluZ3NpemUsIHN0YXJ0LCBlbmQsIHZhbHVlLA0KPj4g
ICAJCSAqcmluZ19kYXRhOw0KPj4gICAJc3RydWN0IHVtcl9yaW5nX2RlY29kZXIgZGVjb2Rlciwg
KnBkZWNvZGVyLCAqcHBkZWNvZGVyOw0KPj4gQEAgLTczLDMzICs3Myw0NiBAQCB2b2lkIHVtcl9y
ZWFkX3Jpbmcoc3RydWN0IHVtcl9hc2ljICphc2ljLCBjaGFyICpyaW5ncGF0aCkNCj4+ICAgCWRy
dl93cHRyID0gcmluZ19kYXRhWzJdPDwyOw0KPj4gICANCj4+ICAgCS8qIGRlZmF1bHQgdG8gcmVh
ZGluZyBlbnRpcmUgcmluZyAqLw0KPj4gLQl1c2VfZGVjb2RlciA9IDA7DQo+PiAgIAlpZiAoIWZy
b21bMF0pIHsNCj4+ICAgCQlzdGFydCA9IDA7DQo+PiAgIAkJZW5kICAgPSByaW5nc2l6ZS00Ow0K
Pj4gICAJfSBlbHNlIHsNCj4+IC0JCWlmIChmcm9tWzBdID09ICcuJyB8fCAhdG9bMF0gfHwgdG9b
MF0gPT0gJy4nKSB7DQo+PiAtCQkJLyogc3RhcnQgZnJvbSAzMiB3b3JkcyBwcmlvciB0byBycHRy
IHVwIHRvIHdwdHIgKi8NCj4+IC0JCQllbmQgPSB3cHRyOw0KPj4gLQkJCWlmIChycHRyIDwgKDMx
KjQpKSB7DQo+PiAtCQkJCXN0YXJ0ID0gcnB0ciAtIDMxKjQ7DQo+PiAtCQkJCXN0YXJ0ICs9IHJp
bmdzaXplOw0KPj4gKwkJaWYgKGZyb21bMF0gPT0gJy4nKSB7DQo+PiArCQkJaWYgKHRvWzBdID09
IDAgfHwgdG9bMF0gPT0gJy4nKSB7DQo+PiArCQkJCS8qIE5vdGF0aW9uOiBbLl0gb3IgWy46Ll0s
IG1lYW5pbmcNCj4+ICsJCQkJICogW3JwdHIsIHdwdHJdLg0KPj4gKwkJCQkgKi8NCj4+ICsJCQkJ
c3RhcnQgPSBycHRyOw0KPj4gKwkJCQllbmQgPSB3cHRyOw0KPj4gICAJCQl9IGVsc2Ugew0KPj4g
LQkJCQlzdGFydCA9IHJwdHIgLSAzMSo0Ow0KPj4gKwkJCQkvKiBOb3RhdGlvbjogWy46a10sIGsg
Pj0wLCBtZWFuaW5nDQo+PiArCQkJCSAqIFtycHRyLCBydHByK2tdIGRvdWJsZS13b3Jkcy4NCj4+
ICsJCQkJICovDQo+PiArCQkJCXN0YXJ0ID0gcnB0cjsNCj4+ICsJCQkJc3NjYW5mKHRvLCAiJSJT
Q051MzIsICZlbmQpOw0KPj4gKwkJCQllbmQgKj0gNDsNCj4+ICsJCQkJZW5kID0gKHN0YXJ0ICsg
ZW5kICsgcmluZ3NpemUpICUgcmluZ3NpemU7DQo+PiAgIAkJCX0NCj4+IC0NCj4+ICAgCQl9IGVs
c2Ugew0KPj4gICAJCQlzc2NhbmYoZnJvbSwgIiUiU0NOdTMyLCAmc3RhcnQpOw0KPj4gLQkJCXNz
Y2FuZih0bywgIiUiU0NOdTMyLCAmZW5kKTsNCj4+ICAgCQkJc3RhcnQgKj0gNDsNCj4+IC0JCQll
bmQgKj0gNDsNCj4+IC0JCQl1c2VfZGVjb2RlciA9IDE7DQo+PiAtCQkJZGVjb2Rlci5wbTQuY3Vy
X29wY29kZSA9IDB4RkZGRkZGRkY7DQo+PiAtCQkJZGVjb2Rlci5zZG1hLmN1cl9vcGNvZGUgPSAw
eEZGRkZGRkZGOw0KPj4gKw0KPj4gKwkJCWlmICh0b1swXSAhPSAwICYmIHRvWzBdICE9ICcuJykg
ew0KPj4gKwkJCQkvKiBbazpyXSA9PT4gYWJzb2x1dGUgW2ssIHJdLg0KPj4gKwkJCQkgKi8NCj4+
ICsJCQkJc3NjYW5mKHRvLCAiJSJTQ051MzIsICZlbmQpOw0KPj4gKwkJCQllbmQgKj0gNDsNCj4+
ICsJCQkJc3RhcnQgJT0gcmluZ3NpemU7DQo+PiArCQkJCWVuZCAlPSByaW5nc2l6ZTsNCj4+ICsJ
CQl9IGVsc2Ugew0KPj4gKwkJCQkvKiB0b1swXSBpcyAwIG9yICcuJywNCj4+ICsJCQkJICogW2td
IG9yIFtrOi5dID09PiBbd3B0ciAtIGssIHdwdHJdDQo+PiArCQkJCSAqLw0KPj4gKwkJCQlzdGFy
dCA9ICh3cHRyIC0gc3RhcnQgKyByaW5nc2l6ZSkgJSByaW5nc2l6ZTsNCj4+ICsJCQkJZW5kID0g
d3B0cjsNCj4+ICsJCQl9DQo+PiAgIAkJfQ0KPj4gICAJfQ0KPj4gLQllbmQgJT0gcmluZ3NpemU7
DQo+PiAtCXN0YXJ0ICU9IHJpbmdzaXplOw0KPj4gICANCj4+ICAgCS8qIGR1bXAgZGF0YSAqLw0K
Pj4gICAJcHJpbnRmKCJcbiVzLiVzLnJwdHIgPT0gJWx1XG4lcy4lcy53cHRyID09ICVsdVxuJXMu
JXMuZHJ2X3dwdHIgPT0gJWx1XG4iLA0KPj4gQEAgLTExMyw4ICsxMjYsNyBAQCB2b2lkIHVtcl9y
ZWFkX3Jpbmcoc3RydWN0IHVtcl9hc2ljICphc2ljLCBjaGFyICpyaW5ncGF0aCkNCj4+ICAgCQkJ
YXNpYy0+YXNpY25hbWUsIHJpbmduYW1lLA0KPj4gICAJCQlCTFVFLCAodW5zaWduZWQgbG9uZylz
dGFydCA+PiAyLCBSU1QsDQo+PiAgIAkJCVlFTExPVywgKHVuc2lnbmVkIGxvbmcpdmFsdWUsIFJT
VCk7DQo+PiAtCQlpZiAoZW5hYmxlX2RlY29kZXIgJiYgc3RhcnQgPT0gcnB0ciAmJiBzdGFydCAh
PSB3cHRyKSB7DQo+PiAtCQkJdXNlX2RlY29kZXIgPSAxOw0KPj4gKwkJaWYgKGVuYWJsZV9kZWNv
ZGVyKSB7DQo+PiAgIAkJCWRlY29kZXIucG00LmN1cl9vcGNvZGUgPSAweEZGRkZGRkZGOw0KPj4g
ICAJCQlkZWNvZGVyLnNkbWEuY3VyX29wY29kZSA9IDB4RkZGRkZGRkY7DQo+PiAgIAkJfQ0KPj4g
QEAgLTEyMyw3ICsxMzUsNyBAQCB2b2lkIHVtcl9yZWFkX3Jpbmcoc3RydWN0IHVtcl9hc2ljICph
c2ljLCBjaGFyICpyaW5ncGF0aCkNCj4+ICAgCQkJKHN0YXJ0ID09IHdwdHIpID8gJ3cnIDogJy4n
LA0KPj4gICAJCQkoc3RhcnQgPT0gZHJ2X3dwdHIpID8gJ0QnIDogJy4nKTsNCj4+ICAgCQlkZWNv
ZGVyLm5leHRfaWJfaW5mby5hZGRyID0gc3RhcnQgLyA0Ow0KPj4gLQkJaWYgKHVzZV9kZWNvZGVy
KQ0KPj4gKwkJaWYgKGVuYWJsZV9kZWNvZGVyKQ0KPj4gICAJCQl1bXJfcHJpbnRfZGVjb2RlKGFz
aWMsICZkZWNvZGVyLCB2YWx1ZSk7DQo+PiAgIAkJcHJpbnRmKCJcbiIpOw0KPj4gICAJCXN0YXJ0
ICs9IDQ7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
