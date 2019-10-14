Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A6D59FD
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 05:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4C26E1C4;
	Mon, 14 Oct 2019 03:32:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDC96E1C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 03:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzyDn33ExwDZd1ZdMRjqFrpJ0aDeFkMsXE/v4cbzA8LS5gAn4LlCBkmzPXADCghASeYIWsF3vZ7c4W6AnMIvEYXrXUoMFhvGmvrovvvTCM0rKMC/4T5aPSZ9vtaYmVmXaY4Iush1zVXZDQ2hCr/pMm5azSc0WJqbL/XJGcX2PZ4cnzujwrAA0gqVPU8TPbcXz78HRnqpcH3NPMN+bwO9CwjtKFz2KIzBH83w4pES+S8v1rrGj9INAmLnRamajfthNeopQvqr/AbjN1ADqHg1fJA8m7xrxTYrinmazLh6o+3bEYLRYLwzH201bOx6hf5Tnys/6aY7ok97vx+BOPX1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBE4kCfHPxbyKpaDGAWU063Jw/UklHodbyvfEGhsJj8=;
 b=RXlsNOgJmGapWgGT4V9/nJfwdnZwVOz69RK/1HHVnl12mQQ3THdIvkoSkGu2ATdTNopm3Xxu+Exeb66XTgAXF09TUcnzw/wdr9adOxkbzxNWRPm0NnKm0cyuOh64ezNs6GhCt/1HNppXSHdDBAcGuth34Y6d3Rc7BVPVzzQPkaya+CtBdfz96Xj79822jTot5q4ruKFPNFscB9bd5Z/XWRkSHEtt6s0UNHwhj5QVsOwZqpgSAm5VWyXAL6tL1asXZ0tgkMgABqI9z/hDe9vpwVgYV5GmXS+DIV6Dia+CyLUTMeVHCofGcQLLIUm2wLXmV5YBTEYN1ZZyXdY3loVsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3535.namprd12.prod.outlook.com (20.179.83.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 03:32:51 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::435:bdca:bac1:a26d%5]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 03:32:50 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "lukas@wunner.de" <lukas@wunner.de>
Subject: RE: [PATCH 00/19] Enable BACO for power savings
Thread-Topic: [PATCH 00/19] Enable BACO for power savings
Thread-Index: AQHVf9WdvBDgdwAFh0KIJFO92HwVa6dZfviA
Date: Mon, 14 Oct 2019 03:32:50 +0000
Message-ID: <MN2PR12MB3344864109A58576381CC12CE4900@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d97dc00-9449-472a-bfae-08d7505730f2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3535:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3535396A9ADE84C3B5D896CAE4900@MN2PR12MB3535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(13464003)(199004)(316002)(7736002)(74316002)(25786009)(305945005)(14454004)(110136005)(966005)(33656002)(66066001)(478600001)(71190400001)(71200400001)(8936002)(81156014)(81166006)(8676002)(2501003)(256004)(14444005)(99286004)(446003)(6116002)(6506007)(53546011)(102836004)(7696005)(76176011)(6436002)(64756008)(66946007)(3846002)(52536014)(11346002)(5660300002)(86362001)(26005)(486006)(476003)(2906002)(186003)(66476007)(66556008)(66446008)(76116006)(6246003)(6306002)(55016002)(9686003)(4326008)(2201001)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3535;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nIVwizSWsHAIyv0rggpxainXUFFbc8inFBGhkU7Sy79x/bIe+hGXEG43G0B/Ro0/nWvJvMS5epBPQ5KKV8JsXdYGtUKxG1SR9qRDQ0t70DV45kERve+J1h0OdnHEFgRW28u7VmbpxHi1moxnmO4lMBZDsXpKxITolV3Hthis3DO6cvB2sNWw23RdduEsehRv37gpgj2TwnU9+pVi8QG57Bev0mV6UcdDJLbJDKGDpE4te4gO/BEse+DzjUsd/IbWy5FqM95TICdtvuheo64b+MCWcdZ3wR2P5wFDXBtjyXmaF/OYccKLWOani0VY+pJ11SEPPV+49/wOvhZ5LBesTdxJHqs/k0PZXa4zALTSTZCxUhsp45F4sC0hXvX27ImSY0uJX/g5beGOhOlt0zAVQ4oiwZnucqlCqeV8b9p3XcS5GO28sRpyKJnWrUryt8ZE5T5N5ETEZgcsQ3cizpUYMg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d97dc00-9449-472a-bfae-08d7505730f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 03:32:50.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/f5YrjV0MtAMVneTABnA5VOhfCk+8lrisRf4ZKF1J2pd704Xpj+IsLJh62thnXa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBE4kCfHPxbyKpaDGAWU063Jw/UklHodbyvfEGhsJj8=;
 b=eUdTEnDoDp2gGKwC2rRRfOX3qr5e6+gotMdXbAKkMMqIUQ80901seoCYLCgPVSNUURgKnAEIS5cR/UUo1wkEi6d+mqNk/rw8hzmknOnuBZ/HDewXGkQshcHUrWRKq22eTrV1D0g7glTndFqQImUUbclPrBcwG+YJhHI5rkNmMu0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2ggMSAtIDE2IGFyZSBSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4NClBhdGNoIDE3IC0gMTkgYXJlIGFja2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXggRGV1Y2hl
cg0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDExLCAyMDE5IDk6NDUgQU0NClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgdGl3YWlAc3VzZS5kZTsgbHVrYXNAd3VubmVyLmRlDQpDYzog
RGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3ViamVjdDog
W1BBVENIIDAwLzE5XSBFbmFibGUgQkFDTyBmb3IgcG93ZXIgc2F2aW5ncw0KDQpUaGlzIHBhdGNo
IHNldCBlbmFibGVzIEJBQ08gKEJ1cyBBY3RpdmUgQ2hpcCBPZmYpIGZvciBwb3dlciBzYXZpbmdz
IG9uIFZJKyBhc2ljcy4gIFNpbWlsYXIgdG8gUG93ZXJYcHJlc3MgYW5kIEh5YnJpZCBHcmFwaGlj
cyAoUFgvSEcpIGxhcHRvcHMsIHdlIGNhbiBkaXNhYmxlIEdQVXMgYXQgcnVudGltZSB3aGVuIHRo
ZXkgYXJlIG5vdCBpbiB1c2UgaXMgdGhleSBzdXBwb3J0IEJBQ08uICBUaGUgcnVudGltZSBwbSBj
b2RlIGluIGFtZGdwdSB3YXMgb3JpZ2luYWxseSBkZXZlbG9wZWQgZm9yIFBYL0hHIGxhcHRvcHMs
IHNvIGl0IHdhcyBwcmV0dHkgZW50YW5nbGVkIHdpdGggdGhlIHZnYV9zd2l0Y2hlcm9vIGFuZCBB
Q1BJIGNvZGUuICBTaW5jZSB0aGUgR1BVIGNvbnRhaW5zIGFuIGF1ZGlvIGNvZGVjIGZvciBIRE1J
L0RQLCB0aGVyZSBpcyBzb21lIGludGVyYWN0aW9uIHdpdGggdGhlIGhkYSBkcml2ZXIuICBJIGFt
IGJ5IG5vIG1lYW5zIGFuIGV4cGVydCBvbiBhbHNhLCBzbyBhbnkgYWR2aWNlIG9uIHRob3NlIHBh
dGNoZXMgaXMgbXVjaCBhcHByZWNpYXRlZC4gIEkgaGFkIHRvIGVuYWJsZSBydW50aW1lIHBtIG9u
IHRoZSBoZGEgZGV2aWNlIHRvIGFsbG93IHRoZSBHUFUgdG8gZW50ZXIgcnVudGltZSBwbSBiZWNh
dXNlIHRoZXkgYXJlIGxpbmtlZC4NCg0KVGhlc2UgcGF0Y2hlcyBkZXBlbmQgb24gdGhlIGNsZWFu
IHBhdGNoZXMgYW5kIENJL1ZJIEJBQ08gcGF0Y2hlcyBJIHNlbnQgb3V0IGVhcmxpZXIgdG9kYXku
DQoNClRoZSBmdWxsIHRyZWUgY2FuIGJlIGZvdW5kIGhlcmU6DQpodHRwczovL2NnaXQuZnJlZWRl
c2t0b3Aub3JnL35hZ2Q1Zi9saW51eC9sb2cvP2g9YmFjbw0KDQpUT0RPOg0KLSBUdXJuIG9mZiBy
dW50aW1lIHBtIHdoZW4gS0ZEIGlzIGFjdGl2ZQ0KLSBNYWtlIHN1cmUgYXVkaW8gc3RpbGwgd29y
a3MNCi0gTWFrZSBzdXJlIFBYL0hHIHN0aWxsIHdvcmtzDQoNCkFsZXggRGV1Y2hlciAoMTkpOg0K
ICBkcm0vYW1kZ3B1OiBhZGQgYXNpYyBjYWxsYmFjayBmb3IgQkFDTyBzdXBwb3J0DQogIGRybS9h
bWRncHU6IGFkZCBzdXBwb3J0c19iYWNvIGNhbGxiYWNrIGZvciBzb2MxNSBhc2ljcy4NCiAgZHJt
L2FtZGdwdTogYWRkIHN1cHBvcnRzX2JhY28gY2FsbGJhY2sgZm9yIFNJIGFzaWNzLg0KICBkcm0v
YW1kZ3B1OiBhZGQgc3VwcG9ydHNfYmFjbyBjYWxsYmFjayBmb3IgQ0lLIGFzaWNzLg0KICBkcm0v
YW1kZ3B1OiBhZGQgc3VwcG9ydHNfYmFjbyBjYWxsYmFjayBmb3IgVkkgYXNpY3MuDQogIGRybS9h
bWRncHU6IGFkZCBzdXBwb3J0c19iYWNvIGNhbGxiYWNrIGZvciBOViBhc2ljcy4NCiAgZHJtL2Ft
ZGdwdTogYWRkIGEgYW1kZ3B1X2RldmljZV9zdXBwb3J0c19iYWNvIGhlbHBlcg0KICBkcm0vYW1k
Z3B1OiByZW5hbWUgYW1kZ3B1X2RldmljZV9pc19weCB0byBhbWRncHVfZGV2aWNlX3N1cHBvcnRz
X2JvY28NCiAgZHJtL2FtZGdwdTogYWRkIGFkZGl0aW9uYWwgYm9jbyBjaGVja3MgdG8gcnVudGlt
ZSBzdXNwZW5kL3Jlc3VtZQ0KICBkcm0vYW1kZ3B1OiBzcGxpdCBzd1NNVSBiYWNvX3Jlc2V0IGlu
dG8gZW50ZXIgYW5kIGV4aXQNCiAgZHJtL2FtZGdwdTogYWRkIGhlbHBlcnMgZm9yIGJhY28gZW50
cnkgYW5kIGV4aXQNCiAgZHJtL2FtZGdwdTogYWRkIGJhY28gc3VwcG9ydCB0byBydW50aW1lIHN1
c3BlbmQvcmVzdW1lDQogIGRybS9hbWRncHU6IHN0YXJ0IHRvIGRpc2VudGFuZ2xlIGJvY28gZnJv
bSBydW50aW1lIHBtDQogIGRybS9hbWRncHU6IGRpc2VudGFuZ2xlIHJ1bnRpbWUgcG0gYW5kIHZn
YV9zd2l0Y2hlcm9vDQogIGRybS9hbWRncHU6IGVuYWJsZSBydW50aW1lIHBtIG9uIEJBQ08gY2Fw
YWJsZSBib2FyZHMgaWYgcnVucG09MQ0KICBkcm0vYW1kZ3B1L3J1bnBtOiBlbmFibGUgcnVucG0g
b24gYmFjbyBjYXBhYmxlIFZJKyBhc2ljcw0KICBBTFNBOiBoZGEvaGRtaSAtIGZpeCB2Z2Fzd2l0
Y2hlcm9vIGRldGVjdGlvbiBmb3IgQU1EDQogIEFMU0E6IGhkYS9oZG1pIC0gZW5hYmxlIHJ1bnRp
bWUgcG0gZm9yIG5ld2VyIEFNRCBkaXNwbGF5IGF1ZGlvDQogIEFMU0E6IGhkYS9oZG1pIC0gZW5h
YmxlIGF1dG9tYXRpYyBydW50aW1lIHBtIGZvciBBTUQgSERNSSBjb2RlY3MgYnkNCiAgICBkZWZh
dWx0DQoNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgfCAg
MTIgKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAx
MDYgKysrKysrKysrKysrKysrKy0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jICAgICAgIHwgIDY0ICsrKysrKy0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ttcy5jICAgICAgIHwgIDIwICsrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9jaWsuYyAgICAgICAgICAgICAgfCAgMTggKysrDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYyAgICAgICAgICAgICAgIHwgIDE4ICsrLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3NpLmMgICAgICAgICAgICAgICB8ICAgNiArDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc29jMTUuYyAgICAgICAgICAgIHwgIDM3ICsrKysrLQ0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3ZpLmMgICAgICAgICAgICAgICB8ICAyMiArKysrDQogLi4uL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwgICA5ICstDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgICAgIHwgIDEyICstDQogc291bmQvcGNpL2hkYS9o
ZGFfaW50ZWwuYyAgICAgICAgICAgICAgICAgICAgIHwgIDc0ICsrKysrKysrKysrLQ0KIHNvdW5k
L3BjaS9oZGEvcGF0Y2hfaGRtaS5jICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogMTMgZmls
ZXMgY2hhbmdlZCwgMzQzIGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQ0KDQotLQ0KMi4y
MC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQph
bWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
