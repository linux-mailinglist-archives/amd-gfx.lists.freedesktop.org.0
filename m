Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F844A996
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Nov 2021 09:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55F6E8BE;
	Tue,  9 Nov 2021 08:45:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4506E8BE
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Nov 2021 08:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7nDTwsEbCrm7m3Ivkknbnf7DkFDeU7JM86kE3DvFoHWFySF+NO/lWy4uD/I0RYmiRGj+shRa1t0gDGY4lKc6HBDtSDF3uaqYot7Uhpt/CDGl0iechbX6hz804ZK+mIjjDTqP9hHakWbMLkgBWbpUCdtqHtjTDqizKzrRA82Z1KWxB+Br+oqBzQYnkp3UkNDE3cUKrA1Hsv4/mzQbQJCIqfyuerU2bo6HsKzJDsUx7BNphYpBOIsK5S2D2TS1v0Qs2wCq3txiNFCxxYu78QRB4MOkUTM+GQT7GkZ73ZBEJ5jJxwcwY1LbDtLrrMzvKbsJQ5J4Z+hJs9P47o+5Y5z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBeN4622DUqh5VaoeqXCWlOjhIrJeZi3sxOR/O14IS0=;
 b=IsFMxvrzSKdRXK9A18QxOGo6bTCwVE4nD8+nLqwlp1kf5tvWxmKwE0DftgvqYjikLHBhXg2R4MaDYqLlA8GPRXOQrFJ1dbjgKh87/vqAU4SOtXLA8iOznhmG2/NcQPlUaYZE38AqR/su6XBP6mgWXlGEvPMd0QLiO7+l0MTuzLCH7j2pKEZQZ/VAmjfT+/Ix6SrZhsFvL9hMddhi2Mhjsq60GZR7cweUNFsp1gX/I3WvG01fXy+711KRaKgp24y5OJhYG2tcmk0M5ahoTTZNbolIc/FNR/0Tv36ND0Ey7pNA8NHQinXZruJo285jD34NdcpdIWIDsqPo0H0uaw2OrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBeN4622DUqh5VaoeqXCWlOjhIrJeZi3sxOR/O14IS0=;
 b=pxhJc9v4MFrvtpBg0ZdJARs8KZwbYEK+7ODGhFd6lZ0aACkAVPOIXdFcOiIRISem7Z+ZcTLfpw7j+SW5uTN0Wc2lBHxYdqjiVGHVhS9m7EneNbfiN6OgATiw6jE/mH+Ff4K0tm+P0prsew5T4WwwM9urNBGksmefZ6ojcM8WAwk=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB1257.namprd12.prod.outlook.com (2603:10b6:3:74::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13; Tue, 9 Nov 2021 08:45:03 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::15d0:4c36:2886:bbef]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::15d0:4c36:2886:bbef%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 08:45:03 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/pm: avoid duplicate powergate/ungate setting
Thread-Topic: [PATCH] drm/amd/pm: avoid duplicate powergate/ungate setting
Thread-Index: AQHX1FvEu+OweiWVMEOG0w2/0y3AtKv5e0oAgAEQPBCAAAyUgIAASLwQ
Date: Tue, 9 Nov 2021 08:45:02 +0000
Message-ID: <DM6PR12MB261902AEC570A67EE98FE516E4929@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20211108044723.54716-1-evan.quan@amd.com>
 <80a7b1d5-f57c-ef32-bd90-9e31554127e2@amd.com>
 <DM6PR12MB26198F33A0A6BC4C760ACD7AE4929@DM6PR12MB2619.namprd12.prod.outlook.com>
 <87848118-a230-1941-f97d-384158dc95d6@amd.com>
In-Reply-To: <87848118-a230-1941-f97d-384158dc95d6@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-09T08:44:55Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=cc54e71c-eac0-4512-826d-cced8e9f2d32;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ada788e-e3c1-4d28-fe83-08d9a35d38de
x-ms-traffictypediagnostic: DM5PR12MB1257:
x-microsoft-antispam-prvs: <DM5PR12MB1257112C4C28ED81C140257DE4929@DM5PR12MB1257.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zD9LN845tLD60XgzOekU8Ox4fvOdrUEH+wOXsYbi73UcTO+XkxzNoNuivWZogLzFTM+/J6O2TNp1DTrhiimnsMx6MlcDaFxxtY0RS6QZ3r9HxSEN/0gCubU6Lq5p7BpLhqzGDxMKUABVJ1jvQcEfHBinxMXd1Rlyb4J8rX+vYXPW4dl/Ik/UZgy9meEg8EU5DH0WIZnJYyrhEfCoX6b7WZesD4jXJUvKP1zyg9FQ+SMyMaPJmOdQaIdx0YGhzQ/xuWYb4NjRUMsBnTNWrnNFF0zmDtuUywctLmV/F3HHsdORfSZT0EYZDKnkMLWqtnfOp/45RGsE/W/hcoldMHrAFkKNH81xRIJB91C1aLuENdxGTy4YBKoxPLRaxEXGQhmyT3f05M+bKp36R6lKLWBzFa3mg3ldqRUBRnEyPzynd6DfuX8jvQpmnmtI8Fy0S5BhHwlMy8kVWGtr0z9bfhRCPkaTSJgvWpEX86ilX495zvqETa2sf2QhXZh9BVevnq1sNISYsKSDFcy27ISQU/i8KItM2PzdpZN63fgsnkhkF0NDfrg0bP+Y7QCpeHqfMwl5gpCs/OO3WIXJ+4alXbuKjo5m9v5Rlhuyx/x5MveHt2jCb38TWo6B2EkCdtr/Pxkw2/PlaTuLjD863cuhCxMONVMY3gKTPlsRCm3khqGLbfD3T4cTPL7J7Asd5uld8lcYvykvlqZhoFCr0DL35aD1xhlKxTSiBbDgTJhUh4jOOEw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(4326008)(54906003)(2906002)(110136005)(86362001)(71200400001)(5660300002)(508600001)(9686003)(7696005)(55016002)(122000001)(52536014)(66476007)(26005)(64756008)(76116006)(38100700002)(53546011)(186003)(6506007)(33656002)(8936002)(66556008)(66446008)(8676002)(66946007)(38070700005)(83380400001)(309714004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXdtcHJaVXMyTndneHhuQU1ZUFlhSWprWWgxOHhsbHB5OFJpdFN3MjArdTRh?=
 =?utf-8?B?YVRpRTFyNTVMem9NRlR5TTlDdzB2cHphMzFXZXIzOWtwaUtOVjBYTGRKVVp0?=
 =?utf-8?B?ZUF0eTFMUEhXL2NBdEQwMHRQNUZnRGVOQkd4LzRYQXJYTDE2ZHRnSDdSTW91?=
 =?utf-8?B?emltZW1nZWQ2b3NhY0lFMFJqNk1WbHVJczJ5dmQyd2hHQk9mNW5lY0UweUdw?=
 =?utf-8?B?enE0dU9UOFhOMllyaDNQeFUzTzNHQi9KOVJUbHIydVlMeGhlVTJXcUl1U01W?=
 =?utf-8?B?aVk1NFBpeXhjYzM5ejZPYTM2UUFQNXgxRkl6Snc0SmZUNyszRmxwZkRSM1dB?=
 =?utf-8?B?WVhmaHcxd1g0S1h4eVB6WHlkT2ZZeEFPWDE1YmtJRzR0SVlIazQ4TWhNcll4?=
 =?utf-8?B?N1Vzayt1bjcxTmtqaTdUWHphRHUxb2Y1b200ZFVqTUNvVHVGcGJKZk8wVGc1?=
 =?utf-8?B?b3pYalFPeTJDV3NoSHhDNmFodU1PeU9Dd0NGOWYrNW1BMjIrb0M0eXltYmt3?=
 =?utf-8?B?cjhOcEd4RXZuY1hJWlRQei85ZmR2UmFaaytVTVIzaUdEQzZlYjNtbk9aMHF2?=
 =?utf-8?B?czNRcVd2bFlzbmt2cjFYWHBHQWxZRlRwenIzY2lKb2MxUnBKTk5NSXkzNmhS?=
 =?utf-8?B?VEpvZzJveWxWbzkzNkhKQTFlM2dmUmQ5SWdTVU9MRTlSbkFVV1Z4QXNOVG5B?=
 =?utf-8?B?TGFVVzc3SXlxc1pvNk91OUFmZTI5NDJRcm0wOU9tN1MrMCtuS2ZMN1VLTlZm?=
 =?utf-8?B?KzQ5dzJqY29TcVRUZ3JMSzhCc3NvY1Rud3I0dlFmcHJRWWwrRHc3UzdWYkZ0?=
 =?utf-8?B?MWgxdTNBbm1LNmlpOG93TEg4VFhWL3BaZG00bEc5Y1pBdkZMaW42ZjJFQnd0?=
 =?utf-8?B?bFFSYVZJYzh6QmY1WFo5UENEWlJ6U2pLbjZydkY5TjB3emlxRnprUWJ1UEt0?=
 =?utf-8?B?ekp3aGE1c0hSS084bW1RYXhZMktXRTMrU2Zpd1o0dzBqTnROOEdjdlIyd2hL?=
 =?utf-8?B?UzZ6YTdhMEdrZWRiTHE3T0tia3B6Q3Y4eTZOaEVtME1pczBtNDdsRW82YXha?=
 =?utf-8?B?MFR1YXprZ09VdExhVTRra2VCMEk0Z085bERZNFJFOFM3VmM4SFJ3SmVwSkxE?=
 =?utf-8?B?ZElxTUhhTDZNUHdNQTlqVFdwSm5LekEwc1EvVUE2WG1FbUtjMWkvQ2tQMEtW?=
 =?utf-8?B?eSttaGlNdXhvZUtKSDcrblR6dzkrZEpyZTdMcFJPMXBKR0gzV2xITCtHRVFj?=
 =?utf-8?B?MXI1QTg0WGhTMFU0azF2Y3VPbDZMeXFDd085ZFhVVW1DeWJ2ZHFlNWt4WHRU?=
 =?utf-8?B?OUdhWFZMN3ZlejJuYk54cHFQZWd0di8zTHJtWkFmWjJ6UVVzM3lZSFZMWGg2?=
 =?utf-8?B?dWZwa1FTYVl1RlQ4YVVVai9XckZYbU11RHYzUGhhU1BQZk14ZUNncENDRGtW?=
 =?utf-8?B?eDdBZm1uMlBGL3hySTBMUGlpZTVROFJZSTgyUVFDTHpadG1qMUlqVjcyM3g1?=
 =?utf-8?B?dmQybFk1ZUN0SjFITXhnaVBnbDNTWkVoUkFNQVJpSDc5RGcwdDRQQmltczFm?=
 =?utf-8?B?MkpwZ1pVSjNNc0ZjcHZnY2lDK1VjUGJ6ZXBFZlZRYVpaODM4ZklPY1N1cVZ1?=
 =?utf-8?B?Yi91MjRuNlA5YTkvTGNocUN1R29IWHJWdUhEMnY1eEYweDJ3K2l6M2pGQUJJ?=
 =?utf-8?B?SmdNVlNZNVA0MGJXUlU0M1RFZERHWFN1MExDY3V6VWtUUVU1Sng3NlE1NE0r?=
 =?utf-8?B?OTY5aWY4STNEOGZFcURkRFZEVFE0YnVVLysxQ29OVWNWNVJzWmtiZk1NeWtR?=
 =?utf-8?B?QllycnZUOGhncUNFT09EcWpJYjFjVEFVcWF4MUExSDZ3TnhmejgyK2s5aEdr?=
 =?utf-8?B?U1RMR25NN3lLWlpJTHErejl2MDVlSmNBQSttb3p3Tm5XSEV4a3JmOVZqSzJM?=
 =?utf-8?B?c2xtMEtlemZXeGN6aWJnZ2IxK2cxYUllVTRDUStYQ09mYk5jQXMyMmRRYnlu?=
 =?utf-8?B?SCtIVlc4RGtWMmd0TFByQTBoZEtsQ1VKWFd6VEdVYU5MSTdXOHdrMWpoNHlq?=
 =?utf-8?B?Nks3RnduUlpwZm56MXlaU09LNUJlV0NOb3I4a2U1eEc2bDN4MEdnQmJubmxD?=
 =?utf-8?Q?jM1U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ada788e-e3c1-4d28-fe83-08d9a35d38de
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 08:45:02.9650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnuSZDzOrmqSJ+w1SIedUbzJESAR1Nu4OtPKMi5TBNJRgMWWHF/jHn3mzaNnf2SQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1257
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Borislav Petkov <bp@suse.de>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgTm92ZW1iZXIgOSwgMjAyMSAxMjoxNSBQTQ0KPiBUbzogUXVhbiwgRXZhbiA8RXZhbi5R
dWFuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hl
ciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgQm9yaXNsYXYgUGV0a292
DQo+IDxicEBzdXNlLmRlPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kL3BtOiBhdm9p
ZCBkdXBsaWNhdGUgcG93ZXJnYXRlL3VuZ2F0ZQ0KPiBzZXR0aW5nDQo+IA0KPiANCj4gDQo+IE9u
IDExLzkvMjAyMSA5OjEwIEFNLCBRdWFuLCBFdmFuIHdyb3RlOg0KPiA+IFtBTUQgT2ZmaWNpYWwg
VXNlIE9ubHldDQo+ID4NCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IExhemFyLCBMaWpvIDxMaWpvLkxhemFyQGFtZC5jb20+DQo+ID4+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgOCwgMjAyMSA3OjE2IFBNDQo+ID4+IFRvOiBRdWFuLCBFdmFuIDxF
dmFuLlF1YW5AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENj
OiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBCb3Jpc2xh
diBQZXRrb3YNCj4gPj4gPGJwQHN1c2UuZGU+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS9hbWQvcG06IGF2b2lkIGR1cGxpY2F0ZSBwb3dlcmdhdGUvdW5nYXRlDQo+ID4+IHNldHRpbmcN
Cj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gMTEvOC8yMDIxIDEwOjE3IEFNLCBFdmFuIFF1YW4g
d3JvdGU6DQo+ID4+PiBKdXN0IGJhaWwgb3V0IGlmIHRoZSB0YXJnZXQgSVAgYmxvY2sgaXMgYWxy
ZWFkeSBpbiB0aGUgZGVzaXJlZA0KPiA+Pj4gcG93ZXJnYXRlL3VuZ2F0ZSBzdGF0ZS4gVGhpcyBj
YW4gYXZvaWQgc29tZSBkdXBsaWNhdGUgc2V0dGluZ3Mgd2hpY2gNCj4gPj4+IHNvbWV0aW1lIG1h
eSBjYXVzZSB1bmV4cGVjdGVkIGlzc3Vlcy4NCj4gPj4+DQo+ID4+PiBDaGFuZ2UtSWQ6IEk2NjM0
NmM2OWYxMjFkZjBmNWVlMjAxODI0NTEzMTNhZTRmZGEyZDA0DQo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KPiA+Pj4gVGVzdGVkLWJ5OiBCb3Jpc2xh
diBQZXRrb3YgPGJwQHN1c2UuZGU+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICAgICB8ICA3ICsrKysrKysNCj4gPj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggICAgICAgICB8ICAzICsr
LQ0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMgICAgICAgICAg
ICAgIHwgMTMgKysrKysrKysrKysrLQ0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9w
b3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jIHwgIDMgKysrDQo+ID4+PiAgICBkcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3Bvd2VycGxheS9rdl9kcG0uYyAgICAgICAgfCAgMyArKysNCj4gPj4+ICAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NpX2RwbS5jICAgICAgICB8ICAzICsrKw0K
PiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211LmMgICAgICAg
IHwgIDMgKysrDQo+ID4+PiAgICA3IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oDQo+ID4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oDQo+ID4+PiBpbmRleCBiODViNjdhODhhM2QuLjE5ZmEyMWFkOGE0NCAxMDA2NDQNCj4g
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+ID4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiA+Pj4gQEAgLTc2Nyw5ICs3
NjcsMTYgQEAgZW51bSBhbWRfaHdfaXBfYmxvY2tfdHlwZSB7DQo+ID4+PiAgICAjZGVmaW5lIEhX
X0lEX01BWAkJMzAwDQo+ID4+PiAgICAjZGVmaW5lIElQX1ZFUlNJT04obWosIG1uLCBydikgKCgo
bWopIDw8IDE2KSB8ICgobW4pIDw8IDgpIHwNCj4gPj4+IChydikpDQo+ID4+Pg0KPiA+Pj4gK2Vu
dW0gYW1kX2lwX3Bvd2VyZ2F0ZV9zdGF0ZSB7DQo+ID4+PiArCVBPV0VSR0FURV9TVEFURV9JTklU
SUFMLA0KPiA+Pj4gKwlQT1dFUkdBVEVfU1RBVEVfR0FURSwNCj4gPj4+ICsJUE9XRVJHQVRFX1NU
QVRFX1VOR0FURSwNCj4gPj4+ICt9Ow0KPiA+Pj4gKw0KPiA+Pg0KPiA+PiBUbyByZWZsZWN0IHRo
ZSBjdXJyZW50IHN0YXRlLCB0aGV5IGNvdWxkIGJlIG5hbWVkIGxpa2UNCj4gPj4gUE9XRVJHQVRF
X1NUQVRFX1VOS05PV04vT04vT0ZGLg0KPiA+IFtRdWFuLCBFdmFuXSBUaGlzIG1heSBiZSBtb3Jl
IGNvbmZ1c2luZy4gUE9XRVJHQVRFX1NUQVRFX09OIG1lYW5zDQo+ICJnZnggb24iIG9yICJnYXRl
IG9uIHdoaWNoIG1lYW5zIGdmeCBvZmYiPw0KPiANCj4gV2hhdCBJIG1lYW50IGlzIC0NCj4gCVBH
X1NUQVRFX09OIC0gUG93ZXIgZ2F0ZWQNCj4gCVBHX1NUQVRFX09GRiAtIE5vdCBwb3dlciBnYXRl
ZA0KW1F1YW4sIEV2YW5dIFllYWgsIGJ1dCBJIG1lYW4gb3RoZXIgdXNlciBtYXkgYmUgY29uZnVz
aW5nIGFib3V0IHRoZXNlLiBTaW5jZSB3aGVuIHdlIHRha2UgYWJvdXQgdGhlIFBHIHN0YXRlLCB3
ZSB1c3VhbGx5IHVzZSAiR2F0ZSIgb3IgIlVuZ2F0ZSIuIEhvdyBhYm91dCBQT1dFUl9TVEFURV9P
TiAtIFBvd2VyIG9uL3VuZ2F0ZQ0KUE9XRVJfU1RBVEVfT0ZGIC0gUG93ZXIgb2ZmL2dhdGUgPw0K
DQpCUg0KRXZhbg0KPiBUaGFua3MsDQo+IExpam8NCj4gDQo+ID4+DQo+ID4+DQo+ID4+PiAgICBz
dHJ1Y3QgYW1kX3Bvd2VycGxheSB7DQo+ID4+PiAgICAJdm9pZCAqcHBfaGFuZGxlOw0KPiA+Pj4g
ICAgCWNvbnN0IHN0cnVjdCBhbWRfcG1fZnVuY3MgKnBwX2Z1bmNzOw0KPiA+Pj4gKwlhdG9taWNf
dCBwZ19zdGF0ZVtBTURfSVBfQkxPQ0tfVFlQRV9OVU1dOw0KPiA+Pg0KPiA+PiBNYXliZSBhZGQg
YW5vdGhlciBmaWVsZCBpbiBhbWRncHVfaXBfYmxvY2tfc3RhdHVzPyBEb3duc2lkZSBpcyBpdA0K
PiA+PiB3b24ndCByZWZsZWN0IHRoZSBQRyBzdGF0ZSBhY2hpZXZlZCB0aHJvdWdoIHBhdGhzIG90
aGVyIHRoYW4gUE1GVw0KPiA+PiBjb250cm9sIGFuZCBpcGJsb2NrIG5lZWRzIHRvIGJlIHF1ZXJp
ZWQgdGhyb3VnaA0KPiA+PiBhbWRncHVfZGV2aWNlX2lwX2dldF9pcF9ibG9jaygpDQo+ID4gW1F1
YW4sIEV2YW5dIFllcywgd2Ugd2lsbCBuZWVkIHRvIHRyYWNrIHBnIHN0YXRlIG90aGVyIHRoYW4g
UE1GVyBjb250cm9sDQo+IHRoZW4uDQo+ID4gVGhhdCB3aWxsIG5lZWQgZXh0cmEgZWZmb3J0IGFu
ZCBzZWVtcyB1bm5lY2Vzc2FyeSBjb25zaWRlcmluZyB0aGVyZSBpcyBubw0KPiBzdWNoIHVzZSBj
YXNlKG5lZWQgdG8ga25vdyB0aGUgUEcgc3RhdGUgb3V0IG9mIFBNRlcgY29udHJvbCkuDQo+ID4N
Cj4gPiBCUg0KPiA+IEV2YW4NCj4gPj4NCj4gPj4gVGhhbmtzLA0KPiA+PiBMaWpvDQo+ID4+DQo+
ID4+PiAgICB9Ow0KPiA+Pj4NCj4gPj4+ICAgIC8qIHBvbGFyaXMxMCBraWNrZXJzICovDQo+ID4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0K
PiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgNCj4gPj4+IGlu
ZGV4IGYxYTQ2ZDE2ZjdlYS4uNGI5ZTY4YTc5ZjA2IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0KPiA+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0KPiA+Pj4gQEAgLTk4LDcgKzk4LDggQEAg
ZW51bSBhbWRfaXBfYmxvY2tfdHlwZSB7DQo+ID4+PiAgICAJQU1EX0lQX0JMT0NLX1RZUEVfQUNQ
LA0KPiA+Pj4gICAgCUFNRF9JUF9CTE9DS19UWVBFX1ZDTiwNCj4gPj4+ICAgIAlBTURfSVBfQkxP
Q0tfVFlQRV9NRVMsDQo+ID4+PiAtCUFNRF9JUF9CTE9DS19UWVBFX0pQRUcNCj4gPj4+ICsJQU1E
X0lQX0JMT0NLX1RZUEVfSlBFRywNCj4gPj4+ICsJQU1EX0lQX0JMT0NLX1RZUEVfTlVNLA0KPiA+
Pj4gICAgfTsNCj4gPj4+DQo+ID4+PiAgICBlbnVtIGFtZF9jbG9ja2dhdGluZ19zdGF0ZSB7DQo+
ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4g
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0KPiA+Pj4gaW5kZXggMDM1
ODFkNWIxODM2Li5hNmIzMzdiNmY0YTkgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9hbWRncHVfZHBtLmMNCj4gPj4+IEBAIC05MjcsNiArOTI3LDE0IEBAIGludA0KPiA+PiBhbWRn
cHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
DQo+ID4+IHVpbnQzMl90IGJsb2NrDQo+ID4+PiAgICB7DQo+ID4+PiAgICAJaW50IHJldCA9IDA7
DQo+ID4+PiAgICAJY29uc3Qgc3RydWN0IGFtZF9wbV9mdW5jcyAqcHBfZnVuY3MgPSBhZGV2LT5w
b3dlcnBsYXkucHBfZnVuY3M7DQo+ID4+PiArCWVudW0gYW1kX2lwX3Bvd2VyZ2F0ZV9zdGF0ZSBw
Z19zdGF0ZSA9DQo+ID4+PiArCQlnYXRlID8gUE9XRVJHQVRFX1NUQVRFX0dBVEUgOg0KPiA+PiBQ
T1dFUkdBVEVfU1RBVEVfVU5HQVRFOw0KPiA+Pj4gKw0KPiA+Pj4gKwlpZiAoYXRvbWljX3JlYWQo
JmFkZXYtPnBvd2VycGxheS5wZ19zdGF0ZVtibG9ja190eXBlXSkgPT0NCj4gPj4gcGdfc3RhdGUp
IHsNCj4gPj4+ICsJCWRldl9kYmcoYWRldi0+ZGV2LCAiSVAgYmxvY2slZCBhbHJlYWR5IGluIHRo
ZSB0YXJnZXQgJXMNCj4gPj4gc3RhdGUhIiwNCj4gPj4+ICsJCQkJYmxvY2tfdHlwZSwgZ2F0ZSA/
ICJnYXRlIiA6ICJ1bmdhdGUiKTsNCj4gPj4+ICsJCXJldHVybiAwOw0KPiA+Pj4gKwl9DQo+ID4+
Pg0KPiA+Pj4gICAgCXN3aXRjaCAoYmxvY2tfdHlwZSkgew0KPiA+Pj4gICAgCWNhc2UgQU1EX0lQ
X0JMT0NLX1RZUEVfVVZEOg0KPiA+Pj4gQEAgLTk3Niw5ICs5ODQsMTIgQEAgaW50DQo+ID4+IGFt
ZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwNCj4gPj4gdWludDMyX3QgYmxvY2sNCj4gPj4+ICAgIAkJfQ0KPiA+Pj4gICAgCQlicmVhazsN
Cj4gPj4+ICAgIAlkZWZhdWx0Og0KPiA+Pj4gLQkJYnJlYWs7DQo+ID4+PiArCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gPj4+ICAgIAl9DQo+ID4+Pg0KPiA+Pj4gKwlpZiAoIXJldCkNCj4gPj4+ICsJCWF0
b21pY19zZXQoJmFkZXYtPnBvd2VycGxheS5wZ19zdGF0ZVtibG9ja190eXBlXSwNCj4gPj4gcGdf
c3RhdGUpOw0KPiA+Pj4gKw0KPiA+Pj4gICAgCXJldHVybiByZXQ7DQo+ID4+PiAgICB9DQo+ID4+
Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2Ft
ZF9wb3dlcnBsYXkuYw0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2Ft
ZF9wb3dlcnBsYXkuYw0KPiA+Pj4gaW5kZXggYmJhNzQ3OWY2MjY1Li44ZDhhN2NmNjE1ZWIgMTAw
NjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9hbWRfcG93
ZXJwbGF5LmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2Ft
ZF9wb3dlcnBsYXkuYw0KPiA+Pj4gQEAgLTM4LDYgKzM4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBhbWRfcG1fZnVuY3MgcHBfZHBtX2Z1bmNzOw0KPiA+Pj4gICAgc3RhdGljIGludCBhbWRfcG93
ZXJwbGF5X2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gPj4+ICAgIHsNCj4g
Pj4+ICAgIAlzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyOw0KPiA+Pj4gKwlpbnQgaTsNCj4gPj4+DQo+
ID4+PiAgICAJaWYgKGFkZXYgPT0gTlVMTCkNCj4gPj4+ICAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+
ID4+PiBAQCAtNTcsNiArNTgsOCBAQCBzdGF0aWMgaW50IGFtZF9wb3dlcnBsYXlfY3JlYXRlKHN0
cnVjdA0KPiA+PiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiA+Pj4gICAgCWh3bWdyLT5kaXNwbGF5
X2NvbmZpZyA9ICZhZGV2LT5wbS5wbV9kaXNwbGF5X2NmZzsNCj4gPj4+ICAgIAlhZGV2LT5wb3dl
cnBsYXkucHBfaGFuZGxlID0gaHdtZ3I7DQo+ID4+PiAgICAJYWRldi0+cG93ZXJwbGF5LnBwX2Z1
bmNzID0gJnBwX2RwbV9mdW5jczsNCj4gPj4+ICsJZm9yIChpID0gMDsgaSA8IEFNRF9JUF9CTE9D
S19UWVBFX05VTTsgaSsrKQ0KPiA+Pj4gKwkJYXRvbWljX3NldCgmYWRldi0+cG93ZXJwbGF5LnBn
X3N0YXRlW2ldLA0KPiA+PiBQT1dFUkdBVEVfU1RBVEVfSU5JVElBTCk7DQo+ID4+PiAgICAJcmV0
dXJuIDA7DQo+ID4+PiAgICB9DQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vcG93ZXJwbGF5L2t2X2RwbS5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkva3ZfZHBtLmMNCj4gPj4+IGluZGV4IGJjYWU0MmNlZjM3NC4uZjg0ZjU2
NTUyZmQwIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBs
YXkva3ZfZHBtLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5
L2t2X2RwbS5jDQo+ID4+PiBAQCAtMjk2NSw5ICsyOTY1LDEyIEBAIHN0YXRpYyBpbnQga3ZfZHBt
X2dldF90ZW1wKHZvaWQgKmhhbmRsZSkNCj4gPj4+ICAgIHN0YXRpYyBpbnQga3ZfZHBtX2Vhcmx5
X2luaXQodm9pZCAqaGFuZGxlKQ0KPiA+Pj4gICAgew0KPiA+Pj4gICAgCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopaGFuZGxlOw0KPiA+Pj4gKwlp
bnQgaTsNCj4gPj4+DQo+ID4+PiAgICAJYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzID0gJmt2X2Rw
bV9mdW5jczsNCj4gPj4+ICAgIAlhZGV2LT5wb3dlcnBsYXkucHBfaGFuZGxlID0gYWRldjsNCj4g
Pj4+ICsJZm9yIChpID0gMDsgaSA8IEFNRF9JUF9CTE9DS19UWVBFX05VTTsgaSsrKQ0KPiA+Pj4g
KwkJYXRvbWljX3NldCgmYWRldi0+cG93ZXJwbGF5LnBnX3N0YXRlW2ldLA0KPiA+PiBQT1dFUkdB
VEVfU1RBVEVfSU5JVElBTCk7DQo+ID4+PiAgICAJa3ZfZHBtX3NldF9pcnFfZnVuY3MoYWRldik7
DQo+ID4+Pg0KPiA+Pj4gICAgCXJldHVybiAwOw0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NpX2RwbS5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9wb3dlcnBsYXkvc2lfZHBtLmMNCj4gPj4+IGluZGV4IDgxZjgyYWEwNWVjMi4uZjFl
YjIyYzliYjU5IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dl
cnBsYXkvc2lfZHBtLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L3NpX2RwbS5jDQo+ID4+PiBAQCAtNzkxNiw5ICs3OTE2LDEyIEBAIHN0YXRpYyBpbnQgc2lf
ZHBtX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQ0KPiA+Pj4gICAgew0KPiA+Pj4NCj4gPj4+ICAg
IAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhh
bmRsZTsNCj4gPj4+ICsJaW50IGk7DQo+ID4+Pg0KPiA+Pj4gICAgCWFkZXYtPnBvd2VycGxheS5w
cF9mdW5jcyA9ICZzaV9kcG1fZnVuY3M7DQo+ID4+PiAgICAJYWRldi0+cG93ZXJwbGF5LnBwX2hh
bmRsZSA9IGFkZXY7DQo+ID4+PiArCWZvciAoaSA9IDA7IGkgPCBBTURfSVBfQkxPQ0tfVFlQRV9O
VU07IGkrKykNCj4gPj4+ICsJCWF0b21pY19zZXQoJmFkZXYtPnBvd2VycGxheS5wZ19zdGF0ZVtp
XSwNCj4gPj4gUE9XRVJHQVRFX1NUQVRFX0lOSVRJQUwpOw0KPiA+Pj4gICAgCXNpX2RwbV9zZXRf
aXJxX2Z1bmNzKGFkZXYpOw0KPiA+Pj4gICAgCXJldHVybiAwOw0KPiA+Pj4gICAgfQ0KPiA+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvYW1kZ3B1X3NtdS5jDQo+
ID4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211LmMNCj4gPj4+IGlu
ZGV4IDAxMTY4Yjg5NTViZi4uZmRjMjViYWU4MjM3IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211LmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vc3dzbXUvYW1kZ3B1X3NtdS5jDQo+ID4+PiBAQCAtNjI3LDYgKzYyNyw3
IEBAIHN0YXRpYyBpbnQgc211X2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQ0KPiA+Pj4gICAgew0K
PiA+Pj4gICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2
aWNlICopaGFuZGxlOw0KPiA+Pj4gICAgCXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFkZXYt
PnNtdTsNCj4gPj4+ICsJaW50IGk7DQo+ID4+Pg0KPiA+Pj4gICAgCXNtdS0+YWRldiA9IGFkZXY7
DQo+ID4+PiAgICAJc211LT5wbV9lbmFibGVkID0gISFhbWRncHVfZHBtOw0KPiA+Pj4gQEAgLTYz
OSw2ICs2NDAsOCBAQCBzdGF0aWMgaW50IHNtdV9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkNCj4g
Pj4+DQo+ID4+PiAgICAJYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZSA9IHNtdTsNCj4gPj4+ICAg
IAlhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MgPSAmc3dzbXVfcG1fZnVuY3M7DQo+ID4+PiArCWZv
ciAoaSA9IDA7IGkgPCBBTURfSVBfQkxPQ0tfVFlQRV9OVU07IGkrKykNCj4gPj4+ICsJCWF0b21p
Y19zZXQoJmFkZXYtPnBvd2VycGxheS5wZ19zdGF0ZVtpXSwNCj4gPj4gUE9XRVJHQVRFX1NUQVRF
X0lOSVRJQUwpOw0KPiA+Pj4NCj4gPj4+ICAgIAlyZXR1cm4gc211X3NldF9mdW5jcyhhZGV2KTsN
Cj4gPj4+ICAgIH0NCj4gPj4+DQo=
