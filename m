Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F154BAE6
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jun 2022 21:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84D1112CB9;
	Tue, 14 Jun 2022 19:46:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4647112CC2
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jun 2022 19:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZtQIlkwErls5nPlhXuWh3iWoIKn1MtvNdeVUSIuyg0AN1JKFT3XrJgqPEaP/5rP01FNk7sSbN1w+LSGNv07pJEbcK+0KNGMGrgWEwEnf8CNqLSyjumWYjaAJTrVuAgMPJ+MjtY9zaTKFYCIdYcDkGuBW1/vkILcmaZeljSwyDlPMpzn8tUJXd+APywsEgkNlXgSkaoqbXPFaw92fPS0KxvFUt98EMJ5UHQz2kWJoYfZPPlO3k8c172JXh3fPPygaf4zumW0fxxg6syzfr078SkdPvhf+MVRAkgglzTXjnKK3KmTLypXj5cvHpDjb1uVNI24QOBkdMYRjjfLmenMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ix0FfL3hdluFf2gF9Fz1i5emRLVRnw0LiVCDGsxQ2CA=;
 b=PjDU49Kdl/3JNLnJ673SohzQQvUPxvo1GmyrVGkLsxDb1uyIJw85tASXaiNWuBToxx2/8JXmC59ym2DZvlnNpqnZI66zt3ql+8ShKliaAA394L/KjXnyNBgR0DUow4oFCRSOD27B+jaCi1t4Rdwxrd2X34bboCxuQzzO5sCXRcA44OJBPclE9NVqShkb4FY+giJD2jkLfWTKk7RnFbjQ8aIJuNzi5+T4qs8ZRluWchjA6DdWmt8xLwCA23P7l3JXwVXPOrtOjLgSJp+F+hM6ldOcaf3gTGkMbf2uJubnulR1tzZzMpJv/KKc0szOsrSVhrUdg//QlSR/HpiAC+TIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ix0FfL3hdluFf2gF9Fz1i5emRLVRnw0LiVCDGsxQ2CA=;
 b=TZqKE2ooaX26yLsK2lVdtGbnlQSpfaI3Lht+vRW6rdIdCU4gFrs3CzhA3fS98E8QZ7mau6zRXSMszElHIIj4lMt2D6e6OsnwOUVDgLLdbKd5h/5NDV7hJbzejX/fI8U6l2GiTVQjjyNTo12m+vpXHj3wC00Mf0x2OaTOir/LmFw=
Received: from DM6PR12MB3067.namprd12.prod.outlook.com (2603:10b6:5:115::10)
 by BY5PR12MB5016.namprd12.prod.outlook.com (2603:10b6:a03:1c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 19:46:43 +0000
Received: from DM6PR12MB3067.namprd12.prod.outlook.com
 ([fe80::3d3a:523d:94fd:fa16]) by DM6PR12MB3067.namprd12.prod.outlook.com
 ([fe80::3d3a:523d:94fd:fa16%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 19:46:42 +0000
From: "Sider, Graham" <Graham.Sider@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/3] drm/amdkfd: Enable GFX11 usermode queue
 oversubscription
Thread-Topic: [PATCH v3 2/3] drm/amdkfd: Enable GFX11 usermode queue
 oversubscription
Thread-Index: AQHYfzkX/nzgeGX8UkaVeB6hqEJG5q1POO+AgAAUOfA=
Date: Tue, 14 Jun 2022 19:46:42 +0000
Message-ID: <DM6PR12MB3067D8B131E37648057F63DB8AAA9@DM6PR12MB3067.namprd12.prod.outlook.com>
References: <20220613152001.3045911-1-Graham.Sider@amd.com>
 <20220613152001.3045911-2-Graham.Sider@amd.com>
 <11d1242d-3ebd-8093-d23f-099d4acc8708@amd.com>
In-Reply-To: <11d1242d-3ebd-8093-d23f-099d4acc8708@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-14T19:34:46Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=d8a059b8-d273-4c26-967e-e7c38db4fdfd;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-14T19:46:41Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: 5f2569bc-a548-454f-b1ac-4e69c3fc77af
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a156d398-860d-4b09-793e-08da4e3e9b59
x-ms-traffictypediagnostic: BY5PR12MB5016:EE_
x-microsoft-antispam-prvs: <BY5PR12MB501671103BC1E5ED35D7F1918AAA9@BY5PR12MB5016.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ELetkPBQL5WX3YVsYzVQgS7g7xuDvdQdUysWhUUfmSAdpty8TiWO6Xf4BxiX6QF/Cy+Txi6HNe/2BqetrpGtijYUG8t3RpQW9ORaIMafYTi5mwtLIAYLOphxxLtedAWALmWl8KVN2tUJKS/J7Z2CwfSx2N4yE5HUzoc1wa3GwZhzBjxD3y+Puacn56K5Qq3E6eBlrXRWqcidMSYKBXRVKD5KQpc5eJRnKq52b62odscvYrSuY4umehV3SYwF4kGQtX0clXkbiJ4acVsuf/xi8t09+0bD7BdmBYIlcxk+S2z0bWE64OnokQppZ1A/WoAON0uWXMuDUXd/gFqHmr/FpMPON2dxEpVYg1kQUhgfZlUV6HVcwqmrPEoD8fjiHnO8Rce9JphkuRmoJ0sychJEo4Wt9nWjdDVlAB6xvRe6QlSaF8zVHzZK8OkNu5jbAQEyydP++LUv9hYQl1AxhgMKR1JqGXNbzpW4/BKOgr7ArZjxZaH33KIpMK03scDLCoOt/mfRXh4waSpU4t1DxdssZ0GnrINw/rg2NrMKKmBnqWzYReDWbLv+lVzXPMaGTMqgztyOamKKLryAulizJWZrg7SI0JTOh0J/qsQXHMnhbM1j6Fi64wKp3Ly/WV7SgoAW5rohc6GT9CfANZg4ZCoOe73pk7g4WaRitm62CRX2VjxBGugt//hS21aa6pvqu0NmlF7/diZ0R9mAwTa2RPGllQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3067.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(38100700002)(38070700005)(53546011)(33656002)(122000001)(316002)(6506007)(8936002)(7696005)(71200400001)(55016003)(86362001)(2906002)(54906003)(110136005)(508600001)(83380400001)(5660300002)(186003)(76116006)(52536014)(66946007)(64756008)(66556008)(4326008)(66446008)(26005)(66476007)(30864003)(9686003)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTlEWUdQajd3dm4vc0pLTlphZ0U5YW1hcmpFRjlFbUx2T2ZDME1NdEZMcWxZ?=
 =?utf-8?B?cnB2LzhOU291YkJMM1l0c2NISlJoeW5OM2l1eVZ0cmFZajFYcHZKSlNCaWdl?=
 =?utf-8?B?cnJOMGJQY1M4SDZJRStCNGpFYU04VWhlUkxMME1oa003blUxVkxZOFF1cSt3?=
 =?utf-8?B?UWp3dVcxZXc5TDVXejdjVWxYcGRDZVliOE51bXVUa2FsVmZQQW1BMyt4dWIx?=
 =?utf-8?B?d3VKK3ZrVlphTWNVaWNxaWxrRTYwbG9lSHdJcld4STJhL2Y2OXptMExVcjZw?=
 =?utf-8?B?azhoYm9rcWhDc1dRbFpEVGF4SjM2TENsMHpMcHNKTVB5TFZtOStNMndnWWlG?=
 =?utf-8?B?NWd6cDQ1dmtOWEZzNFg0OWxpMXBqeE1WcXRhRXNyRU8rR0czakZCaVBmSzRF?=
 =?utf-8?B?dUMrNG5MQjRWMi9CU2tubk9uWFg0ZnFhNDVzTDE1V0JKRUt2dHRONEMrMG9Q?=
 =?utf-8?B?bmZpUGt3a1d0L1Jsdy85OG8rMVRSRXVlMzc3bDgweWl2aUNlVlZpV1ZGZTRC?=
 =?utf-8?B?UzZqczdqelRRWGZrNm1USTMvZ2k4d2RDZVJpWkNwVEE3TU1zaENOZGZndmIz?=
 =?utf-8?B?b2NoRFVYMkFrWFZnOHFJbXdyWmJCSjI3YjF1aXlkZzFaQmQrOFlMZk9QOHFZ?=
 =?utf-8?B?b2piaU9LZzlzWWZlYjRUY3pTS3pmT1NxS1d6RE85SUxUWjc3RENsVWxYeHA3?=
 =?utf-8?B?dGg2ZnNscG9hbERrcXljUFJSOHJSV3hURFVCeGVSYXZ6cVhrZ2NiaWhJdUFV?=
 =?utf-8?B?UUtZUTRvd01tbXZSNzM0a2c5QktJZmd5V1ZUa3ZJSmN5d0QxWk04RmhCcEph?=
 =?utf-8?B?cElLWWVpMThzZldoN0NJOXZSWG1xRFVZOFpVL21VWnFGTzRVTXlDNHRrazVG?=
 =?utf-8?B?M1k1L255bGp0UTZtZG1IZk1VWG5WMksxYUo1NDQ4RXcwWUFOSllDNE1Pc0JG?=
 =?utf-8?B?Ym5WVFMybTVzenhEbTN6Mm9HVzN6ekdmNmsrcWxrc0NwZkhWdG02SjRCUFBZ?=
 =?utf-8?B?ckZBbmttMGk3ZElsMTQ0bmFwL2pFS3l1MU16bk1EYXhHMVV6V1FyQSs5NUo4?=
 =?utf-8?B?Vmt1Q0szRW4vejI5U1RzUHVDUjRLMnVwQzQ1WTV5RnE3SWxlVDFZQnJEcG80?=
 =?utf-8?B?ZmtLdEkvY3htTW1IVUxqK0w4aHdUWlpCL1hTQ1hJaWIwYnhBSEtmRVRKRVlr?=
 =?utf-8?B?emV3Y3ZLY3QyaktnSDFITENtZXUrWHJQUnl6N1NnSjcyWktia2xPMGFaS0VN?=
 =?utf-8?B?TFM5VnY0SXAxMXJtTFVLaHVybVMvTThnWlB0RkdjTlR6NGhYN0haa0ZBR2lq?=
 =?utf-8?B?bEN4ZzE0YU9RT2Yyb1ZpaS9XRm9MVlNPbVpSVWFHVVdVZ2dPSWxTSGN5WStV?=
 =?utf-8?B?c0prdTN3R1d4N3c5TVY3bkVwenZiS2FtQnh5cmk4S1hleXNxVFN4UVlDRzhT?=
 =?utf-8?B?V0p0bDhuSlhSTFozYk9adGNUUEZCZkQyaDNHM1FrclZoc0R1dmJGcGJVbCtI?=
 =?utf-8?B?UFNsYWdEQ2hyZ3JCNnZxbksxS2VQUGlOZDRZbGZSZEpML0pGSWtMd1lvVW1W?=
 =?utf-8?B?eXZHdkVCNmUwSjV3ZnBtb0ErKzdJWHF1eXgzM2NkWDQ4V3Z6ZzRiRWx2MnhW?=
 =?utf-8?B?eDJxN2Jkb2M3MkZ3R1hpVzd4L1BEck5GMkx4KytUQlo3VHNyZ0dEbUxMejVN?=
 =?utf-8?B?RnRIVUlJR3hab1h0UDZYeldPSmljczNTNEdYdWdzdW1BbGVIMnBQTTRweGNU?=
 =?utf-8?B?a0dtblF0SjgwOHd0aWNwaVJuUDFXNXRlNU5UL051Tklmb25RWGJjck81azBE?=
 =?utf-8?B?UFVCd1dKcjBvZlBndTFHdGhGQTJPSFRaYnJqOXJSc3pyU1gyVGhNWGNUMnBO?=
 =?utf-8?B?VzNIL2tKRkFPOTFhNEgrM00xN0llNnVkdW5XMXA1b0dOQ29tTk50WXRQYlgr?=
 =?utf-8?B?TDZXdmp0a0VZYjVXWUs1K3RNT0JuUmYydHBUdXRSVXU0aUNudmJLVDJMUlVY?=
 =?utf-8?B?elNMQitKcEtUK0syaUR4R3R2elR3dTBmdjJRaDZhOWtEUFM3NFNsTXdYUE9j?=
 =?utf-8?B?QkVEZHR5YWlmRDR1aXVZUE9Wb2hERG4vcUlvTFJSaDJnWmo5S1dpcitLMFZj?=
 =?utf-8?B?d1A3cjJDUDVMSThQQnRGVFRyb2pjbHpFMG9tK2crV3FBaWxraFBkbERSajRs?=
 =?utf-8?B?Z0thcnBwcndLTGt1NU5EbWpRbDEva0N2WU9rYkpkZ0NiZkViWE1WZ2JJczJk?=
 =?utf-8?B?Y3NyMFpNdEVVOGVob01OcVl6THpNVXlzQlZ4dXhJZzc0aWU4bWVOVXo1MEhi?=
 =?utf-8?B?RjlZcjJxdnJ1WU1Td3g4bVdkTVUwZXFWci91c2sxTTlabTZpZGdrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3067.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a156d398-860d-4b09-793e-08da4e3e9b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 19:46:42.7305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5dYb0ZtfJFxkEI9N3PGMtTQPuAstxDC+5dTj6FpCoCdhO3JcMQlKeddf/07HN81H9PY6gEBtXHVnGRORR/icpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5016
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
Cc: "Joshi, Mukul" <Mukul.Joshi@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4+IEZyb206IFlhbmcsIFBoaWxp
cCA8UGhpbGlwLllhbmdAYW1kLmNvbT4gDQo+PiBTZW50OiBUdWVzZGF5LCBKdW5lIDE0LCAyMDIy
IDI6MjIgUE0NCj4+IFRvOiBTaWRlciwgR3JhaGFtIDxHcmFoYW0uU2lkZXJAYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogS3VlaGxpbmcsIEZlbGl4IDxGZWxp
eC5LdWVobGluZ0BhbWQuY29tPjsgSm9zaGksIE11a3VsIDxNdWt1bC5Kb3NoaUBhbWQuY29tPjsg
WWFuZywgUGhpbGlwIDxQaGlsaXAuWWFuZ0BhbWQuY29tPg0KPj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAyLzNdIGRybS9hbWRrZmQ6IEVuYWJsZSBHRlgxMSB1c2VybW9kZSBxdWV1ZSBvdmVyc3Vi
c2NyaXB0aW9uDQo+Pg0KPj4NCj4+IE9uIDIwMjItMDYtMTMgMTE6MjAsIEdyYWhhbSBTaWRlciB3
cm90ZToNCj4+IFN0YXJ0aW5nIHdpdGggR0ZYMTEsIE1FUyByZXF1aXJlcyB3cHRyIEJPcyB0byBi
ZSBHVFQgYWxsb2NhdGVkL21hcHBlZCB0bw0KPj4gR0FSVCBmb3IgdXNlcm1vZGUgcXVldWVzIGlu
IG9yZGVyIHRvIHN1cHBvcnQgb3ZlcnN1YnNjcmlwdGlvbi4gSW4gdGhlDQo+PiBjYXNlIHRoYXQg
d29yayBpcyBzdWJtaXR0ZWQgdG8gYW4gdW5tYXBwZWQgcXVldWUsIE1FUyBtdXN0IGhhdmUgYSBH
QVJUDQo+PiB3cHRyIGFkZHJlc3MgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHF1ZXVlIHNob3Vs
ZCBiZSBtYXBwZWQuDQo+Pg0KPj4gVGhpcyBjaGFuZ2UgaXMgYWNjb21wYW5pZWQgd2l0aCBjaGFu
Z2VzIGluIE1FUyBhbmQgaXMgYXBwbGljYWJsZSBmb3INCj4+IE1FU19WRVJTSU9OID49IDMuDQo+
Pg0KPj4gdjI6DQo+PiAtIFVwZGF0ZSBNRVNfVkVSU0lPTiBjaGVjayBmcm9tIDIgdG8gMy4NCj4+
IHYzOg0KPj4gLSBVc2UgYW1kZ3B1X3ZtX2JvX2xvb2t1cF9tYXBwaW5nIGZvciB3cHRyX2JvIG1h
cHBpbmcgbG9va3VwDQo+PiAtIE1vdmUgd3B0cl9ibyByZWZjb3VudCBpbmNyZW1lbnQgdG8gYW1k
Z3B1X2FtZGtmZF9tYXBfZ3R0X2JvX3RvX2dhcnQNCj4+IC0gUmVtb3ZlIGxpc3RfZGVsX2luaXQg
ZnJvbSBhbWRncHVfYW1ka2ZkX21hcF9ndHRfYm9fdG9fZ2FydA0KPj4gLSBDbGVhbnVwL2ZpeCBj
cmVhdGVfcXVldWUgd3B0cl9ibyBlcnJvciBoYW5kbGluZw0KPj4gVHdvIG5pdC1waWNrIGJlbG93
LCB3aXRoIHRob3NlIGZpeGVkLCB0aGlzIHBhdGNoIGlzDQo+PiBSZXZpZXdlZC1ieTogUGhpbGlw
IFlhbmdtYWlsdG86UGhpbGlwLllhbmdAYW1kLmNvbQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEdy
YWhhbSBTaWRlciBtYWlsdG86R3JhaGFtLlNpZGVyQGFtZC5jb20NCj4+IC0tLQ0KPj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCAgICB8ICAxICsNCj4+IC4uLi9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDQ5ICsrKysrKysrKysr
KysrKysrKysNCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jICAg
ICAgfCAzNyArKysrKysrKysrKysrLQ0KPj4gLi4uL2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jIHwgIDkgKysrLQ0KPj4gLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bXFkX21hbmFnZXJfdjExLmMgIHwgIDIgKw0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wcml2LmggICAgICAgICB8ICAzICsrDQo+PiAuLi4vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
c19xdWV1ZV9tYW5hZ2VyLmMgICAgfCAxNyArKysrKy0tDQo+PiAgNyBmaWxlcyBjaGFuZ2VkLCAx
MTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPj4gaW5kZXggNDI5YjE2YmExMGJmLi5kYmEy
NmQxZTNiZTkgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkLmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuaA0KPj4gQEAgLTMwMSw2ICszMDEsNyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9t
YXBfZ3R0X2JvX3RvX2tlcm5lbChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+ICAJCXN0
cnVjdCBrZ2RfbWVtICptZW0sIHZvaWQgKiprcHRyLCB1aW50NjRfdCAqc2l6ZSk7DQo+PiAgdm9p
ZCBhbWRncHVfYW1ka2ZkX2dwdXZtX3VubWFwX2d0dF9ib19mcm9tX2tlcm5lbChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4+ICAJCXN0cnVjdCBrZ2RfbWVtICptZW0pOw0KPj4gK2ludCBh
bWRncHVfYW1ka2ZkX21hcF9ndHRfYm9fdG9fZ2FydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgc3RydWN0IGFtZGdwdV9ibyAqYm8pOw0KPj4gIA0KPj4gIGludCBhbWRncHVfYW1ka2ZkX2dw
dXZtX3Jlc3RvcmVfcHJvY2Vzc19ib3Modm9pZCAqcHJvY2Vzc19pbmZvLA0KPj4gIAkJCQkJICAg
IHN0cnVjdCBkbWFfZmVuY2UgKiplZik7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+PiBpbmRleCBlZmFiOTIzMDU2ZjQuLjg4OGQw
ODEyOGE5NCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmRfZ3B1dm0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jDQo+PiBAQCAtMjAzMCw2ICsyMDMwLDU1IEBAIGludCBhbWRncHVf
YW1ka2ZkX2dwdXZtX3N5bmNfbWVtb3J5KA0KPj4gIAlyZXR1cm4gcmV0Ow0KPj4gIH0NCj4+ICAN
Cj4+ICsvKioNCj4+ICsgKiBhbWRncHVfYW1ka2ZkX21hcF9ndHRfYm9fdG9fZ2FydCAtIE1hcCBC
TyB0byBHQVJUIGFuZCBpbmNyZW1lbnQgcmVmZXJlbmNlIGNvdW50DQo+PiArICogQGFkZXY6IERl
dmljZSB0byB3aGljaCBhbGxvY2F0ZWQgQk8gYmVsb25ncw0KPj4gKyAqIEBibzogQnVmZmVyIG9i
amVjdCB0byBiZSBtYXBwZWQNCj4+ICsgKg0KPj4gKyAqIEJlZm9yZSByZXR1cm4sIGJvIHJlZmVy
ZW5jZSBjb3VudCBpcyBpbmNyZW1lbnRlZC4gVG8gcmVsZWFzZSB0aGUgcmVmZXJlbmNlIGFuZCB1
bnBpbi8NCj4+ICsgKiB1bm1hcCB0aGUgQk8sIGNhbGwgYW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9t
ZW0uDQo+PiArICovDQo+PiAraW50IGFtZGdwdV9hbWRrZmRfbWFwX2d0dF9ib190b19nYXJ0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X2JvICpibykNCj4+ICt7DQo+
PiArCWludCByZXQ7DQo+PiArDQo+PiArCXJldCA9IGFtZGdwdV9ib19yZXNlcnZlKGJvLCB0cnVl
KTsNCj4+ICsJaWYgKHJldCkgew0KPj4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gcmVzZXJ2ZSBiby4g
cmV0ICVkXG4iLCByZXQpOw0KPj4gKwkJZ290byBlcnJfcmVzZXJ2ZV9ib19mYWlsZWQ7DQo+PiAr
CX0NCj4+ICsNCj4+ICsJcmV0ID0gYW1kZ3B1X2JvX3BpbihibywgQU1ER1BVX0dFTV9ET01BSU5f
R1RUKTsNCj4+ICsJaWYgKHJldCkgew0KPj4gKwkJcHJfZXJyKCJGYWlsZWQgdG8gcGluIGJvLiBy
ZXQgJWRcbiIsIHJldCk7DQo+PiArCQlnb3RvIGVycl9waW5fYm9fZmFpbGVkOw0KPj4gKwl9DQo+
PiArDQo+PiArCXJldCA9IGFtZGdwdV90dG1fYWxsb2NfZ2FydCgmYm8tPnRibyk7DQo+PiArCWlm
IChyZXQpIHsNCj4+ICsJCXByX2VycigiRmFpbGVkIHRvIGJpbmQgYm8gdG8gR0FSVC4gcmV0ICVk
XG4iLCByZXQpOw0KPj4gKwkJZ290byBlcnJfbWFwX2JvX2dhcnRfZmFpbGVkOw0KPj4gKwl9DQo+
PiArDQo+PiArCWFtZGdwdV9hbWRrZmRfcmVtb3ZlX2V2aWN0aW9uX2ZlbmNlKA0KPj4gKwkJYm8s
IGJvLT5rZmRfYm8tPnByb2Nlc3NfaW5mby0+ZXZpY3Rpb25fZmVuY2UpOw0KPj4gKwlsaXN0X2Rl
bF9pbml0KCZiby0+a2ZkX2JvLT52YWxpZGF0ZV9saXN0LmhlYWQpOw0KPg0KPiBwaW5uZWQgYm8g
c2hvdWxkIGtlZXAgaW4gdmFsaWRhdGVfbGlzdCBhcyBQREIvUFRCIG1heSBtb3ZlIGFuZCB1cGRh
dGUsIHBsZWFzZSByZW1vdmUgbGlzdF9kZWxfaW5pdCBoZXJlLg0KPg0KDQpUaG91Z2h0IEkgZGVs
ZXRlZCB0aGlzIGxpbmUgLSBnb29kIGNhdGNoLg0KDQo+PiArDQo+PiArCWFtZGdwdV9ib191bnJl
c2VydmUoYm8pOw0KPj4gKw0KPj4gKwlibyA9IGFtZGdwdV9ib19yZWYoYm8pOw0KPj4gKw0KPj4g
KwlyZXR1cm4gMDsNCj4+ICsNCj4+ICtlcnJfbWFwX2JvX2dhcnRfZmFpbGVkOg0KPj4gKwlhbWRn
cHVfYm9fdW5waW4oYm8pOw0KPj4gK2Vycl9waW5fYm9fZmFpbGVkOg0KPj4gKwlhbWRncHVfYm9f
dW5yZXNlcnZlKGJvKTsNCj4+ICtlcnJfcmVzZXJ2ZV9ib19mYWlsZWQ6DQo+PiArDQo+PiArCXJl
dHVybiByZXQ7DQo+PiArfQ0KPj4gKw0KPj4gIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX21hcF9n
dHRfYm9fdG9fa2VybmVsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gIAkJc3RydWN0
IGtnZF9tZW0gKm1lbSwgdm9pZCAqKmtwdHIsIHVpbnQ2NF90ICpzaXplKQ0KPj4gIHsNCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYw0KPj4gaW5kZXggZTk3NjZlMTY1
YzM4Li4xNzg5ZWQ4Yjc5ZjUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfY2hhcmRldi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfY2hhcmRldi5jDQo+PiBAQCAtMjg5LDYgKzI4OSw3IEBAIHN0YXRpYyBpbnQga2ZkX2lvY3Rs
X2NyZWF0ZV9xdWV1ZShzdHJ1Y3QgZmlsZSAqZmlsZXAsIHN0cnVjdCBrZmRfcHJvY2VzcyAqcCwN
Cj4+ICAJc3RydWN0IGtmZF9wcm9jZXNzX2RldmljZSAqcGRkOw0KPj4gIAlzdHJ1Y3QgcXVldWVf
cHJvcGVydGllcyBxX3Byb3BlcnRpZXM7DQo+PiAgCXVpbnQzMl90IGRvb3JiZWxsX29mZnNldF9p
bl9wcm9jZXNzID0gMDsNCj4+ICsJc3RydWN0IGFtZGdwdV9ibyAqd3B0cl9ibyA9IE5VTEw7DQo+
PiAgDQo+PiAgCW1lbXNldCgmcV9wcm9wZXJ0aWVzLCAwLCBzaXplb2Yoc3RydWN0IHF1ZXVlX3By
b3BlcnRpZXMpKTsNCj4+ICANCj4+IEBAIC0zMTYsMTIgKzMxNyw0MSBAQCBzdGF0aWMgaW50IGtm
ZF9pb2N0bF9jcmVhdGVfcXVldWUoc3RydWN0IGZpbGUgKmZpbGVwLCBzdHJ1Y3Qga2ZkX3Byb2Nl
c3MgKnAsDQo+PiAgCQlnb3RvIGVycl9iaW5kX3Byb2Nlc3M7DQo+PiAgCX0NCj4+ICANCj4+ICsJ
LyogU3RhcnRpbmcgd2l0aCBHRlgxMSwgd3B0ciBCT3MgbXVzdCBiZSBtYXBwZWQgdG8gR0FSVCBm
b3IgTUVTIHRvIGRldGVybWluZSB3b3JrDQo+PiArCSAqIG9uIHVubWFwcGVkIHF1ZXVlcyBmb3Ig
dXNlcm1vZGUgcXVldWUgb3ZlcnN1YnNjcmlwdGlvbiAobm8gYWdncmVnYXRlZCBkb29yYmVsbCkN
Cj4+ICsJICovDQo+PiArCWlmIChkZXYtPnNoYXJlZF9yZXNvdXJjZXMuZW5hYmxlX21lcyAmJiAo
ZGV2LT5hZGV2LT5tZXMuc2NoZWRfdmVyc2lvbiAmIDB4ZmYpID49IDMpIHsNCj4NCj4gU2hvdWxk
IHdlIGNoZWNrIGlwIHZlcnNpb24gZm9yIEdGWDExIG9ubHk/IEJlY2F1c2UgR0ZYMTAgc2V0IGVu
YWJsZV9tZXMsIGFuZCBtYXkgc2V0IGFkZXYtPm1lcy5zY2hlZF92ZXJzaW9uIGxhdGVyIGFzIHdl
bGwuDQo+IFJlZ2FyZHMsDQo+IFBoaWxpcA0KPg0KDQpJIHB1cnBvc2VmdWxseSBvbWl0dGVkIHNl
dHRpbmcgc2NoZWQva2lxX3ZlcnNpb24gZm9yIEdGWDEwIGluIHBhcnQgZm9yIHRoaXMgcmVhc29u
LiBUaGUgTUVTIHZlcnNpb24gbnVtYmVycyBmb3IgR0ZYMTEgZG9uJ3QgYnVpbGQgb24gdG9wIG9m
IEdGWDEwLCBzbyBpdCBjb3VsZCBnZXQgdmVyeSBjb25mdXNpbmcgaWYgd2UgZ28gYmFjayB0byBz
ZXQgdGhpcyBmb3IgR0ZYMTAgbm93LiBXaXRoIHRoYXQgaW4gbWluZCBJIHRoaW5rIGl0J3Mgb2th
eSB0byBiYXNlIHRoaXMgY2hlY2sgb24gdGhlIE1FUyBzY2hlZHVsZXIgdmVyc2lvbiB3aXRob3V0
IGV4cGxpY2l0bHkgY2hlY2tpbmcgZm9yIEdGWDExKywgYnV0IGlmIGl0J3MgcHJlZmVycmVkIHRo
ZSBvdGhlciB3YXksIEknbSBhbHNvIGZpbmUgd2l0aCB0aGF0Lg0KDQpCZXN0LA0KR3JhaGFtDQoN
Cj4+ICsJCXN0cnVjdCBhbWRncHVfYm9fdmFfbWFwcGluZyAqd3B0cl9tYXBwaW5nOw0KPj4gKwkJ
c3RydWN0IGFtZGdwdV92bSAqd3B0cl92bTsNCj4+ICsNCj4+ICsJCXdwdHJfdm0gPSBkcm1fcHJp
dl90b192bShwZGQtPmRybV9wcml2KTsNCj4+ICsJCWVyciA9IGFtZGdwdV9ib19yZXNlcnZlKHdw
dHJfdm0tPnJvb3QuYm8sIGZhbHNlKTsNCj4+ICsJCWlmIChlcnIpDQo+PiArCQkJZ290byBlcnJf
d3B0cl9tYXBfZ2FydDsNCj4+ICsNCj4+ICsJCXdwdHJfbWFwcGluZyA9IGFtZGdwdV92bV9ib19s
b29rdXBfbWFwcGluZygNCj4+ICsJCQkJd3B0cl92bSwgYXJncy0+d3JpdGVfcG9pbnRlcl9hZGRy
ZXNzID4+IFBBR0VfU0hJRlQpOw0KPj4gKwkJYW1kZ3B1X2JvX3VucmVzZXJ2ZSh3cHRyX3ZtLT5y
b290LmJvKTsNCj4+ICsJCWlmICghd3B0cl9tYXBwaW5nKSB7DQo+PiArCQkJcHJfZXJyKCJGYWls
ZWQgdG8gbG9va3VwIHdwdHIgYm9cbiIpOw0KPj4gKwkJCWVyciA9IC1FSU5WQUw7DQo+PiArCQkJ
Z290byBlcnJfd3B0cl9tYXBfZ2FydDsNCj4+ICsJCX0NCj4+ICsNCj4+ICsJCXdwdHJfYm8gPSB3
cHRyX21hcHBpbmctPmJvX3ZhLT5iYXNlLmJvOw0KPj4gKwkJZXJyID0gYW1kZ3B1X2FtZGtmZF9t
YXBfZ3R0X2JvX3RvX2dhcnQoZGV2LT5hZGV2LCB3cHRyX2JvKTsNCj4+ICsJCWlmIChlcnIpIHsN
Cj4+ICsJCQlwcl9lcnIoIkZhaWxlZCB0byBtYXAgd3B0ciBibyB0byBHQVJUXG4iKTsNCj4+ICsJ
CQlnb3RvIGVycl93cHRyX21hcF9nYXJ0Ow0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArDQo+PiAgCXBy
X2RlYnVnKCJDcmVhdGluZyBxdWV1ZSBmb3IgUEFTSUQgMHgleCBvbiBncHUgMHgleFxuIiwNCj4+
ICAJCQlwLT5wYXNpZCwNCj4+ICAJCQlkZXYtPmlkKTsNCj4+ICANCj4+IC0JZXJyID0gcHFtX2Ny
ZWF0ZV9xdWV1ZSgmcC0+cHFtLCBkZXYsIGZpbGVwLCAmcV9wcm9wZXJ0aWVzLCAmcXVldWVfaWQs
IE5VTEwsIE5VTEwsIE5VTEwsDQo+PiAtCQkJJmRvb3JiZWxsX29mZnNldF9pbl9wcm9jZXNzKTsN
Cj4+ICsJZXJyID0gcHFtX2NyZWF0ZV9xdWV1ZSgmcC0+cHFtLCBkZXYsIGZpbGVwLCAmcV9wcm9w
ZXJ0aWVzLCAmcXVldWVfaWQsIHdwdHJfYm8sDQo+PiArCQkJTlVMTCwgTlVMTCwgTlVMTCwgJmRv
b3JiZWxsX29mZnNldF9pbl9wcm9jZXNzKTsNCj4+ICAJaWYgKGVyciAhPSAwKQ0KPj4gIAkJZ290
byBlcnJfY3JlYXRlX3F1ZXVlOw0KPj4gIA0KPj4gQEAgLTM1NCw2ICszODQsOSBAQCBzdGF0aWMg
aW50IGtmZF9pb2N0bF9jcmVhdGVfcXVldWUoc3RydWN0IGZpbGUgKmZpbGVwLCBzdHJ1Y3Qga2Zk
X3Byb2Nlc3MgKnAsDQo+PiAgCXJldHVybiAwOw0KPj4gIA0KPj4gIGVycl9jcmVhdGVfcXVldWU6
DQo+PiArCWlmICh3cHRyX2JvKQ0KPj4gKwkJYW1kZ3B1X2FtZGtmZF9mcmVlX2d0dF9tZW0oZGV2
LT5hZGV2LCB3cHRyX2JvKTsNCj4+ICtlcnJfd3B0cl9tYXBfZ2FydDoNCj4+ICBlcnJfYmluZF9w
cm9jZXNzOg0KPj4gIGVycl9wZGQ6DQo+PiAgCW11dGV4X3VubG9jaygmcC0+bXV0ZXgpOw0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVf
bWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9t
YW5hZ2VyLmMNCj4+IGluZGV4IGIzOWQ4OWM1Mjg4Ny4uZDhkZTJmYmRmYzdkIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2Vy
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVf
bWFuYWdlci5jDQo+PiBAQCAtMjA4LDYgKzIwOCw3IEBAIHN0YXRpYyBpbnQgYWRkX3F1ZXVlX21l
cyhzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwgc3RydWN0IHF1ZXVlICpxLA0KPj4g
IAlzdHJ1Y3Qga2ZkX3Byb2Nlc3NfZGV2aWNlICpwZGQgPSBxcGRfdG9fcGRkKHFwZCk7DQo+PiAg
CXN0cnVjdCBtZXNfYWRkX3F1ZXVlX2lucHV0IHF1ZXVlX2lucHV0Ow0KPj4gIAlpbnQgciwgcXVl
dWVfdHlwZTsNCj4+ICsJdWludDY0X3Qgd3B0cl9hZGRyX29mZjsNCj4+ICANCj4+ICAJaWYgKGRx
bS0+aXNfaHdzX2hhbmcpDQo+PiAgCQlyZXR1cm4gLUVJTzsNCj4+IEBAIC0yMjcsNyArMjI4LDEz
IEBAIHN0YXRpYyBpbnQgYWRkX3F1ZXVlX21lcyhzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIg
KmRxbSwgc3RydWN0IHF1ZXVlICpxLA0KPj4gIAkJCQkJQU1ER1BVX01FU19QUklPUklUWV9MRVZF
TF9OT1JNQUw7DQo+PiAgCXF1ZXVlX2lucHV0LmRvb3JiZWxsX29mZnNldCA9IHEtPnByb3BlcnRp
ZXMuZG9vcmJlbGxfb2ZmOw0KPj4gIAlxdWV1ZV9pbnB1dC5tcWRfYWRkciA9IHEtPmdhcnRfbXFk
X2FkZHI7DQo+PiAtCXF1ZXVlX2lucHV0LndwdHJfYWRkciA9ICh1aW50NjRfdClxLT5wcm9wZXJ0
aWVzLndyaXRlX3B0cjsNCj4+ICsNCj4+ICsJaWYgKHEtPndwdHJfYm8pIHsNCj4+ICsJCXdwdHJf
YWRkcl9vZmYgPSAodWludDY0X3QpcS0+cHJvcGVydGllcy53cml0ZV9wdHIgLSAodWludDY0X3Qp
cS0+d3B0cl9iby0+a2ZkX2JvLT52YTsNCj4+ICsJCXF1ZXVlX2lucHV0LndwdHJfYWRkciA9ICgo
dWludDY0X3QpcS0+d3B0cl9iby0+dGJvLnJlc291cmNlLT5zdGFydCA8PCBQQUdFX1NISUZUKSAr
IHdwdHJfYWRkcl9vZmY7DQo+PiArCX0gZWxzZQ0KPj4gKwkJcXVldWVfaW5wdXQud3B0cl9hZGRy
ID0gKHVpbnQ2NF90KXEtPnByb3BlcnRpZXMud3JpdGVfcHRyOw0KPj4gKw0KPj4gIAlxdWV1ZV9p
bnB1dC5wYWdpbmcgPSBmYWxzZTsNCj4+ICAJcXVldWVfaW5wdXQudGJhX2FkZHIgPSBxcGQtPnRi
YV9hZGRyOw0KPj4gIAlxdWV1ZV9pbnB1dC50bWFfYWRkciA9IHFwZC0+dG1hX2FkZHI7DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3Yx
MS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMS5jDQo+
PiBpbmRleCBmMTY1NGI0ZGE4NTYuLjM1ZTc0YmRkODFkYSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTEuYw0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMS5jDQo+PiBAQCAtMzc3
LDYgKzM3Nyw4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9tcWRfc2RtYShzdHJ1Y3QgbXFkX21hbmFn
ZXIgKm1tLCB2b2lkICptcWQsDQo+PiAgCW0tPnNkbWF4X3JsY3hfcmJfYmFzZV9oaSA9IHVwcGVy
XzMyX2JpdHMocS0+cXVldWVfYWRkcmVzcyA+PiA4KTsNCj4+ICAJbS0+c2RtYXhfcmxjeF9yYl9y
cHRyX2FkZHJfbG8gPSBsb3dlcl8zMl9iaXRzKCh1aW50NjRfdClxLT5yZWFkX3B0cik7DQo+PiAg
CW0tPnNkbWF4X3JsY3hfcmJfcnB0cl9hZGRyX2hpID0gdXBwZXJfMzJfYml0cygodWludDY0X3Qp
cS0+cmVhZF9wdHIpOw0KPj4gKwltLT5zZG1heF9ybGN4X3JiX3dwdHJfcG9sbF9hZGRyX2xvID0g
bG93ZXJfMzJfYml0cygodWludDY0X3QpcS0+d3JpdGVfcHRyKTsNCj4+ICsJbS0+c2RtYXhfcmxj
eF9yYl93cHRyX3BvbGxfYWRkcl9oaSA9IHVwcGVyXzMyX2JpdHMoKHVpbnQ2NF90KXEtPndyaXRl
X3B0cik7DQo+PiAgCW0tPnNkbWF4X3JsY3hfZG9vcmJlbGxfb2Zmc2V0ID0NCj4+ICAJCXEtPmRv
b3JiZWxsX29mZiA8PCBTRE1BMF9RVUVVRTBfRE9PUkJFTExfT0ZGU0VUX19PRkZTRVRfX1NISUZU
Ow0KPj4gIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
cml2LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQo+PiBpbmRleCBh
NWQzOTYzNTM3ZDcuLmRjZGRlZTBkNmYwNiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9wcml2LmgNCj4+IEBAIC02MzksNiArNjM5LDggQEAgc3RydWN0IHF1ZXVlIHsNCj4+
ICAJdm9pZCAqZ2FuZ19jdHhfYm87DQo+PiAgCXVpbnQ2NF90IGdhbmdfY3R4X2dwdV9hZGRyOw0K
Pj4gIAl2b2lkICpnYW5nX2N0eF9jcHVfcHRyOw0KPj4gKw0KPj4gKwlzdHJ1Y3QgYW1kZ3B1X2Jv
ICp3cHRyX2JvOw0KPj4gIH07DQo+PiAgDQo+PiAgZW51bSBLRkRfTVFEX1RZUEUgew0KPj4gQEAg
LTE0MDQsNiArMTQwNiw3IEBAIGludCBwcW1fY3JlYXRlX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1
ZXVlX21hbmFnZXIgKnBxbSwNCj4+ICAJCQkgICAgc3RydWN0IGZpbGUgKmYsDQo+PiAgCQkJICAg
IHN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpwcm9wZXJ0aWVzLA0KPj4gIAkJCSAgICB1bnNpZ25l
ZCBpbnQgKnFpZCwNCj4+ICsJCQkgICAgc3RydWN0IGFtZGdwdV9ibyAqd3B0cl9ibywNCj4+ICAJ
CQkgICAgY29uc3Qgc3RydWN0IGtmZF9jcml1X3F1ZXVlX3ByaXZfZGF0YSAqcV9kYXRhLA0KPj4g
IAkJCSAgICBjb25zdCB2b2lkICpyZXN0b3JlX21xZCwNCj4+ICAJCQkgICAgY29uc3Qgdm9pZCAq
cmVzdG9yZV9jdGxfc3RhY2ssDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+PiBpbmRleCBmOTllMDlkYzQzZWEu
LjNhMTdjMWViYzUyNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+PiBAQCAtMTkwLDcgKzE5MCw4
IEBAIHZvaWQgcHFtX3VuaW5pdChzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0pICBz
dGF0aWMgaW50IGluaXRfdXNlcl9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpw
cW0sDQo+PiAgCQkJCXN0cnVjdCBrZmRfZGV2ICpkZXYsIHN0cnVjdCBxdWV1ZSAqKnEsDQo+PiAg
CQkJCXN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpxX3Byb3BlcnRpZXMsDQo+PiAtCQkJCXN0cnVj
dCBmaWxlICpmLCB1bnNpZ25lZCBpbnQgcWlkKQ0KPj4gKwkJCQlzdHJ1Y3QgZmlsZSAqZiwgc3Ry
dWN0IGFtZGdwdV9ibyAqd3B0cl9ibywNCj4+ICsJCQkJdW5zaWduZWQgaW50IHFpZCkNCj4+ICB7
DQo+PiAgCWludCByZXR2YWw7DQo+PiAgDQo+PiBAQCAtMjIxLDYgKzIyMiw3IEBAIHN0YXRpYyBp
bnQgaW5pdF91c2VyX3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21hbmFnZXIgKnBxbSwNCj4+
ICAJCQlnb3RvIGNsZWFudXA7DQo+PiAgCQl9DQo+PiAgCQltZW1zZXQoKCpxKS0+Z2FuZ19jdHhf
Y3B1X3B0ciwgMCwgQU1ER1BVX01FU19HQU5HX0NUWF9TSVpFKTsNCj4+ICsJCSgqcSktPndwdHJf
Ym8gPSB3cHRyX2JvOw0KPj4gIAl9DQo+PiAgDQo+PiAgCXByX2RlYnVnKCJQUU0gQWZ0ZXIgaW5p
dCBxdWV1ZSIpOw0KPj4gQEAgLTIzNyw2ICsyMzksNyBAQCBpbnQgcHFtX2NyZWF0ZV9xdWV1ZShz
dHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0sDQo+PiAgCQkJICAgIHN0cnVjdCBmaWxl
ICpmLA0KPj4gIAkJCSAgICBzdHJ1Y3QgcXVldWVfcHJvcGVydGllcyAqcHJvcGVydGllcywNCj4+
ICAJCQkgICAgdW5zaWduZWQgaW50ICpxaWQsDQo+PiArCQkJICAgIHN0cnVjdCBhbWRncHVfYm8g
KndwdHJfYm8sDQo+PiAgCQkJICAgIGNvbnN0IHN0cnVjdCBrZmRfY3JpdV9xdWV1ZV9wcml2X2Rh
dGEgKnFfZGF0YSwNCj4+ICAJCQkgICAgY29uc3Qgdm9pZCAqcmVzdG9yZV9tcWQsDQo+PiAgCQkJ
ICAgIGNvbnN0IHZvaWQgKnJlc3RvcmVfY3RsX3N0YWNrLA0KPj4gQEAgLTI5OSw3ICszMDIsNyBA
QCBpbnQgcHFtX2NyZWF0ZV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyICpwcW0s
DQo+PiAgCQkgKiBhbGxvY2F0ZV9zZG1hX3F1ZXVlKCkgaW4gY3JlYXRlX3F1ZXVlKCkgaGFzIHRo
ZQ0KPj4gIAkJICogY29ycmVzcG9uZGluZyBjaGVjayBsb2dpYy4NCj4+ICAJCSAqLw0KPj4gLQkJ
cmV0dmFsID0gaW5pdF91c2VyX3F1ZXVlKHBxbSwgZGV2LCAmcSwgcHJvcGVydGllcywgZiwgKnFp
ZCk7DQo+PiArCQlyZXR2YWwgPSBpbml0X3VzZXJfcXVldWUocHFtLCBkZXYsICZxLCBwcm9wZXJ0
aWVzLCBmLCB3cHRyX2JvLCAqcWlkKTsNCj4+ICAJCWlmIChyZXR2YWwgIT0gMCkNCj4+ICAJCQln
b3RvIGVycl9jcmVhdGVfcXVldWU7DQo+PiAgCQlwcW4tPnEgPSBxOw0KPj4gQEAgLTMyMCw3ICsz
MjMsNyBAQCBpbnQgcHFtX2NyZWF0ZV9xdWV1ZShzdHJ1Y3QgcHJvY2Vzc19xdWV1ZV9tYW5hZ2Vy
ICpwcW0sDQo+PiAgCQkJZ290byBlcnJfY3JlYXRlX3F1ZXVlOw0KPj4gIAkJfQ0KPj4gIA0KPj4g
LQkJcmV0dmFsID0gaW5pdF91c2VyX3F1ZXVlKHBxbSwgZGV2LCAmcSwgcHJvcGVydGllcywgZiwg
KnFpZCk7DQo+PiArCQlyZXR2YWwgPSBpbml0X3VzZXJfcXVldWUocHFtLCBkZXYsICZxLCBwcm9w
ZXJ0aWVzLCBmLCB3cHRyX2JvLCAqcWlkKTsNCj4+ICAJCWlmIChyZXR2YWwgIT0gMCkNCj4+ICAJ
CQlnb3RvIGVycl9jcmVhdGVfcXVldWU7DQo+PiAgCQlwcW4tPnEgPSBxOw0KPj4gQEAgLTQ1Nyw5
ICs0NjAsMTMgQEAgaW50IHBxbV9kZXN0cm95X3F1ZXVlKHN0cnVjdCBwcm9jZXNzX3F1ZXVlX21h
bmFnZXIgKnBxbSwgdW5zaWduZWQgaW50IHFpZCkNCj4+ICAJCQlwZGQtPnFwZC5udW1fZ3dzID0g
MDsNCj4+ICAJCX0NCj4+ICANCj4+IC0JCWlmIChkZXYtPnNoYXJlZF9yZXNvdXJjZXMuZW5hYmxl
X21lcykNCj4+ICsJCWlmIChkZXYtPnNoYXJlZF9yZXNvdXJjZXMuZW5hYmxlX21lcykgew0KPj4g
IAkJCWFtZGdwdV9hbWRrZmRfZnJlZV9ndHRfbWVtKGRldi0+YWRldiwNCj4+ICAJCQkJCQkgICBw
cW4tPnEtPmdhbmdfY3R4X2JvKTsNCj4+ICsJCQlpZiAocHFuLT5xLT53cHRyX2JvKQ0KPj4gKwkJ
CQlhbWRncHVfYW1ka2ZkX2ZyZWVfZ3R0X21lbShkZXYtPmFkZXYsIHBxbi0+cS0+d3B0cl9ibyk7
DQo+PiArDQo+PiArCQl9DQo+PiAgCQl1bmluaXRfcXVldWUocHFuLT5xKTsNCj4+ICAJfQ0KPj4g
IA0KPj4gQEAgLTkwMCw3ICs5MDcsNyBAQCBpbnQga2ZkX2NyaXVfcmVzdG9yZV9xdWV1ZShzdHJ1
Y3Qga2ZkX3Byb2Nlc3MgKnAsDQo+PiAgDQo+PiAgCXByaW50X3F1ZXVlX3Byb3BlcnRpZXMoJnFw
KTsNCj4+ICANCj4+IC0JcmV0ID0gcHFtX2NyZWF0ZV9xdWV1ZSgmcC0+cHFtLCBwZGQtPmRldiwg
TlVMTCwgJnFwLCAmcXVldWVfaWQsIHFfZGF0YSwgbXFkLCBjdGxfc3RhY2ssDQo+PiArCXJldCA9
IHBxbV9jcmVhdGVfcXVldWUoJnAtPnBxbSwgcGRkLT5kZXYsIE5VTEwsICZxcCwgJnF1ZXVlX2lk
LCBOVUxMLCANCj4+ICtxX2RhdGEsIG1xZCwgY3RsX3N0YWNrLA0KPj4gIAkJCQlOVUxMKTsNCj4+
ICAJaWYgKHJldCkgew0KPj4gIAkJcHJfZXJyKCJGYWlsZWQgdG8gY3JlYXRlIG5ldyBxdWV1ZSBl
cnI6JWRcbiIsIHJldCk7DQo+PiAtLQ0KPj4gMi4yNS4xDQo=
