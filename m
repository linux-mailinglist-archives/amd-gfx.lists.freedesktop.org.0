Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E24241740
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Aug 2020 09:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C676E14D;
	Tue, 11 Aug 2020 07:36:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309EF6E14D
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 07:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avcy4Os/2w14FSYXDzKQe4upwSAvJ64G/dw1lV24Q+iz4+jTzxai81CEkHAXz+eTAJnZoXKVayZ8RsR77elmfSe382P+n4GRpPIaxPSHvTzG6QdjzZXWxqWnZw9yNF3fVtfcbXZDUMVzUEN+KEvlgx6pTexdyzKT/OAhgtos7shkkvSOYSerPYmI1jh//vSA4Jh91Pv9Oh1hDlZpvJfw7Ix218kIxmFcKkI0Xc3VIqmapwDKtN5xm9yjDk+igflO0YONF3S3+iGjcMny6/EGBPzSeo2YwqHgdQ5ZGiE6OAIR8ZbNS4L8EOiFN9Lwa1gzcHtjYhff8m8bFd9jJCI9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCZMKNYtB2wyGYcDEEws+Yz2B2az00MFzVDTgjnWaE=;
 b=G1GnnQcq2l13uuakt9WXZdjMFHNNIOvhM1jvF7DsraXChrJRgd4tUyu53/4ICtYROZXeHkUjPa/RyueLnZmZb0dbo3YBa1EWAYlVXr72qiWqocAB1bAiY3g0nRTkq0irqBa57zKCqmmV2/Vayx5lmxK6RQJDxueBkdNxBlenMz82oMOH9CEfTzHr/yEpImfaE5o3oaDDU69XymrVnGqiqAutX/5wVzDWL8MUo7bboQgMnqq2bgwdemSMdzMDJLobt/VrpVZsPH5rFaQuoJBhAW+SB9mDpqXQZ6BtE0RUm5mmcMIXXR+Oqa9+cw0xXmq/UKn0Z+SGC1jBosokFSePXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCZMKNYtB2wyGYcDEEws+Yz2B2az00MFzVDTgjnWaE=;
 b=HW99YZS06o2rajz4cnTbgf3RkTs/QuyVtO/sfBe7SQ/fnfTfOJWwjLXHwvg9Sa+64cqDsHeEPs1VrrRdE3QbgWPs8ePbB402ZGDVDFV97WYeTbGHObzkTkH7Tjmft5ixS1IX+WEbygXPM++JwNuJavOgXPTlL23yQko7/Q+1wFU=
Received: from CY4PR12MB1287.namprd12.prod.outlook.com (2603:10b6:903:40::8)
 by CY4PR12MB1349.namprd12.prod.outlook.com (2603:10b6:903:40::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.21; Tue, 11 Aug
 2020 07:36:32 +0000
Received: from CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e181:b736:5067:12f2]) by CY4PR12MB1287.namprd12.prod.outlook.com
 ([fe80::e181:b736:5067:12f2%9]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 07:36:32 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Li, Dennis"
 <Dennis.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH v3] drm/amdgpu: annotate a false positive recursive locking
Thread-Topic: [PATCH v3] drm/amdgpu: annotate a false positive recursive
 locking
Thread-Index: AQHWb4TqT5uDJoY5eUq72OyzLi6B/qkyeRIAgAAKwoA=
Date: Tue, 11 Aug 2020 07:36:32 +0000
Message-ID: <CY4PR12MB128703F619AEC3E1F718CCDEF1450@CY4PR12MB1287.namprd12.prod.outlook.com>
References: <20200811021224.3688-1-Dennis.Li@amd.com>
 <fbb65b04-ff33-53dc-89ce-ddaed51185af@amd.com>
In-Reply-To: <fbb65b04-ff33-53dc-89ce-ddaed51185af@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-08-11T07:31:33Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=e1e5c486-0774-49c4-be96-00000b7dc835;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-08-11T07:36:30Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 7a5d1fd2-d5ab-4bce-84a7-0000e766ade7
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a71180b0-31c9-43f6-0ad2-08d83dc944df
x-ms-traffictypediagnostic: CY4PR12MB1349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB1349A30772A3BE722C5B810CF1450@CY4PR12MB1349.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q6iWTFWXCiukmicFPBfplaN4r0pOHfihrewRCju9YoGCuevol2mYgI6OZ3iypfi+nIUP0iGeqA4Nzbmqi/1TS1Q4CryVqhYHpk5n841Abo/hzKZtQe7VTvoHX89jdxuIr2CeewIYPJjrl+CLKbNGAZu23PdRhiS1S0i+/xUyff41krbri0pT2I1jUTfdxWW2uubGLbi080lPenaTPKs/MRF4jFG04QC7NgHPwsVVBIHvyikvcsYbMOuu7cOG5RXzKsuKvBdmpsaj1D99vxGKyNLK5YajGMqwKuAhA0bO1MoIg2JNunKmlcE448F5Q0Og1ZdeDopdJEUl5ooGYDdDjTbwhCn2r1ToSjZ8fX6KAFUdNmRQo+KrnQOeJui9JEfeprEnPzHVsEySeUZmf1qpng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1287.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(7696005)(966005)(66476007)(64756008)(66556008)(52536014)(5660300002)(6506007)(53546011)(66446008)(9686003)(71200400001)(66946007)(26005)(76116006)(186003)(33656002)(316002)(45080400002)(478600001)(110136005)(66574015)(8936002)(86362001)(2906002)(83380400001)(8676002)(55016002)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6mltj1aEzKqnUqCkiA9c4Pbz+ghMofrASFeILEjDhrOQmhUbxEdewuFpm+6H2YNMdxWpNXRRNBb/tJvFGpa14ENGmyidO6IhXt8vb3y/Unq9Gpl75P9KTmGilpQpSAgqlOSQjUeSbhGS6mbZkJSRzhJwOa4zg8hvZtXJ0xnhog4Kk4UGWzaPB4ZRt3MEX8KEBa6RJ1oSFb5jPH2sgYy3Y/rpOrcjLGZwXZI+1uPZUIFuWDCyxBibe4EWqzmBoxW93FeFetvqbnnaMU13FDqlZyIaZV5Bp3S8vbf2DGy86pL7vgYykeF1/mbnxJp9RYFQhV4TASGx1TMzAuGU+X52L1BZHWd75vbqwkIoXVtyZSvAZW9SGGMwDY89aJ2OXmKwDmYAmAX8Qm5Qu3orXE8B/VsJwdL6xt8bDkcUVmA9Rp9M4C2TDLaMLq4pmkV9GJJqKd9Z1D2eGCBRExrATP+g5JiIW6vy1GZflmdEyxh405kqzGL0s49He/9smReyRUSd8ljjQbxIALWZ/PbN6xrf1S1wAjYmbikkvBwp6EwqgRxIJCwFjFYyEefuSAQ/8Vl/rjShbpG19ZrZOghZwtGwgi75a8AVEpMGaibGwZ4iR2v3rkDhEdAu81Mz5NqPnQaPvNp9VUy7kB/0lzXJ3OZYdg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1287.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71180b0-31c9-43f6-0ad2-08d83dc944df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 07:36:32.5304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zIQD8iVN46eLW934N51rnyZpYD2YyZxNwt8msacMVI3yqXuUAIGhVieopFCPJCoXGri+ueq4m+seepaud73dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1349
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

W0FNRCBQdWJsaWMgVXNlXQ0KDQo+IC0JZG93bl93cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsNCj4g
KwlpZiAoaGl2ZSkgew0KPiArCQlkb3duX3dyaXRlX25lc3RfbG9jaygmYWRldi0+cmVzZXRfc2Vt
LCAmaGl2ZS0+aGl2ZV9sb2NrKTsNCj4gKwl9IGVsc2UNCj4gKwkJZG93bl93cml0ZSgmYWRldi0+
cmVzZXRfc2VtKTsNCg0KQ29kaW5nIHN0eWxlIG5pdCBwaWNrOiBZb3Ugc2hvdWxkIGRyb3AgdGhl
IHt9IGhlcmUuDQoNCnt9IGNvdWxkIG5vdCBiZSBkcm9wcGVkIGhlcmUsIGFzIGRvd25fd3JpdGVf
bmVzdF9sb2NrIElzIG9uZSBtYWNybyB3aXRoIG11bHRpcGxlIGxpbmVzLCBvdGhlcndpc2UsIGJ1
aWxkIGVycm9yIHdvdWxkIHNheSAnZWxzZScgbWlzc2VkIG9uZSBwcmV2aW91cyAnaWYnLg0KSW5z
dGVhZCBvZiBkcm9wcGluZywgYW5vdGhlciB7fSBzaG91bGQgYmUgYWRkZWQgdG8gZWxzZSB0byBp
bmNsdWRlIGRvd25fd3JpdGUoJmFkZXYtPnJlc2V0X3NlbSksIHdoaWNoIG1ha2VzIHRoZSBicmFj
ZXMgYmVlbiBiYWxhbmNlZC4NCg0KUmVnYXJkcywNCkd1Y2h1bg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mIENocmlzdGlhbiBLw7ZuaWcNClNlbnQ6IFR1ZXNkYXksIEF1
Z3VzdCAxMSwgMjAyMCAyOjUzIFBNDQpUbzogTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGRhbmllbEBm
ZndsbC5jaA0KU3ViamVjdDogUmU6IFtQQVRDSCB2M10gZHJtL2FtZGdwdTogYW5ub3RhdGUgYSBm
YWxzZSBwb3NpdGl2ZSByZWN1cnNpdmUgbG9ja2luZw0KDQpBbSAxMS4wOC4yMCB1bSAwNDoxMiBz
Y2hyaWViIERlbm5pcyBMaToNCj4gWyAgNTg0LjExMDMwNF0gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCj4gWyAgNTg0LjExMDU5MF0gV0FSTklORzogcG9zc2li
bGUgcmVjdXJzaXZlIGxvY2tpbmcgZGV0ZWN0ZWQNCj4gWyAgNTg0LjExMDg3Nl0gNS42LjAtZGVs
aS12NS42LTI4NDgtZzNmMzEwOWIwZTc1ZiAjMSBUYWludGVkOiBHICAgICAgICAgICBPRQ0KPiBb
ICA1ODQuMTExMTY0XSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiBbICA1ODQuMTExNDU2XSBrd29ya2VyLzM4OjEvNTUzIGlzIHRyeWluZyB0byBhY3F1aXJl
IGxvY2s6DQo+IFsgIDU4NC4xMTE3MjFdIGZmZmY5YjE1ZmYwYTQ3YTAgKCZhZGV2LT5yZXNldF9z
ZW0peysrKyt9LCBhdDogDQo+IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIrMHgyNjIvMHgxMDMw
IFthbWRncHVdIFsgIDU4NC4xMTIxMTJdDQo+ICAgICAgICAgICAgICAgICBidXQgdGFzayBpcyBh
bHJlYWR5IGhvbGRpbmcgbG9jazoNCj4gWyAgNTg0LjExMjY3M10gZmZmZjliMTYwM2QyNDdhMCAo
JmFkZXYtPnJlc2V0X3NlbSl7KysrK30sIGF0OiANCj4gYW1kZ3B1X2RldmljZV9ncHVfcmVjb3Zl
cisweDI2Mi8weDEwMzAgW2FtZGdwdV0gWyAgNTg0LjExMzA2OF0NCj4gICAgICAgICAgICAgICAg
IG90aGVyIGluZm8gdGhhdCBtaWdodCBoZWxwIHVzIGRlYnVnIHRoaXM6DQo+IFsgIDU4NC4xMTM2
ODldICBQb3NzaWJsZSB1bnNhZmUgbG9ja2luZyBzY2VuYXJpbzoNCj4NCj4gWyAgNTg0LjExNDM1
MF0gICAgICAgIENQVTANCj4gWyAgNTg0LjExNDY4NV0gICAgICAgIC0tLS0NCj4gWyAgNTg0LjEx
NTAxNF0gICBsb2NrKCZhZGV2LT5yZXNldF9zZW0pOw0KPiBbICA1ODQuMTE1MzQ5XSAgIGxvY2so
JmFkZXYtPnJlc2V0X3NlbSk7DQo+IFsgIDU4NC4xMTU2NzhdDQo+ICAgICAgICAgICAgICAgICAg
KioqIERFQURMT0NLICoqKg0KPg0KPiBbICA1ODQuMTE2NjI0XSAgTWF5IGJlIGR1ZSB0byBtaXNz
aW5nIGxvY2sgbmVzdGluZyBub3RhdGlvbg0KPg0KPiBbICA1ODQuMTE3Mjg0XSA0IGxvY2tzIGhl
bGQgYnkga3dvcmtlci8zODoxLzU1MzoNCj4gWyAgNTg0LjExNzYxNl0gICMwOiBmZmZmOWFkNjM1
YzFkMzQ4ICgod3FfY29tcGxldGlvbilldmVudHMpeysuKy59LCANCj4gYXQ6IHByb2Nlc3Nfb25l
X3dvcmsrMHgyMWYvMHg2MzAgWyAgNTg0LjExNzk2N10gICMxOiBmZmZmYWM3MDhlMWMzZTU4IA0K
PiAoKHdvcmtfY29tcGxldGlvbikoJmNvbi0+cmVjb3Zlcnlfd29yaykpeysuKy59LCBhdDogDQo+
IHByb2Nlc3Nfb25lX3dvcmsrMHgyMWYvMHg2MzAgWyAgNTg0LjExODM1OF0gICMyOiBmZmZmZmZm
ZmMxYzJhNWQwIA0KPiAoJnRtcC0+aGl2ZV9sb2NrKXsrLisufSwgYXQ6IGFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIrMHhhZS8weDEwMzAgW2FtZGdwdV0gWyAgNTg0LjExODc4Nl0gICMzOiBmZmZm
OWIxNjAzZDI0N2EwICgmYWRldi0+cmVzZXRfc2VtKXsrKysrfSwgYXQ6IGFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVdIFsgIDU4NC4xMTkyMjJdDQo+ICAgICAg
ICAgICAgICAgICBzdGFjayBiYWNrdHJhY2U6DQo+IFsgIDU4NC4xMTk5OTBdIENQVTogMzggUElE
OiA1NTMgQ29tbToga3dvcmtlci8zODoxIEtkdW1wOiBsb2FkZWQgVGFpbnRlZDogRyAgICAgICAg
ICAgT0UgICAgIDUuNi4wLWRlbGktdjUuNi0yODQ4LWczZjMxMDliMGU3NWYgIzENCj4gWyAgNTg0
LjEyMDc4Ml0gSGFyZHdhcmUgbmFtZTogU3VwZXJtaWNybyBTWVMtNzA0OUdQLVRSVC9YMTFEUEct
UVQsIA0KPiBCSU9TIDMuMSAwNS8yMy8yMDE5IFsgIDU4NC4xMjEyMjNdIFdvcmtxdWV1ZTogZXZl
bnRzIA0KPiBhbWRncHVfcmFzX2RvX3JlY292ZXJ5IFthbWRncHVdIFsgIDU4NC4xMjE2MzhdIENh
bGwgVHJhY2U6DQo+IFsgIDU4NC4xMjIwNTBdICBkdW1wX3N0YWNrKzB4OTgvMHhkNQ0KPiBbICA1
ODQuMTIyNDk5XSAgX19sb2NrX2FjcXVpcmUrMHgxMTM5LzB4MTZlMCBbICA1ODQuMTIyOTMxXSAg
PyANCj4gdHJhY2VfaGFyZGlycXNfb24rMHgzYi8weGYwIFsgIDU4NC4xMjMzNThdICA/IA0KPiBj
YW5jZWxfZGVsYXllZF93b3JrKzB4YTYvMHhjMCBbICA1ODQuMTIzNzcxXSAgbG9ja19hY3F1aXJl
KzB4YjgvMHgxYzAgDQo+IFsgIDU4NC4xMjQxOTddICA/IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292
ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVdIFsgIA0KPiA1ODQuMTI0NTk5XSAgZG93bl93cml0ZSsw
eDQ5LzB4MTIwIFsgIDU4NC4xMjUwMzJdICA/IA0KPiBhbWRncHVfZGV2aWNlX2dwdV9yZWNvdmVy
KzB4MjYyLzB4MTAzMCBbYW1kZ3B1XSBbICA1ODQuMTI1NDcyXSAgDQo+IGFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVdIFsgIDU4NC4xMjU5MTBdICA/IA0KPiBh
bWRncHVfcmFzX2Vycm9yX3F1ZXJ5KzB4MWI4LzB4MmEwIFthbWRncHVdIFsgIDU4NC4xMjYzNjdd
ICANCj4gYW1kZ3B1X3Jhc19kb19yZWNvdmVyeSsweDE1OS8weDE5MCBbYW1kZ3B1XSBbICA1ODQu
MTI2Nzg5XSAgDQo+IHByb2Nlc3Nfb25lX3dvcmsrMHgyOWUvMHg2MzAgWyAgNTg0LjEyNzIwOF0g
IHdvcmtlcl90aHJlYWQrMHgzYy8weDNmMCANCj4gWyAgNTg0LjEyNzYyMV0gID8gX19rdGhyZWFk
X3BhcmttZSsweDYxLzB4OTAgWyAgNTg0LjEyODAxNF0gIA0KPiBrdGhyZWFkKzB4MTJmLzB4MTUw
IFsgIDU4NC4xMjg0MDJdICA/IHByb2Nlc3Nfb25lX3dvcmsrMHg2MzAvMHg2MzAgWyAgDQo+IDU4
NC4xMjg3OTBdICA/IGt0aHJlYWRfcGFyaysweDkwLzB4OTAgWyAgNTg0LjEyOTE3NF0gIA0KPiBy
ZXRfZnJvbV9mb3JrKzB4M2EvMHg1MA0KPg0KPiBFYWNoIGFkZXYgaGFzIG93bmVkIGxvY2tfY2xh
c3Nfa2V5IHRvIGF2b2lkIGZhbHNlIHBvc2l0aXZlIHJlY3Vyc2l2ZSANCj4gbG9ja2luZy4NCj4N
Cj4gdjI6DQo+IDEuIHJlZ2lzdGVyIGFkZXYtPmxvY2tfa2V5IGludG8gbG9ja2RlcCwgb3RoZXJ3
aXNlIGxvY2tkZXAgd2lsbCByZXBvcnQgDQo+IHRoZSBiZWxvdyB3YXJuaW5nDQo+DQo+IFsgMTIx
Ni43MDU4MjBdIEJVRzoga2V5IGZmZmY4OTAxODNiNjQ3ZDAgaGFzIG5vdCBiZWVuIHJlZ2lzdGVy
ZWQhDQo+IFsgMTIxNi43MDU5MjRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LSBbIDEyMTYuNzA1OTcyXSANCj4gREVCVUdfTE9DS1NfV0FSTl9PTigxKSBbIDEyMTYuNzA1OTk3
XSBXQVJOSU5HOiBDUFU6IDIwIFBJRDogNTQxIGF0IA0KPiBrZXJuZWwvbG9ja2luZy9sb2NrZGVw
LmM6Mzc0MyBsb2NrZGVwX2luaXRfbWFwKzB4MTUwLzB4MjEwDQo+DQo+IHYzOg0KPiBjaGFuZ2Ug
dG8gdXNlIGRvd25fd3JpdGVfbmVzdF9sb2NrIHRvIGFubm90YXRlIHRoZSBmYWxzZSBkZWFkLWxv
Y2sgDQo+IHdhcm5pbmcuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERlbm5pcyBMaSA8RGVubmlzLkxp
QGFtZC5jb20+DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jDQo+IGluZGV4IDYyZWNhYzk3ZmJkMi4uOGE1NWIwYmMwNDRhIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+IEBAIC00MTQ1LDEyICs0
MTQ1LDE1IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RvX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9o
aXZlX2luZm8gKmhpdmUsDQo+ICAgCXJldHVybiByOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBi
b29sIGFtZGdwdV9kZXZpY2VfbG9ja19hZGV2KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiArc3RhdGljIGJvb2wgYW1kZ3B1X2RldmljZV9sb2NrX2FkZXYoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIA0KPiArc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUpDQo+ICAgew0KPiAg
IAlpZiAoYXRvbWljX2NtcHhjaGcoJmFkZXYtPmluX2dwdV9yZXNldCwgMCwgMSkgIT0gMCkNCj4g
ICAJCXJldHVybiBmYWxzZTsNCj4gICANCj4gLQlkb3duX3dyaXRlKCZhZGV2LT5yZXNldF9zZW0p
Ow0KPiArCWlmIChoaXZlKSB7DQo+ICsJCWRvd25fd3JpdGVfbmVzdF9sb2NrKCZhZGV2LT5yZXNl
dF9zZW0sICZoaXZlLT5oaXZlX2xvY2spOw0KPiArCX0gZWxzZQ0KPiArCQlkb3duX3dyaXRlKCZh
ZGV2LT5yZXNldF9zZW0pOw0KDQpDb2Rpbmcgc3R5bGUgbml0IHBpY2s6IFlvdSBzaG91bGQgZHJv
cCB0aGUge30gaGVyZS4NCg0KQXBhcnQgZnJvbSB0aGF0IHRoZSBwYXRjaCBpcyBSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+ICAgDQo+
ICAgCWF0b21pY19pbmMoJmFkZXYtPmdwdV9yZXNldF9jb3VudGVyKTsNCj4gICAJc3dpdGNoIChh
bWRncHVfYXNpY19yZXNldF9tZXRob2QoYWRldikpIHsgQEAgLTQzMTIsNyArNDMxNSw3IEBAIGlu
dCANCj4gYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gICANCj4gICAJLyogYmxvY2sgYWxsIHNjaGVkdWxlcnMgYW5kIHJlc2V0IGdpdmVuIGpv
YidzIHJpbmcgKi8NCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeSh0bXBfYWRldiwgZGV2aWNlX2xp
c3RfaGFuZGxlLCBnbWMueGdtaS5oZWFkKSB7DQo+IC0JCWlmICghYW1kZ3B1X2RldmljZV9sb2Nr
X2FkZXYodG1wX2FkZXYpKSB7DQo+ICsJCWlmICghYW1kZ3B1X2RldmljZV9sb2NrX2FkZXYodG1w
X2FkZXYsIGhpdmUpKSB7DQo+ICAgCQkJRFJNX0lORk8oIkJhaWxpbmcgb24gVERSIGZvciBzX2pv
YjolbGx4LCBhcyBhbm90aGVyIGFscmVhZHkgaW4gcHJvZ3Jlc3MiLA0KPiAgIAkJCQkgIGpvYiA/
IGpvYi0+YmFzZS5pZCA6IC0xKTsNCj4gICAJCQlyID0gMDsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
JTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDZ3VjaHVu
LmNoZW4lNDBhbWQuY29tJTdDMGEzZmQwNmMwZTc3NDAwMmEwZTkwOGQ4M2RjMzM3YTAlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MzI3MjU1OTUyMDY1NTEw
JmFtcDtzZGF0YT1ySiUyQmJXc1dKNk5mUFVpbndVSHhuUmZWeFlpJTJGdDRKUUNUdGFtTUFUckx3
cyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4Cg==
