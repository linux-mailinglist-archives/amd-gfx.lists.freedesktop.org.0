Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEC10F29C
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Dec 2019 23:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E306E358;
	Mon,  2 Dec 2019 22:05:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EE96E358
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Dec 2019 22:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV33CjiK1XGyTw8sb9h1OCpjEvAOMQxcFhuUSRgulji746hYGYD1mmwbJAaGmj/x7wptqAXPPgOu4FgBMUMUWrh/D5W1AcnhKugFHBPY3r7FjVeAqF1PcDkeur3yGw+iuFp4kUsXKa9VY35mbiQ9cOEpmYd4LybI5Gwa3gCe930NmG8l19ynqu+3LbeyE5ZFd7IrTYypw1iY4mzBZyKPBp0BzDD62/7EKyxeqFR3wRi5pa/ZI7sxohMHsn3p4X0bWvkpsZZI/Qzk+6LS6Dt28pithZFWEO+Ou3I3iRRbFrkJjxLo6vVEWaWlHT9UjyVvyCeEz1AHp3ntKkw970kMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4VO0s/7HIsLiOG74QhwgFAkN24pltSs9tdxONRvWhw=;
 b=L4+hrCopTs32uxtUPT4Smy19cpOyvNrioj1mFK9zX97Yjj33rhKuKs2gcqACcNufeX7zyXeQQwoX0LasARirrBoah/MsnB4qcw44jKr8hv0VnhkNvGRL8qhRXYS4m4yI9JZFimJ8gb3JYPOubghceHeXL62RCVxQMXqNaGREz/Gfa4pxbH6Sj9m3G/e0g4+n5Ml29gXCdZuHlrx4EOGqRXb5ITf9+voph5CDpqLUEBQOmvzfCyq+11DAZrAbo0ib+97fXvz5GhdKaV0763rjPQ191Kzg6kU+bdX/EJY3VV1mZLTQAjPd5If2SKwdqxJagMPyNKflyxYd0fLKK2Piiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1767.namprd12.prod.outlook.com (10.175.62.137) by
 CY4PR12MB1382.namprd12.prod.outlook.com (10.168.168.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 22:05:41 +0000
Received: from CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::a10f:8e49:6e05:c0ba]) by CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::a10f:8e49:6e05:c0ba%9]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 22:05:41 +0000
From: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
To: Kenny Ho <y2kenny@gmail.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: RE: [PATCH RFC v4 16/16] drm/amdgpu: Integrate with DRM cgroup
Thread-Topic: [PATCH RFC v4 16/16] drm/amdgpu: Integrate with DRM cgroup
Thread-Index: AQHVXi/m5pTr5WTyNEOFx/+x0TqOP6dRXAKAgFDb/gCABbqWkA==
Date: Mon, 2 Dec 2019 22:05:41 +0000
Message-ID: <CY4PR12MB176798E58351FC1F3416F658F9430@CY4PR12MB1767.namprd12.prod.outlook.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-17-Kenny.Ho@amd.com>
 <04abdc58-ae30-a13d-e7dc-f1020a1400b9@amd.com>
 <CAOWid-cC3mqHomBMwVC0Fs02sybP4GO+T=8_=cEepD=a-Tb+7w@mail.gmail.com>
In-Reply-To: <CAOWid-cC3mqHomBMwVC0Fs02sybP4GO+T=8_=cEepD=a-Tb+7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 58adc991-da56-4cd2-bdfe-08d77773c5b4
x-ms-traffictypediagnostic: CY4PR12MB1382:|CY4PR12MB1382:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB138229F7398FE09B3956A7EFF9430@CY4PR12MB1382.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(13464003)(71190400001)(81166006)(8936002)(76176011)(6306002)(6436002)(9686003)(4326008)(52536014)(99286004)(102836004)(186003)(55016002)(6506007)(6246003)(26005)(110136005)(54906003)(478600001)(25786009)(11346002)(446003)(53546011)(33656002)(305945005)(74316002)(7696005)(81156014)(8676002)(316002)(966005)(229853002)(76116006)(66556008)(64756008)(66446008)(66476007)(66946007)(7736002)(30864003)(66066001)(6116002)(14454004)(3846002)(2906002)(5660300002)(256004)(14444005)(6636002)(86362001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1382;
 H:CY4PR12MB1767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gCY5T0Nxh49IhEubVeSeqh6S+riOlyZT3j6emZv2ypqd9iKw1DmLfEjbJrai6UEYr3xeTB8s0hXyf+6wcX0eBwMCNuAeld4Fanw8EdAWDqXYNoARJwSa11gb6hXMl5LgopNAaMKHU4SOcvVS4pC6p8y/VKSPd1kqgdjvaOzNvssevlT7qyDEd++5yhLjDipiud0O+M7nKTlV9KCcugk1HHeQpOg1IJRLajGxmAsGueLbqlIv/iYx9cPBXSUzBXrH50p4mEv3CXMfqszxbZWBkyDp3ExY4vytwerXSO2F5vxJGKu/ISI/7YpMsmM6QhAcKIIeE7H3HIBbhXYfsTPGZ3w4D5KZyY3fVfYGkEgq0ZquBj1LtDXq8jFXvEjSXgKThlK6f4Qgo8u/0xxs0U4DgEJKslpNdS0sFZxCjNUP80bYaQqUvmcf0tX9aCgatsFrTLDuxm0I91P7anvKBkwHa8gvfOYds+MxKus8jiqJhAw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58adc991-da56-4cd2-bdfe-08d77773c5b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 22:05:41.6576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K8yVbL/AFoMuGM2HCGMINKvLnZVe9ZJHgqewjFA3tULeZnInpXTTVSRvyyuEjCo7yAKAAs7/QnEQ05mQzxIxlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1382
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4VO0s/7HIsLiOG74QhwgFAkN24pltSs9tdxONRvWhw=;
 b=UKjl8X4ZOyezvwhfVLubIqHPJ7715eQxQaPz50+vCBWmEzWVQhjYpIk9QuIpqxLZ+qV4aXLN2a95kdj+MmzrcYDCS14yjgWxER1FNu/B+iOmidskpLV58TwBZbu5ZGKvD7mqH9yHxO+zTLACX1piSYxKnttBpG2YBNXdA2cwR0Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Joseph.Greathouse@amd.com; 
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLZW5ueSBIbyA8eTJrZW5ueUBn
bWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjksIDIwMTkgMTI6MDAgQU0NCj4g
DQo+IFJlZHVjaW5nIGF1ZGllbmNlIHNpbmNlIHRoaXMgaXMgQU1EIHNwZWNpZmljLg0KPiANCj4g
T24gVHVlLCBPY3QgOCwgMjAxOSBhdCAzOjExIFBNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiAyMDE5LTA4LTI5IDI6MDUgYS5tLiwg
S2VubnkgSG8gd3JvdGU6DQo+ID4gPiBUaGUgbnVtYmVyIG9mIGxvZ2ljYWwgZ3B1IChsZ3B1KSBp
cyBkZWZpbmVkIHRvIGJlIHRoZSBudW1iZXIgb2YNCj4gPiA+IGNvbXB1dGUgdW5pdCAoQ1UpIGZv
ciBhIGRldmljZS4gIFRoZSBsZ3B1IGFsbG9jYXRpb24gbGltaXQgb25seQ0KPiA+ID4gYXBwbGll
cyB0byBjb21wdXRlIHdvcmtsb2FkIGZvciB0aGUgbW9tZW50IChlbmZvcmNlZCB2aWEga2ZkIHF1
ZXVlDQo+ID4gPiBjcmVhdGlvbi4pICBBbnkgY3VfbWFzayB1cGRhdGUgaXMgdmFsaWRhdGVkIGFn
YWluc3QgdGhlIGF2YWlsYWJpbGl0eQ0KPiA+ID4gb2YgdGhlIGNvbXB1dGUgdW5pdCBhcyBkZWZp
bmVkIGJ5IHRoZSBkcm1jZyB0aGUga2ZkIHByb2Nlc3MgYmVsb25ncyB0by4NCj4gPg0KPiA+IFRo
ZXJlIGlzIHNvbWV0aGluZyBtaXNzaW5nIGhlcmUuIFRoZXJlIGlzIGFuIEFQSSBmb3IgdGhlIGFw
cGxpY2F0aW9uDQo+ID4gdG8gc3BlY2lmeSBhIENVIG1hc2suIFJpZ2h0IG5vdyBpdCBsb29rcyBs
aWtlIHRoZQ0KPiA+IGFwcGxpY2F0aW9uLXNwZWNpZmllZCBhbmQgQ0dyb3VwLXNwZWNpZmllZCBD
VSBtYXNrcyB3b3VsZCBjbG9iYmVyIGVhY2gNCj4gPiBvdGhlci4gSW5zdGVhZCB0aGUgdHdvIHNo
b3VsZCBiZSBtZXJnZWQuDQo+ID4NCj4gPiBUaGUgQ0dyb3VwLXNwZWNpZmllZCBtYXNrIHNob3Vs
ZCBzcGVjaWZ5IGEgc3Vic2V0IG9mIENVcyBhdmFpbGFibGUgZm9yDQo+ID4gYXBwbGljYXRpb24t
c3BlY2lmaWVkIENVIG1hc2tzLiBXaGVuIHRoZSBjZ3JvdXAgQ1UgbWFzayBjaGFuZ2VzLCB5b3Un
ZA0KPiA+IG5lZWQgdG8gdGFrZSBhbnkgYXBwbGljYXRpb24tc3BlY2lmaWVkIENVIG1hc2tzIGlu
dG8gYWNjb3VudCBiZWZvcmUNCj4gPiB1cGRhdGluZyB0aGUgaGFyZHdhcmUuDQo+IFRoZSBpZGVh
IGJlaGluZCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpcyB0byBnaXZlIHN5c2FkbWluIHBy
aW9yaXR5IG92ZXIgdXNlciBhcHBsaWNhdGlvbiAoYXMgdGhhdCBpcyB0aGUgZGVmaW5pdGlvbiBv
ZiBjb250cm9sDQo+IGdyb3VwLikgIE1hc2sgc3BlY2lmaWVkIGJ5IGFwcGxpY2F0b2luL3VzZXIg
aXMgdmFsaWRhdGVkIGJ5IHBxbV9kcm1jZ19sZ3B1X3ZhbGlkYXRlIGFuZCByZWplY3RlZCB3aXRo
IEVBQ0NFUyBpZiB0aGV5IGFyZSBub3QNCj4gY29tcGF0aWJsZS4gIFRoZSBhbHRlcm5hdGl2ZSBp
cyB0byBpZ25vcmUgdGhlIGRpZmZlcmVuY2UgYW5kIGhhdmUgdGhlIGtlcm5lbCBndWVzcy9yZWRp
c3RyaWJ1dGUgdGhlIGFzc2lnbm1lbnQgYnV0IEkgYW0gbm90IHN1cmUgaWYgdGhpcw0KPiBpcyBh
IGdvb2QgYXBwcm9hY2ggc2luY2UgdGhlcmUgaXMgbm90IGVub3VnaCBpbmZvcm1hdGlvbiB0byBh
bGxvdyB0aGUga2VybmVsIHRvIGd1ZXNzIHRoZSB1c2VyJ3MgaW50ZW50aW9uIGNvcnJlY3RseSBj
b25zaXN0ZW50bHkuICAoVGhpcw0KPiBpcyBiYXNlIG9uIG11bHRpcGxlIGNvbnZlcnNhdGlvbnMg
d2l0aCB5b3UgYW5kIEpvZSB0aGF0LCBsZWQgbWUgdG8gYmVsaWV2ZSwgdGhlcmUgYXJlIHNpdHVh
dGlvbiB3aGVyZSBzcHJlYWRpbmcgQ1UgYXNzaWdubWVudCBhY3Jvc3MNCj4gbXVsdGlwbGUgU0Ug
aXMgYSBnb29kIHRoaW5nIGJ1dCBub3QgYWx3YXlzLikNCj4gDQo+IElmIHRoZSBjZ3JvdXAtc3Bl
Y2lmaWVkIG1hc2sgaXMgY2hhbmdlZCBhZnRlciB0aGUgYXBwbGljYXRpb24gaGFzIHNldCB0aGUg
bWFzaywgdGhlIGludGVyc2VjdGlvbiBvZiB0aGUgdHdvIG1hc2tzIHdpbGwgYmUgc2V0IGluc3Rl
YWQuICBJdA0KPiBpcyBwb3NzaWJsZSB0byBoYXZlIG5vIGludGVyc2VjdGlvbiBhbmQgaW4gdGhp
cyBjYXNlIG5vIENVIGlzIG1hZGUgYXZhaWxhYmxlIHRvIHRoZSBhcHBsaWNhdGlvbiAoanVzdCBs
aWtlIHRoZSBwb3NzaWJpbGl0eSBmb3IgbWVtY2dyb3VwIHRvDQo+IHN0YXJ2ZSB0aGUgYW1vdW50
IG9mIG1lbW9yeSBuZWVkZWQgYnkgYW4gYXBwbGljYXRpb24uKQ0KDQpJIGRvbid0IGRpc2FncmVl
IHdpdGggZm9yY2luZyBhIHVzZXIgdG8gd29yayB3aXRoaW4gYW4gbGdwdSdzIGFsbG9jYXRpb24u
IEJ1dCB0aGVyZSdzIHR3byBtaW5vciBwcm9ibGVtcyBoZXJlOg0KDQoxKSB3ZSB3aWxsIG5lZWQg
YSB3YXkgZm9yIHRoZSBwcm9jZXNzIHRvIHF1ZXJ5IHdoYXQgdGhlIGxncHUncyBiaXRtYXAgbG9v
a3MgbGlrZS4gWW91IGFuZCBGZWxpeCBhcmUgc29tZXdoYXQgZGlzY3Vzc2luZyB0aGlzIGJlbG93
LCBidXQgSSBkb24ndCB0aGluayB0aGUgS0ZEJ3MgIm51bWJlciBvZiBDVXMiIHRvcG9sb2d5IGlu
Zm9ybWF0aW9uIGlzIHN1ZmZpY2llbnQuIEkgY2FuIGtub3cgSSBoYXZlIDMyIENVcywgYnV0IEkg
ZG9uJ3Qga25vdyB3aGljaCAzMiBiaXRzIGluIHRoZSBiaXRtYXNrIGFyZSB0dXJuZWQgb24uIEJ1
dCB5b3VyIGNvZGUgaW4gcHFtX2RybWNnX2xncHVfdmFsaWRhdGUoKSByZXF1aXJlcyBhIHN1YnNl
dCB3aGVuIHNldHRpbmcgIENVIG1hc2sgb24gYW4gbGdwdS4gQSB1c2VyIG5lZWRzIHRvIGtub3cg
d2hhdCBiaXRzIGFyZSBvbiBpbiB0aGUgTEdQVSBmb3IgdGhpcyB0byB3b3JrLg0KMikgRXZlbiBp
ZiB3ZSBoYXZlIGEgcXVlcnkgQVBJLCBkbyB3ZSBoYXZlIGFuIGVhc3kgd2F5IHRvIHByZXZlbnQg
YSBkYXRhIHJhY2U/IERvIHdlIGNhcmU/IEZvciBpbnN0YW5jZSwgaWYgSSBxdWVyeSB0aGUgZXhp
c3RpbmcgbGdwdSBiaXRtYXAsIHRoZW4gdHJ5IHRvIHNldCBhIENVIG1hc2sgb24gYSBzdWJzZXQg
b2YgdGhhdCwgaXQncyBwb3NzaWJsZSB0aGF0IHRoZSBsZ3B1IHdpbGwgY2hhbmdlIGJldHdlZW4g
dGhlIHF1ZXJ5IGFuZCBzZXQuIFRoYXQgd291bGQgbWFrZSB0aGUgc2V0dGluZyBmYWlsLCBtYXli
ZSB0aGF0J3MgZ29vZCBlbm91Z2ggKHlvdSBjYW4ganVzdCB0cnkgaW4gYSBsb29wIHVudGlsIGl0
IHN1Y2NlZWRzPykgDQoNCkRvIGVtcHR5IENVIG1hc2tzIGFjdHVhbGx5IHdvcms/IFRoaXMgc2Vl
bXMgbGlrZSBzb21ldGhpbmcgd2Ugd291bGQgd2FudCB0byBhdm9pZC4gVGhpcyBjb3VsZCBoYXBw
ZW4gbm90IGluZnJlcXVlbnRseSBpZiBzb21lb25lIGRvZXMgc29tZXRoaW5nIGxpa2U6DQoqIGxn
cHUgd2l0aCBoYWxmIHRoZSBDVXMgZW5hYmxlZA0KKiBVc2VyIHNldHMgYSBtYXNrIHRvIHVzZSBo
YWxmIG9mIHRob3NlIENVcw0KKiBsZ3B1IGlzIGNoYW5nZWQgdG8gZW5hYmxlIHRoZSBvdGhlciBo
YWxmIG9mIHRoZSBDVVMgLS0+IG5vdyB0aGUgdXNlcidzIG1hc2sgaXMgZnVsbHkgZGVzdHJveWVk
IGFuZCBldmVyeXRoaW5nIGRpZXMuIDpcDQoNCj4gPiBUaGUgS0ZEIHRvcG9sb2d5IEFQSXMgcmVw
b3J0IHRoZSBudW1iZXIgb2YgYXZhaWxhYmxlIENVcyB0byB0aGUNCj4gPiBhcHBsaWNhdGlvbi4g
Q0dyb3VwcyB3b3VsZCBjaGFuZ2UgdGhhdCBudW1iZXIgYXQgcnVudGltZSBhbmQNCj4gPiBhcHBs
aWNhdGlvbnMgd291bGQgbm90IGV4cGVjdCB0aGF0LiBJIHRoaW5rIHRoZSBiZXN0IHdheSB0byBk
ZWFsIHdpdGgNCj4gPiB0aGF0IHdvdWxkIGJlIHRvIGhhdmUgbXVsdGlwbGUgYml0cyBpbiB0aGUg
YXBwbGljYXRpb24tc3BlY2lmaWVkIENVDQo+ID4gbWFzayBtYXAgdG8gdGhlIHNhbWUgQ1UuIEhv
dyB0byBkbyB0aGF0IGluIGEgZmFpciB3YXkgaXMgbm90IG9idmlvdXMuDQo+ID4gSSBndWVzcyBh
IG1vcmUgY29hcnNlLWdyYWluIGRpdmlzaW9uIG9mIHRoZSBHUFUgaW50byBMR1BVcyB3b3VsZCBt
YWtlDQo+ID4gdGhpcyBzb21ld2hhdCBlYXNpZXIuDQo+IEFub3RoZXIgcG9zc2liaWxpdHkgaXMg
dG8gYWRkIG5hbWVzcGFjZSB0byB0aGUgdG9wb2xvZ3kgc3lzZnMgc3VjaCB0aGF0IHRoZSBjb3Jy
ZWN0IG51bWJlciBvZiBDVXMgY2hhbmdlcyBhY2NvcmRpbmdseS4gIEFsdGhvdWdoIHRoYXQNCj4g
d291bGRuJ3QgZ2l2ZSB0aGUgdXNlciB0aGUgYXZhaWxhYmxlIG1hc2sgdGhhdCBpcyBtYWRlIGF2
YWlsYWJsZSBieSB0aGlzIGltcGxlbWVudGF0aW9uIHZpYSB0aGUgY2dyb3VwIHN5c2ZzLiAgQW5v
dGhlciBwb3NzaWJpbGl0eSBpcyB0bw0KPiBtb2RpZnkgdGhlIHRodW5rIHNpbWlsYXIgdG8gd2hh
dCB3YXMgZG9uZSBmb3IgZGV2aWNlIGNncm91cCAoZGV2aWNlDQo+IHJlLW1hcHBpbmcuKQ0KDQpJ
J2Qgdm90ZSBmb3IgYSBzZXQgb2YgbWFzayBxdWVyeSBBUElzIGluIHRoZSBUaHVuay4gT25lIGZv
ciB0aGUgcHJvY2VzcydzIGN1cnJlbnQgQ1UgbWFzaywgYW5kIG9uZSBmb3IgYSBxdWV1ZSdzIGN1
cnJlbnQgQ1UgbWFzay4gV2UgaGF2ZSBhIHNldHRlciBBUEkgYWxyZWFkeS4gU2luY2UgdGhlIEtG
RCB0b3BvbG9neSBpbmZvcm1hdGlvbiBpcyBhbHNvIG1pcnJvcmVkIGluIHN5c2ZzLCBJIHdvdWxk
IHdvcnJ5IHRoYXQgYSBwcm9jZXNzIHdvdWxkIHNlZSBkaWZmZXJlbnQgS0ZEIHRvcG9sb2d5IGlu
Zm9ybWF0aW9uIGlmIGl0J3MgcXVlcnlpbmcgdGhlIFRodW5rICh3aGljaCB3b3VsZCBzaG93IHRo
ZSBsZ3B1J3MgbnVtYmVyIG9mIENVUzAgdnMuIGlmIGl0J3MgcmVhZGluZyBzeXNmcyAod2hpY2gg
d291bGQgc2hvdyB0aGUgR1BVJ3MgbnVtYmVyIG9mIENVcykuDQoNCkFzIG1lbnRpb25lZCBhYm92
ZSwgdGhlIEtGRCAibnVtIENVcyIgaXMgaW5zdWZmaWNpZW50IGZvciBrbm93aW5nIGhvdyB0byBz
ZXQgdGhlIENVIGJpdG1hc2ssIHNvIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHJlbHkgb24gaXQg
aW4gdGhpcyBjYXNlLiBJTU8sIEtGRCB0b3BvbG9neSBzaG91bGQgZGVzY3JpYmUgdGhlIHJlYWwg
aGFyZHdhcmUgcmVnYXJkbGVzcyBvZiBob3cgY2dyb3VwcyBpcyBsaW1pdGluZyB0aGluZ3MuIEkn
bSB3aWxsaW5nIHRvIGJlIHRvbGQgdGhpcyBpcyBhIGJhZCBpZGVhLCB0aG91Z2guDQoNCj4gPiBI
b3cgaXMgdGhpcyBwcm9ibGVtIGhhbmRsZWQgZm9yIENQVSBjb3JlcyBhbmQgdGhlIGludGVyYWN0
aW9uIHdpdGggQ1BVDQo+ID4gcHRocmVhZF9zZXRhZmZpbml0eV9ucD8NCj4gUGVyIHRoZSBkb2N1
bWVudGF0aW9uIG9mIHB0aHJlYWRfc2V0YWZmaW5pdHlfbnAsICJJZiB0aGUgY2FsbCBpcyBzdWNj
ZXNzZnVsLCBhbmQgdGhlIHRocmVhZCBpcyBub3QgY3VycmVudGx5IHJ1bm5pbmcgb24gb25lIG9m
IHRoZSBDUFVzDQo+IGluIGNwdXNldCwgdGhlbiBpdCBpcyBtaWdyYXRlZCB0byBvbmUgb2YgdGhv
c2UgQ1BVcy4iDQo+IGh0dHA6Ly9tYW43Lm9yZy9saW51eC9tYW4tcGFnZXMvbWFuMy9wdGhyZWFk
X3NldGFmZmluaXR5X25wLjMuaHRtbA0KPg0KPiBSZWdhcmRzLA0KPiBLZW5ueQ0KPiANCj4gDQo+
IA0KPiA+IFJlZ2FyZHMsDQo+ID4gICAgRmVsaXgNCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4gQ2hh
bmdlLUlkOiBJNjlhNTc0NTJjNTQ5MTczYTFjZDYyM2MzMGRjNTcxOTViM2I2NTYzZQ0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogS2VubnkgSG8gPEtlbm55LkhvQGFtZC5jb20+DQo+ID4gPiAtLS0NCj4g
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgICA0
ICsNCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgICAg
IHwgIDIxICsrKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRl
di5jICAgICAgfCAgIDYgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oICAgICAgICAgfCAgIDMgKw0KPiA+ID4gICAuLi4vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
c19xdWV1ZV9tYW5hZ2VyLmMgICAgfCAxNDAgKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgIDUg
ZmlsZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPiA+ID4gaW5kZXggNTVj
YjFiMjA5NGZkLi4zNjk5MTUzMzcyMTMgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPiA+ID4gQEAgLTE5OCw2ICsxOTgsMTAgQEAg
dWludDhfdCBhbWRncHVfYW1ka2ZkX2dldF94Z21pX2hvcHNfY291bnQoc3RydWN0IGtnZF9kZXYg
KmRzdCwgc3RydWN0IGtnZF9kZXYgKnMNCj4gPiA+ICAgICAgICAgICAgICAgdmFsaWQ7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gPiAgICAg
ICB9KQ0KPiA+ID4NCj4gPiA+ICtpbnQgYW1kZ3B1X2FtZGtmZF91cGRhdGVfY3VfbWFza19mb3Jf
cHJvY2VzcyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssDQo+ID4gPiArICAgICAgICAgICAgIHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBsb25nICpsZ3B1X2JpdG1hcCwNCj4g
PiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5iaXRzKTsNCj4gPiA+ICsNCj4gPiA+ICAg
LyogR1BVVk0gQVBJICovDQo+ID4gPiAgIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2NyZWF0ZV9w
cm9jZXNzX3ZtKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVuc2lnbmVkIGludCBwYXNpZCwNCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqKnZtLCB2b2lkDQo+
ID4gPiAqKnByb2Nlc3NfaW5mbywgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMNCj4gPiA+IGluZGV4IDE2M2E0ZmJmMDYxMS4uOGFiZWZmZGQyZTViIDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCj4gPiA+IEBA
IC0xMzk4LDkgKzEzOTgsMjkgQEAgYW1kZ3B1X2dldF9jcnRjX3NjYW5vdXRfcG9zaXRpb24oc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IHBpcGUsDQo+ID4gPiAgIHN0YXRpYyB2
b2lkIGFtZGdwdV9kcm1jZ19jdXN0b21faW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+
ID4gICAgICAgc3RydWN0IGRybWNnX3Byb3BzICpwcm9wcykNCj4gPiA+ICAgew0KPiA+ID4gKyAg
ICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkZXYtPmRldl9wcml2YXRlOw0KPiA+ID4g
Kw0KPiA+ID4gKyAgICAgcHJvcHMtPmxncHVfY2FwYWNpdHkgPSBhZGV2LT5nZnguY3VfaW5mby5u
dW1iZXI7DQo+ID4gPiArDQo+ID4gPiAgICAgICBwcm9wcy0+bGltaXRfZW5mb3JjZWQgPSB0cnVl
Ow0KPiA+ID4gICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyB2b2lkIGFtZGdwdV9kcm1jZ19saW1p
dF91cGRhdGVkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gPiArICAgICAgICAgICAgIHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IGRybWNnX2RldmljZV9yZXNvdXJjZSAqZGRy
LA0KPiA+ID4gKyAgICAgICAgICAgICBlbnVtIGRybWNnX3Jlc190eXBlIHJlc190eXBlKSB7DQo+
ID4gPiArICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7
DQo+ID4gPiArDQo+ID4gPiArICAgICBzd2l0Y2ggKHJlc190eXBlKSB7DQo+ID4gPiArICAgICBj
YXNlIERSTUNHX1RZUEVfTEdQVToNCj4gPiA+ICsgICAgICAgICAgICAgYW1kZ3B1X2FtZGtmZF91
cGRhdGVfY3VfbWFza19mb3JfcHJvY2Vzcyh0YXNrLCBhZGV2LA0KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIGRkci0+bGdwdV9hbGxvY2F0ZWQsIGRldi0+ZHJtY2dfcHJvcHMubGdwdV9j
YXBhY2l0eSk7DQo+ID4gPiArICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgZGVmYXVs
dDoNCj4gPiA+ICsgICAgICAgICAgICAgYnJlYWs7DQo+ID4gPiArICAgICB9DQo+ID4gPiArfQ0K
PiA+ID4gKw0KPiA+ID4gICBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZlciA9IHsN
Cj4gPiA+ICAgICAgIC5kcml2ZXJfZmVhdHVyZXMgPQ0KPiA+ID4gICAgICAgICAgIERSSVZFUl9V
U0VfQUdQIHwgRFJJVkVSX0FUT01JQyB8IEBAIC0xNDM4LDYgKzE0NTgsNyBAQA0KPiA+ID4gc3Rh
dGljIHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2ZXIgPSB7DQo+ID4gPiAgICAgICAuZ2VtX3By
aW1lX21tYXAgPSBhbWRncHVfZ2VtX3ByaW1lX21tYXAsDQo+ID4gPg0KPiA+ID4gICAgICAgLmRy
bWNnX2N1c3RvbV9pbml0ID0gYW1kZ3B1X2RybWNnX2N1c3RvbV9pbml0LA0KPiA+ID4gKyAgICAg
LmRybWNnX2xpbWl0X3VwZGF0ZWQgPSBhbWRncHVfZHJtY2dfbGltaXRfdXBkYXRlZCwNCj4gPiA+
DQo+ID4gPiAgICAgICAubmFtZSA9IERSSVZFUl9OQU1FLA0KPiA+ID4gICAgICAgLmRlc2MgPSBE
UklWRVJfREVTQywNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfY2hhcmRldi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9j
aGFyZGV2LmMNCj4gPiA+IGluZGV4IDEzOGM3MDQ1NGUyYi4uZmE3NjViODAzZjk3IDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPiA+ID4g
QEAgLTQ1MCw2ICs0NTAsMTIgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfc2V0X2N1X21hc2soc3Ry
dWN0IGZpbGUgKmZpbHAsIHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwNCj4gPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIC1FRkFVTFQ7DQo+ID4gPiAgICAgICB9DQo+ID4gPg0KPiA+ID4gKyAgICAgaWYg
KCFwcW1fZHJtY2dfbGdwdV92YWxpZGF0ZShwLCBhcmdzLT5xdWV1ZV9pZCwgcHJvcGVydGllcy5j
dV9tYXNrLCBjdV9tYXNrX3NpemUpKSB7DQo+ID4gPiArICAgICAgICAgICAgIHByX2RlYnVnKCJD
VSBtYXNrIG5vdCBwZXJtaXR0ZWQgYnkgRFJNIENncm91cCIpOw0KPiA+ID4gKyAgICAgICAgICAg
ICBrZnJlZShwcm9wZXJ0aWVzLmN1X21hc2spOw0KPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4g
LUVBQ0NFUzsNCj4gPiA+ICsgICAgIH0NCj4gPiA+ICsNCj4gPiA+ICAgICAgIG11dGV4X2xvY2so
JnAtPm11dGV4KTsNCj4gPiA+DQo+ID4gPiAgICAgICByZXR2YWwgPSBwcW1fc2V0X2N1X21hc2so
JnAtPnBxbSwgYXJncy0+cXVldWVfaWQsDQo+ID4gPiAmcHJvcGVydGllcyk7IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4gPiA+IGluZGV4IDhiMGVlZTViMzUyMS4u
ODg4ODFiZWM3NTUwIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaA0KPiA+ID4gQEAgLTEwMzgsNiArMTAzOCw5IEBAIGludCBwcW1fZ2V0X3dhdmVfc3Rh
dGUoc3RydWN0IHByb2Nlc3NfcXVldWVfbWFuYWdlciAqcHFtLA0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgdTMyICpjdGxfc3RhY2tfdXNlZF9zaXplLA0KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgdTMyICpzYXZlX2FyZWFfdXNlZF9zaXplKTsNCj4gPiA+DQo+ID4gPiArYm9vbCBwcW1f
ZHJtY2dfbGdwdV92YWxpZGF0ZShzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsIGludCBxaWQsIHUzMiAq
Y3VfbWFzaywNCj4gPiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgaW50IGN1X21hc2tfc2l6ZSk7
DQo+ID4gPiArDQo+ID4gPiAgIGludCBhbWRrZmRfZmVuY2Vfd2FpdF90aW1lb3V0KHVuc2lnbmVk
IGludCAqZmVuY2VfYWRkciwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBmZW5jZV92YWx1ZSwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCB0aW1lb3V0X21zKTsgZGlmZiAtLWdpdA0KPiA+ID4gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+
ID4gPiBpbmRleCA3ZTZjM2VlODJmNWIuLmE4OTZkZTI5MDMwNyAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0K
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVf
bWFuYWdlci5jDQo+ID4gPiBAQCAtMjMsOSArMjMsMTEgQEANCj4gPiA+DQo+ID4gPiAgICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQo+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L2Nncm91cF9kcm0uaD4NCj4gPiA+ICAgI2luY2x1ZGUgImtmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5oIg0KPiA+ID4gICAjaW5jbHVkZSAia2ZkX3ByaXYuaCINCj4g
PiA+ICAgI2luY2x1ZGUgImtmZF9rZXJuZWxfcXVldWUuaCINCj4gPiA+ICsjaW5jbHVkZSAiYW1k
Z3B1LmgiDQo+ID4gPiAgICNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiDQo+ID4gPg0KPiA+ID4g
ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBwcm9jZXNzX3F1ZXVlX25vZGUgKmdldF9xdWV1ZV9ieV9x
aWQoIEBADQo+ID4gPiAtMTY3LDYgKzE2OSw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2NwX3F1ZXVl
KHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwNCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpxX3Byb3BlcnRpZXMsDQo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZmlsZSAqZiwgdW5zaWdu
ZWQgaW50IHFpZCkNCj4gPiA+ICAgew0KPiA+ID4gKyAgICAgc3RydWN0IGRybWNnICpkcm1jZzsN
Cj4gPiA+ICAgICAgIGludCByZXR2YWw7DQo+ID4gPg0KPiA+ID4gICAgICAgLyogRG9vcmJlbGwg
aW5pdGlhbGl6ZWQgaW4gdXNlciBzcGFjZSovIEBAIC0xODAsNiArMTgzLDM2IEBADQo+ID4gPiBz
dGF0aWMgaW50IGNyZWF0ZV9jcF9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpw
cW0sDQo+ID4gPiAgICAgICBpZiAocmV0dmFsICE9IDApDQo+ID4gPiAgICAgICAgICAgICAgIHJl
dHVybiByZXR2YWw7DQo+ID4gPg0KPiA+ID4gKw0KPiA+ID4gKyAgICAgZHJtY2cgPSBkcm1jZ19n
ZXQocHFtLT5wcm9jZXNzLT5sZWFkX3RocmVhZCk7DQo+ID4gPiArICAgICBpZiAoZHJtY2cpIHsN
Cj4gPiA+ICsgICAgICAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7DQo+ID4gPiAr
ICAgICAgICAgICAgIHN0cnVjdCBkcm1jZ19kZXZpY2VfcmVzb3VyY2UgKmRkcjsNCj4gPiA+ICsg
ICAgICAgICAgICAgaW50IG1hc2tfc2l6ZTsNCj4gPiA+ICsgICAgICAgICAgICAgdTMyICptYXNr
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICBhZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2
aWNlICopIGRldi0+a2dkOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICBtYXNrX3NpemUg
PSBhZGV2LT5kZGV2LT5kcm1jZ19wcm9wcy5sZ3B1X2NhcGFjaXR5Ow0KPiA+ID4gKyAgICAgICAg
ICAgICBtYXNrID0ga3phbGxvYyhzaXplb2YodTMyKSAqIHJvdW5kX3VwKG1hc2tfc2l6ZSwgMzIp
LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+ID4g
PiArDQo+ID4gPiArICAgICAgICAgICAgIGlmICghbWFzaykgew0KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGRybWNnX3B1dChkcm1jZyk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
dW5pbml0X3F1ZXVlKCpxKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsNCj4gPiA+ICsgICAgICAgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAg
ICBkZHIgPQ0KPiA+ID4gKyBkcm1jZy0+ZGV2X3Jlc291cmNlc1thZGV2LT5kZGV2LT5wcmltYXJ5
LT5pbmRleF07DQo+ID4gPiArDQo+ID4gPiArICAgICAgICAgICAgIGJpdG1hcF90b19hcnIzMiht
YXNrLCBkZHItPmxncHVfYWxsb2NhdGVkLCBtYXNrX3NpemUpOw0KPiA+ID4gKw0KPiA+ID4gKyAg
ICAgICAgICAgICAoKnEpLT5wcm9wZXJ0aWVzLmN1X21hc2tfY291bnQgPSBtYXNrX3NpemU7DQo+
ID4gPiArICAgICAgICAgICAgICgqcSktPnByb3BlcnRpZXMuY3VfbWFzayA9IG1hc2s7DQo+ID4g
PiArDQo+ID4gPiArICAgICAgICAgICAgIGRybWNnX3B1dChkcm1jZyk7DQo+ID4gPiArICAgICB9
DQo+ID4gPiArDQo+ID4gPiAgICAgICAoKnEpLT5kZXZpY2UgPSBkZXY7DQo+ID4gPiAgICAgICAo
KnEpLT5wcm9jZXNzID0gcHFtLT5wcm9jZXNzOw0KPiA+ID4NCj4gPiA+IEBAIC00OTUsNiArNTI4
LDExMyBAQCBpbnQgcHFtX2dldF93YXZlX3N0YXRlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFn
ZXIgKnBxbSwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2F2ZV9hcmVhX3VzZWRfc2l6ZSk7DQo+ID4gPiAgIH0NCj4gPiA+DQo+ID4g
PiArYm9vbCBwcW1fZHJtY2dfbGdwdV92YWxpZGF0ZShzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAsIGlu
dCBxaWQsIHUzMiAqY3VfbWFzaywNCj4gPiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgaW50IGN1
X21hc2tfc2l6ZSkgew0KPiA+ID4gKyAgICAgREVDTEFSRV9CSVRNQVAoY3Vycl9tYXNrLCBNQVhf
RFJNQ0dfTEdQVV9DQVBBQ0lUWSk7DQo+ID4gPiArICAgICBzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jl
c291cmNlICpkZHI7DQo+ID4gPiArICAgICBzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9ub2RlICpwcW47
DQo+ID4gPiArICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldjsNCj4gPiA+ICsgICAgIHN0
cnVjdCBkcm1jZyAqZHJtY2c7DQo+ID4gPiArICAgICBib29sIHJlc3VsdDsNCj4gPiA+ICsNCj4g
PiA+ICsgICAgIGlmIChjdV9tYXNrX3NpemUgPiBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSkNCj4g
PiA+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgYml0
bWFwX2Zyb21fYXJyMzIoY3Vycl9tYXNrLCBjdV9tYXNrLCBjdV9tYXNrX3NpemUpOw0KPiA+ID4g
Kw0KPiA+ID4gKyAgICAgcHFuID0gZ2V0X3F1ZXVlX2J5X3FpZCgmcC0+cHFtLCBxaWQpOw0KPiA+
ID4gKyAgICAgaWYgKCFwcW4pDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4g
PiA+ICsNCj4gPiA+ICsgICAgIGFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKilwcW4tPnEt
PmRldmljZS0+a2dkOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgZHJtY2cgPSBkcm1jZ19nZXQocC0+
bGVhZF90aHJlYWQpOw0KPiA+ID4gKyAgICAgZGRyID0gZHJtY2ctPmRldl9yZXNvdXJjZXNbYWRl
di0+ZGRldi0+cHJpbWFyeS0+aW5kZXhdOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgaWYgKGJpdG1h
cF9zdWJzZXQoY3Vycl9tYXNrLCBkZHItPmxncHVfYWxsb2NhdGVkLA0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTUFYX0RSTUNHX0xHUFVfQ0FQQUNJVFkpKQ0KPiA+ID4gKyAg
ICAgICAgICAgICByZXN1bHQgPSB0cnVlOw0KPiA+ID4gKyAgICAgZWxzZQ0KPiA+ID4gKyAgICAg
ICAgICAgICByZXN1bHQgPSBmYWxzZTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGRybWNnX3B1dChk
cm1jZyk7DQo+ID4gPiArDQo+ID4gPiArICAgICByZXR1cm4gcmVzdWx0Ow0KPiA+ID4gK30NCj4g
PiA+ICsNCj4gPiA+ICtpbnQgYW1kZ3B1X2FtZGtmZF91cGRhdGVfY3VfbWFza19mb3JfcHJvY2Vz
cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssDQo+ID4gPiArICAgICAgICAgICAgIHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBsb25nICpsZ3B1X2JtLA0KPiA+ID4gKyAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgbGdwdV9ibV9zaXplKSB7DQo+ID4gPiArICAgICBzdHJ1Y3Qg
a2ZkX2RldiAqa2RldiA9IGFkZXYtPmtmZC5kZXY7DQo+ID4gPiArICAgICBzdHJ1Y3QgcHJvY2Vz
c19xdWV1ZV9ub2RlICpwcW47DQo+ID4gPiArICAgICBzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKmtmZHBy
b2M7DQo+ID4gPiArICAgICBzaXplX3Qgc2l6ZV9pbl9ieXRlczsNCj4gPiA+ICsgICAgIHUzMiAq
Y3VfbWFzazsNCj4gPiA+ICsgICAgIGludCByYyA9IDA7DQo+ID4gPiArDQo+ID4gPiArICAgICBp
ZiAoKGxncHVfYm1fc2l6ZSAlIDMyKSAhPSAwKSB7DQo+ID4gPiArICAgICAgICAgICAgIHByX3dh
cm4oImxncHVfYm1fc2l6ZSAlZCBtdXN0IGJlIGEgbXVsdGlwbGUgb2YgMzIiLA0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbGdwdV9ibV9zaXplKTsNCj4gPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiArICAgICB9DQo+ID4gPiArDQo+ID4gPiArICAg
ICBrZmRwcm9jID0ga2ZkX2dldF9wcm9jZXNzKHRhc2spOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAg
aWYgKElTX0VSUihrZmRwcm9jKSkNCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FU1JDSDsN
Cj4gPiA+ICsNCj4gPiA+ICsgICAgIHNpemVfaW5fYnl0ZXMgPSBzaXplb2YodTMyKSAqIHJvdW5k
X3VwKGxncHVfYm1fc2l6ZSwgMzIpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgbXV0ZXhfbG9jaygm
a2ZkcHJvYy0+bXV0ZXgpOw0KPiA+ID4gKyAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShwcW4sICZr
ZmRwcm9jLT5wcW0ucXVldWVzLCBwcm9jZXNzX3F1ZXVlX2xpc3QpIHsNCj4gPiA+ICsgICAgICAg
ICAgICAgaWYgKHBxbi0+cSAmJiBwcW4tPnEtPmRldmljZSA9PSBrZGV2KSB7DQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgLyogdXBkYXRlIGN1X21hc2sgYWNjb3JkaW5nbHkgKi8NCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICBjdV9tYXNrID0ga3phbGxvYyhzaXplX2luX2J5dGVzLCBH
RlBfS0VSTkVMKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoIWN1X21hc2spIHsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJjID0gLUVOT01FTTsNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIH0NCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAocHFu
LT5xLT5wcm9wZXJ0aWVzLmN1X21hc2spIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIERFQ0xBUkVfQklUTUFQKGN1cnJfbWFzaywNCj4gPiA+ICsNCj4gPiA+ICsgTUFYX0RS
TUNHX0xHUFVfQ0FQQUNJVFkpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHBxbi0+cS0+cHJvcGVydGllcy5jdV9tYXNrX2NvdW50ID4NCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZ3B1X2JtX3NpemUp
IHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlO
VkFMOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZnJlZShj
dV9tYXNrKTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gPiArDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBiaXRtYXBfZnJvbV9hcnIzMihjdXJyX21h
c2ssDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHFuLT5xLT5wcm9wZXJ0aWVzLmN1X21hc2ssDQo+ID4gPiArDQo+ID4gPiArIHBxbi0+cS0+cHJv
cGVydGllcy5jdV9tYXNrX2NvdW50KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJpdG1hcF9hbmQoY3Vycl9tYXNrLCBjdXJyX21hc2ssIGxncHVfYm0sDQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGdwdV9i
bV9zaXplKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJp
dG1hcF90b19hcnIzMihjdV9tYXNrLCBjdXJyX21hc2ssDQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGdwdV9ibV9zaXplKTsNCj4gPiA+ICsNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKGN1cnJfbWFzayk7DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgfSBlbHNlDQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBiaXRtYXBfdG9fYXJyMzIoY3VfbWFzaywgbGdwdV9ibSwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZ3B1X2JtX3NpemUpOw0K
PiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBxbi0+cS0+cHJvcGVydGllcy5j
dV9tYXNrID0gY3VfbWFzazsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcW4tPnEtPnBy
b3BlcnRpZXMuY3VfbWFza19jb3VudCA9DQo+ID4gPiArIGxncHVfYm1fc2l6ZTsNCj4gPiA+ICsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByYyA9IHBxbi0+cS0+ZGV2aWNlLT5kcW0tPm9w
cy51cGRhdGVfcXVldWUoDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBxbi0+cS0+ZGV2aWNlLT5kcW0sIHBxbi0+cSk7DQo+ID4gPiArICAgICAgICAgICAgIH0N
Cj4gPiA+ICsgICAgIH0NCj4gPiA+ICsgICAgIG11dGV4X3VubG9jaygma2ZkcHJvYy0+bXV0ZXgp
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcmV0dXJuIHJjOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4g
PiA+ICAgI2lmIGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTKQ0KPiA+ID4NCj4gPiA+ICAgaW50IHBx
bV9kZWJ1Z2ZzX21xZHMoc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
