Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD886EF2DA
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Apr 2023 12:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADC810E8DD;
	Wed, 26 Apr 2023 10:54:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F70D10E8B9
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Apr 2023 10:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axjuu3hJUlYZYS02LdiQmvgiRgLEiUfWpheDB4/d4A/PaQ80GlzZHWUp2rnNkD1iy2tHYHmXBB3cBhP+p1c/1cbM3Swy4Wb3TCNxcTPPh0SnPB+YYQLqpqEvHZdaBO1aI0/CQul4vvWLT6en5ZnP1q5ww76C9FMlSKWaaAZC27VDnbXqCCiz0EhoRCFoPyZaoVKV+r0mijP1799tmyFztliRvky9sHetNWawN7CMJnBd7x71fmnylyOsU0Am/91wQqNVBXdgIyrTR1QIdzaiVkc+jFkBSSih4J9hhIr3n2x7wCdZn5aj9Okryk5ZfEsvW/7vXulAuPf7NE4zxhIX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON5tkdeuzPKyHOTAyunZZH+TfH46MbsYbrqnyCXt+uc=;
 b=j3BeHkbWGwSDqAK2bhY2dXS6Tqfy4btopKdC9VFRC8fojSaQ7uX6ICnzqQZwFSLaxOGkem5anWzVPPe8QcWFbvKF25ywfGXdipF9nxqGo9vdBmyG6hxvcVU5WYMuc45GR/uPBiPmum73igJT7fxV9RGS8iNCofOFtSC/3s1kwGDjJvXKqe9/LmdcT5rRwzsHkE2jyFw366uWejiCk93dX7gKGlSmPvv/Yw+ma/kwPYoh/tKvtNAoM3izWtFok22DpAuFOiZXMNDK79QFhxyMMbOOPemShUdW4A5hTtzfPXBUZxwSmbyhVVWin3hVplcV+n6iuO83KZ0znX5k6hQSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON5tkdeuzPKyHOTAyunZZH+TfH46MbsYbrqnyCXt+uc=;
 b=VNvdtwlKbwUdYdHBfxqixZS/biy3eZkYsN/T95VsDN140q9vi9hIwk6Do0Y0rkpPDWT8zeKqCIgBLtvN4DE7e47zrFbhhpYiRBP4RbHGEQ+9aNXb6khZ7I6hKXXVNob0cxQKjNdqyZJ1ahBMe0wHPZ4poCueZ0AJS7FiFoBTGjU=
Received: from BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Wed, 26 Apr
 2023 10:54:16 +0000
Received: from BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::95d1:b78d:686d:2ec6]) by BN9PR12MB5257.namprd12.prod.outlook.com
 ([fe80::95d1:b78d:686d:2ec6%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 10:54:15 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Zhang, Horatio" <Hongkun.Zhang@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/amdgpu: drop gfx_v11_0_cp_ecc_error_irq_funcs
Thread-Topic: [PATCH v3] drm/amdgpu: drop gfx_v11_0_cp_ecc_error_irq_funcs
Thread-Index: AQHZeBrOlde4ohTJIEimAxCdn+C6AK89aEUQ
Date: Wed, 26 Apr 2023 10:54:15 +0000
Message-ID: <BN9PR12MB5257F1F2219414F018C31375FC659@BN9PR12MB5257.namprd12.prod.outlook.com>
References: <20230426084031.5867-1-Hongkun.Zhang@amd.com>
In-Reply-To: <20230426084031.5867-1-Hongkun.Zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7338c674-680f-459b-b2e7-a95af437bd22;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-04-26T10:45:39Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5257:EE_|BL3PR12MB6428:EE_
x-ms-office365-filtering-correlation-id: 4cdc13b0-dae2-42a1-ca19-08db464493e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aqK3i5tnrfaGGmJutFWIQ9+bqpX+eTWRrEqJRKS0nIo4slCdXWRkYKLZbziSYM3js+j/fnonTuaG1Afhi13o4Y1hZNRmDsD0dz4pCNEbsLJWssnbH7Levuk8bae4WQPDSLiZifBa3EmXmjW6c3x0/Gplczkc7ajqS0wmgA5hrE5HyfOowlb4iesCDjic4xhGA4udC3C+NuZuiJV7e3F0m0DaRhGCTi3zIgYZiJx7NX0Ccv9s2/I1vRJL39O1OUL1kfH+gzhK+5q68HNKxLLQWIH2ZVG/VDNTdBe+fy7LterFt6GYGqYgIHrTN+dBZfQ56jLj6/fDe21Vr00zjrVB3tlxcpuMH7DLAyOaP4KWA28JmFDsp8UQtn0roGuwtMgWVeBRpi8qDKOc7t8cnune0VQoeGgivG0hVUiklwOmXbzPQc8cAx3tR0llUi0gCtZbfJ6qbDTnQfEIH+qj7GO1X4WE3WQvc3BQZGPC/bx1iYt3zGtdTtelko14OoIpNCknRRcMfMgR0/2REEniXRAe3+NPpWoVWkniTai6jnLumqI//r2LwwUy6XiUwHRBjahtBr9Efn1PBwl5jW208RiY0+3Ov3NxvsVENpx7hWxOPH6TqxYjokftNEuWkS251x5a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5257.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199021)(83380400001)(66574015)(186003)(9686003)(55016003)(26005)(53546011)(6506007)(64756008)(66446008)(66556008)(66946007)(76116006)(66476007)(86362001)(316002)(122000001)(38100700002)(2906002)(38070700005)(4326008)(41300700001)(54906003)(110136005)(478600001)(33656002)(8676002)(8936002)(5660300002)(52536014)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHN5UmNJblloWHRKRHEwclhHRUNWYUxNeGM0UVJBMHVDaTluRm5rditqYk95?=
 =?utf-8?B?TXBGVyszdC81RHdBbGxneGs3R1ZKSHR5SitabWFJL0VEUzJDMHpMaVBveE1C?=
 =?utf-8?B?Tm9HR04rL09JTzd6V29KWkJwVEJhTnpENEpiZGxpQ2JJNnlMenNJQWJVOHE1?=
 =?utf-8?B?bE9NNWJERUk1MjJYNXJWVFkxanQ0ZWhOb3BHNUVHYXZOM25qcE53cGRqR1ll?=
 =?utf-8?B?SGpETGtZM1VFMG14ZnVpTGRoeHJHVzlxN0g3aFVMUmJiOXluVjROSGlFaTVQ?=
 =?utf-8?B?aEJuNitNSWwvTnhZMXpHaC9XUUNDU2FkV1g5K2x3N2lHeDZoQVlsTFdrNDFh?=
 =?utf-8?B?TzVyNThsVmZTd3pMaEFCaW9teXBTTjhCOCs3MjFZU1lyd2VsMG1IUzhObzFt?=
 =?utf-8?B?SHlqUU9MZUNaaUxpTmxyUmdEdmNrZ0tBTjI0cWFkRXd4MkhUamlkejNPYmNX?=
 =?utf-8?B?dkl1K0FEQnp5bytTeXNneHhualQ1cldZTmExS3FhNk1wTUZmTUZwUVlCd3RK?=
 =?utf-8?B?cS9qcm5RYnpHcGNXc3hUQzRWZ2h6S1FuMDRrOWdRNFY3TzZ0MjcwOTNEd3d3?=
 =?utf-8?B?bHoyWER3NzVmcjNJVFFSeFZqeDZVK1Rnd2hialEySTBlbEV6bkJVQmVTL2hS?=
 =?utf-8?B?TEFmRDh2QU1jWFBKbFRCTENza1ZhZjV1aHBQR2JnTHFtU2t6NE5DdFRpeUhH?=
 =?utf-8?B?L1ErZlZGN3I1RnNhSi8venQvWWVnQlhhKzBaZnJ0OXozL3dYOUxNdERGc3Z3?=
 =?utf-8?B?bUxSOHZKcDFaR0xSWWM0UUxLM3JJOFFiYWZ5L2pHSDcxd0NsNEdJcE1Delk5?=
 =?utf-8?B?aE8xQTZlZm12TGgrRXprUlJPRjNGNXRsOGg3d1cxcG1DYWxlR3NOWE93TVdC?=
 =?utf-8?B?SHpCQUI3RklRMlB3c2wrUjFHaTFLQVpWYmxjb3BVWHk5U1lBVFJkSEk0WnBp?=
 =?utf-8?B?dkQwWE1MZm1GdU1jSlc5UHFXWjU1d0lWSnN5Z25DKzEwT2s5ZE52ODJYdFI2?=
 =?utf-8?B?a1FQU3F3dDU5OXJXOXRxa0RNZzZsZlgvempsSkZkaVJHWkphdGV5aWlWWjNE?=
 =?utf-8?B?ZXduTFFZNGpjeEdFOXc1VWg4TXRiZ05BWlV2RXZtYTkyWFNSMGErZ00vbEdu?=
 =?utf-8?B?SG9NTVVwMEZ0cXVBbHI2QVcrVitPRGR6TUxvaW9XMWlxdVdubVVEaWRyNjBr?=
 =?utf-8?B?U24zSHlyNi9KL0pBTHJCN2JsMnVGSXZWVVUxMVNBS3dKeURXbkFZOTBGWjBY?=
 =?utf-8?B?VmJDYjZTMDBHVGhDZlBHMWVoR3BaRU9hN0dHNmU5cEc0aXB5blBtN2RkcUYw?=
 =?utf-8?B?emJaTWIzcDlJZk1Dc1c5aE5jV1pvT2pwZkE0cXArb2tSVG01dkZtYmRNL3Bk?=
 =?utf-8?B?dFJmM0FKV083UGJhNWNzbVFNUnc1azZoUlV0MURPNWlLRnN3MkZ0Z1ZMSjRR?=
 =?utf-8?B?cEdORFJMSG5obzRONkY1eW1yanBFc0Y1N01ZZDBVcFFEQUFVaHpPNzdkS3VM?=
 =?utf-8?B?WmNyd3M3am5RMUxmTDQreDZsTVBLRjkwOC9tbHhKREgxL1J4MUdzbGdBclFJ?=
 =?utf-8?B?TmFRcVdnV043UjNyQ2FOMEY0bi8yblY1Y1JnRk5HNFlWTFdqV2lKa01jclVV?=
 =?utf-8?B?V0VrS3RoOXFPUFhJVm96bVl6ZTlQZDErYVRzNUgzb3J2RiszRkY0ZzZjNUVQ?=
 =?utf-8?B?NlhpeGlWeTEySmhYZWlNQU85aTMrM0JRekUrNlhubU1Dam9ycWdja3NtRWVX?=
 =?utf-8?B?cjF2N1VBaUZqTitJbmpxOVpNM0g0MmlWeW02cHpKRkJ0WFRXVUtDendSS1Nk?=
 =?utf-8?B?YVBxaC9KYlNCNWp1cFgxUThmTFRvV2hjYUZDV01pRHdYNzYxSS94QVkzaHY0?=
 =?utf-8?B?ZmtRQzBzV2lCcERBSkx0QVpRcDgxSzVnaFdQWWppNXFIdWhQQXJYc0dsWTJl?=
 =?utf-8?B?TW05c3BIU25QUlZFM3dLS3Y5dzVnU2dwZEhOblZlRmxrdm5lMEl1YUhyTkht?=
 =?utf-8?B?b0tWUEppSGl4MG1JT3ZsblhaaVAwSUg3eWU5eEVqQTI3cER3T3E3K2xzblZR?=
 =?utf-8?B?dDNTa29ya0RXQ2lnL0FYTWxmYXBWRHBZcGNBT0ZKbERnVmJuY0s2Yk9tWWN2?=
 =?utf-8?Q?FboNa5NuIjjMlG6XP68dG245D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5257.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdc13b0-dae2-42a1-ca19-08db464493e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 10:54:15.5492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtBpUQTqQXcXpJU0AF94ZG0xSFXKKC+Q31L2RM3Whc72rgI6uzoib3Fnw6rZziNSR3ryi481dp2dKJlc13dPPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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
Cc: "Yao, Longlong" <Longlong.Yao@amd.com>, "Xu, Feifei" <Feifei.Xu@amd.com>,
 "Zhang, Horatio" <Hongkun.Zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCmFtZGdwdV9nZnhfcmFzX2xhdGVf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IHJhc19jb21tb25faWYgKnIN
CiAgICAgICAgICAgICAgICBpZiAocikNCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBy
Ow0KDQotICAgICAgICAgICAgICAgciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5nZngu
Y3BfZWNjX2Vycm9yX2lycSwgMCk7DQotICAgICAgICAgICAgICAgaWYgKHIpDQotICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGxhdGVfZmluaTsNCisgICAgICAgICAgICAgICBpZiAoIShhZGV2
LT5pcF92ZXJzaW9uc1tHQ19IV0lQXVswXSA9PSBJUF9WRVJTSU9OKDExLCAwLCAzKSkpew0KKyAg
ICAgICAgICAgICAgICAgICAgICAgciA9IGFtZGdwdV9pcnFfZ2V0KGFkZXYsICZhZGV2LT5nZngu
Y3BfZWNjX2Vycm9yX2lycSwgMCk7DQorICAgICAgICAgICAgICAgICAgICAgICBpZiAocikNCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBsYXRlX2Zpbmk7DQorICAgICAgICAg
ICAgICAgfQ0KDQpHRlgxMSBkb2Vzbid0IHN1cHBvcnQgU1JBTSBSQVMuIEdGWF9SQVMgTUFTSyBz
aG91bGQgKm5vdCogYmUgc2V0LiBBcyBhIHJlc3VsdCwgYW1kZ3B1X2dmeF9yYXNfbGF0ZV9pbml0
IHNob3VsZCAqbm90KiBnbyB0byB0aGUgY29kZSBwYXRoIGFzIGFib3ZlLiBUaGUgZXhwZWN0YXRp
b24gaXMgYW1kZ3B1X2dmeF9yYXNfbGF0ZV9pbml0IG9ubHkgaXNzdWVzIGFuIGVuYWJsZSBjb21t
YW5kIHRvIHByb2dyYW0gR0JfRURDX01PREUuDQoNCkNhbiB5b3UgcGxlYXNlIGZ1cnRoZXIgY2hl
Y2sgaWYgR0ZYX1JBUyBtYXNrIGlzIHNldCBpbiB5b3VyIGNhc2U/IGlmIHNvLCBpdCBjb3VsZCBi
ZSBhbiBJRldJIGlzc3VlLg0KDQoNClJlZ2FyZHMsDQpIYXdraW5nDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBIb3JhdGlvIFpoYW5nIDxIb25na3VuLlpoYW5nQGFtZC5jb20+
DQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI2LCAyMDIzIDE2OjQxDQpUbzogWmhhbmcsIEhhd2tp
bmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4u
S29lbmlnQGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFh1LCBGZWlmZWkgPEZlaWZlaS5YdUBhbWQu
Y29tPjsgWWFvLCBMb25nbG9uZyA8TG9uZ2xvbmcuWWFvQGFtZC5jb20+OyBaaGFuZywgSG9yYXRp
byA8SG9uZ2t1bi5aaGFuZ0BhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT47IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQ
QVRDSCB2M10gZHJtL2FtZGdwdTogZHJvcCBnZnhfdjExXzBfY3BfZWNjX2Vycm9yX2lycV9mdW5j
cw0KDQpUaGUgZ2Z4LmNwX2VjY19lcnJvcl9pcnEgaXMgcmV0aXJlZCBpbiBnZngxMS4gSW4gZ2Z4
X3YxMV8wX2h3X2Zpbmkgc3RpbGwgdXNlIGFtZGdwdV9pcnFfcHV0IHRvIGRpc2FibGUgdGhpcyBp
bnRlcnJ1cHQsIHdoaWNoIGNhdXNlZCB0aGUgY2FsbCB0cmFjZSBpbiB0aGlzIGZ1bmN0aW9uLg0K
DQpbICAxMDIuODczOTU4XSBDYWxsIFRyYWNlOg0KWyAgMTAyLjg3Mzk1OV0gIDxUQVNLPg0KWyAg
MTAyLjg3Mzk2MV0gIGdmeF92MTFfMF9od19maW5pKzB4MjMvMHgxZTAgW2FtZGdwdV0gWyAgMTAy
Ljg3NDAxOV0gIGdmeF92MTFfMF9zdXNwZW5kKzB4ZS8weDIwIFthbWRncHVdIFsgIDEwMi44NzQw
NzJdICBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2UyKzB4MjQwLzB4NDYwIFthbWRncHVd
IFsgIDEwMi44NzQxMjJdICBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmQrMHgzZC8weDgwIFthbWRn
cHVdIFsgIDEwMi44NzQxNzJdICBhbWRncHVfZGV2aWNlX3ByZV9hc2ljX3Jlc2V0KzB4ZDkvMHg0
OTAgW2FtZGdwdV0gWyAgMTAyLjg3NDIyM10gIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIuY29s
ZCsweDU0OC8weGNlNiBbYW1kZ3B1XSBbICAxMDIuODc0MzIxXSAgYW1kZ3B1X2RlYnVnZnNfcmVz
ZXRfd29yaysweDRjLzB4NzAgW2FtZGdwdV0gWyAgMTAyLjg3NDM3NV0gIHByb2Nlc3Nfb25lX3dv
cmsrMHgyMWYvMHgzZjAgWyAgMTAyLjg3NDM3N10gIHdvcmtlcl90aHJlYWQrMHgyMDAvMHgzZTAg
WyAgMTAyLjg3NDM3OF0gID8gcHJvY2Vzc19vbmVfd29yaysweDNmMC8weDNmMCBbICAxMDIuODc0
Mzc5XSAga3RocmVhZCsweGZkLzB4MTMwIFsgIDEwMi44NzQzODBdICA/IGt0aHJlYWRfY29tcGxl
dGVfYW5kX2V4aXQrMHgyMC8weDIwDQpbICAxMDIuODc0MzgxXSAgcmV0X2Zyb21fZm9yaysweDIy
LzB4MzANCg0KdjI6DQotIEhhbmRsZSB1bWMgYW5kIGdmeCByYXMgY2FzZXMgaW4gc2VwYXJhdGVk
IHBhdGNoDQotIFJldGlyZWQgdGhlIGdmeF92MTFfMF9jcF9lY2NfZXJyb3JfaXJxX2Z1bmNzIGlu
IGdmeDExDQoNCnYzOg0KLSBJbXByb3ZlIHRoZSBzdWJqZWN0IGFuZCBjb2RlIGNvbW1lbnRzDQot
IEFkZCBqdWRnbWVudCBvbiBnZngxMSBpbiB0aGUgZnVuY3Rpb24gb2YgYW1kZ3B1X2dmeF9yYXNf
bGF0ZV9pbml0DQoNClNpZ25lZC1vZmYtYnk6IEhvcmF0aW8gWmhhbmcgPEhvbmdrdW4uWmhhbmdA
YW1kLmNvbT4NClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+DQpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KUmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jIHwgIDggKysrKy0tICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYyAgfCAzOCAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dm
eC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQppbmRleCA2MGJi
NGJiYTE5OTQuLjVlNjllZWM0Yjc1NCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZnguYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dmeC5jDQpAQCAtNzE5LDkgKzcxOSwxMSBAQCBpbnQgYW1kZ3B1X2dmeF9yYXNfbGF0ZV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcg0K
ICAgICAgICAgICAgICAgIGlmIChyKQ0KICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7
DQoNCi0gICAgICAgICAgICAgICByID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPmdmeC5j
cF9lY2NfZXJyb3JfaXJxLCAwKTsNCi0gICAgICAgICAgICAgICBpZiAocikNCi0gICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gbGF0ZV9maW5pOw0KKyAgICAgICAgICAgICAgIGlmICghKGFkZXYt
PmlwX3ZlcnNpb25zW0dDX0hXSVBdWzBdID09IElQX1ZFUlNJT04oMTEsIDAsIDMpKSl7DQorICAg
ICAgICAgICAgICAgICAgICAgICByID0gYW1kZ3B1X2lycV9nZXQoYWRldiwgJmFkZXYtPmdmeC5j
cF9lY2NfZXJyb3JfaXJxLCAwKTsNCisgICAgICAgICAgICAgICAgICAgICAgIGlmIChyKQ0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGxhdGVfZmluaTsNCisgICAgICAgICAg
ICAgICB9DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgYW1kZ3B1X3Jhc19mZWF0
dXJlX2VuYWJsZV9vbl9ib290KGFkZXYsIHJhc19ibG9jaywgMCk7DQogICAgICAgIH0NCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTFfMC5jDQppbmRleCA4YTRjNDc2OWU2MDcuLmU5NDkx
YWVjM2NhZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTFf
MC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuYw0KQEAgLTEz
NTUsMTMgKzEzNTUsNiBAQCBzdGF0aWMgaW50IGdmeF92MTFfMF9zd19pbml0KHZvaWQgKmhhbmRs
ZSkNCiAgICAgICAgaWYgKHIpDQogICAgICAgICAgICAgICAgcmV0dXJuIHI7DQoNCi0gICAgICAg
LyogRUNDIGVycm9yICovDQotICAgICAgIHIgPSBhbWRncHVfaXJxX2FkZF9pZChhZGV2LCBTT0My
MV9JSF9DTElFTlRJRF9HUkJNX0NQLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEdGWF8xMV8wXzBfX1NSQ0lEX19DUF9FQ0NfRVJST1IsDQotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJmFkZXYtPmdmeC5jcF9lY2NfZXJyb3JfaXJxKTsNCi0gICAgICAgaWYgKHIp
DQotICAgICAgICAgICAgICAgcmV0dXJuIHI7DQotDQogICAgICAgIC8qIEZFRCBlcnJvciAqLw0K
ICAgICAgICByID0gYW1kZ3B1X2lycV9hZGRfaWQoYWRldiwgU09DMjFfSUhfQ0xJRU5USURfR0ZY
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdGWF8xMV8wXzBfX1NSQ0lEX19S
TENfR0NfRkVEX0lOVEVSUlVQVCwNCkBAIC00NDgzLDcgKzQ0NzYsNiBAQCBzdGF0aWMgaW50IGdm
eF92MTFfMF9od19maW5pKHZvaWQgKmhhbmRsZSkNCiAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7DQogICAgICAgIGludCBy
Ow0KDQotICAgICAgIGFtZGdwdV9pcnFfcHV0KGFkZXYsICZhZGV2LT5nZnguY3BfZWNjX2Vycm9y
X2lycSwgMCk7DQogICAgICAgIGFtZGdwdV9pcnFfcHV0KGFkZXYsICZhZGV2LT5nZngucHJpdl9y
ZWdfaXJxLCAwKTsNCiAgICAgICAgYW1kZ3B1X2lycV9wdXQoYWRldiwgJmFkZXYtPmdmeC5wcml2
X2luc3RfaXJxLCAwKTsNCg0KQEAgLTU5NzAsMjggKzU5NjIsNiBAQCBzdGF0aWMgdm9pZCBnZnhf
djExXzBfc2V0X2NvbXB1dGVfZW9wX2ludGVycnVwdF9zdGF0ZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldg0KICAgICAgICAgICAgICAgIFdSRUczMl9TT0MxNV9JUChHQywgcmVnX2FkZHIsIHRt
cCk7IFwNCiAgICAgICAgfSB3aGlsZSAoMCkNCg0KLXN0YXRpYyBpbnQgZ2Z4X3YxMV8wX3NldF9j
cF9lY2NfZXJyb3Jfc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRn
cHVfaXJxX3NyYyAqc291cmNlLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCB0eXBlLA0KLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGFtZGdwdV9pbnRlcnJ1cHRf
c3RhdGUgc3RhdGUpDQotew0KLSAgICAgICB1aW50MzJfdCBlY2NfaXJxX3N0YXRlID0gMDsNCi0g
ICAgICAgdWludDMyX3QgcGlwZTBfaW50X2NudGxfYWRkciA9IDA7DQotICAgICAgIGludCBpID0g
MDsNCi0NCi0gICAgICAgZWNjX2lycV9zdGF0ZSA9IChzdGF0ZSA9PSBBTURHUFVfSVJRX1NUQVRF
X0VOQUJMRSkgPyAxIDogMDsNCi0NCi0gICAgICAgcGlwZTBfaW50X2NudGxfYWRkciA9IFNPQzE1
X1JFR19PRkZTRVQoR0MsIDAsIHJlZ0NQX01FMV9QSVBFMF9JTlRfQ05UTCk7DQotDQotICAgICAg
IFdSRUczMl9GSUVMRDE1X1BSRVJFRyhHQywgMCwgQ1BfSU5UX0NOVExfUklORzAsIENQX0VDQ19F
UlJPUl9JTlRfRU5BQkxFLCBlY2NfaXJxX3N0YXRlKTsNCi0NCi0gICAgICAgZm9yIChpID0gMDsg
aSA8IGFkZXYtPmdmeC5tZWMubnVtX3BpcGVfcGVyX21lYzsgaSsrKQ0KLSAgICAgICAgICAgICAg
IFNFVF9FQ0NfTUVfUElQRV9TVEFURShwaXBlMF9pbnRfY250bF9hZGRyICsgaSAqIENQX01FMV9Q
SVBFX0lOU1RfQUREUl9JTlRFUlZBTCwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlY2NfaXJxX3N0YXRlKTsNCi0NCi0gICAgICAgcmV0dXJuIDA7DQotfQ0KLQ0KIHN0
YXRpYyBpbnQgZ2Z4X3YxMV8wX3NldF9lb3BfaW50ZXJydXB0X3N0YXRlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmMgKnNyYywNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgdHlwZSwNCkBAIC02NDA4LDExICs2Mzc4LDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBnZnhfdjExXzBfcHJpdl9p
bnN0X2lycV9mdW5jcyA9IHsNCiAgICAgICAgLnByb2Nlc3MgPSBnZnhfdjExXzBfcHJpdl9pbnN0
X2lycSwNCiB9Ow0KDQotc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBn
ZnhfdjExXzBfY3BfZWNjX2Vycm9yX2lycV9mdW5jcyA9IHsNCi0gICAgICAgLnNldCA9IGdmeF92
MTFfMF9zZXRfY3BfZWNjX2Vycm9yX3N0YXRlLA0KLSAgICAgICAucHJvY2VzcyA9IGFtZGdwdV9n
ZnhfY3BfZWNjX2Vycm9yX2lycSwNCi19Ow0KLQ0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2lycV9zcmNfZnVuY3MgZ2Z4X3YxMV8wX3JsY19nY19mZWRfaXJxX2Z1bmNzID0gew0KICAgICAg
ICAucHJvY2VzcyA9IGdmeF92MTFfMF9ybGNfZ2NfZmVkX2lycSwNCiB9Ow0KQEAgLTY0MjgsOSAr
NjM5Myw2IEBAIHN0YXRpYyB2b2lkIGdmeF92MTFfMF9zZXRfaXJxX2Z1bmNzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQ0KICAgICAgICBhZGV2LT5nZngucHJpdl9pbnN0X2lycS5udW1fdHlw
ZXMgPSAxOw0KICAgICAgICBhZGV2LT5nZngucHJpdl9pbnN0X2lycS5mdW5jcyA9ICZnZnhfdjEx
XzBfcHJpdl9pbnN0X2lycV9mdW5jczsNCg0KLSAgICAgICBhZGV2LT5nZnguY3BfZWNjX2Vycm9y
X2lycS5udW1fdHlwZXMgPSAxOyAvKiBDUCBFQ0MgZXJyb3IgKi8NCi0gICAgICAgYWRldi0+Z2Z4
LmNwX2VjY19lcnJvcl9pcnEuZnVuY3MgPSAmZ2Z4X3YxMV8wX2NwX2VjY19lcnJvcl9pcnFfZnVu
Y3M7DQotDQogICAgICAgIGFkZXYtPmdmeC5ybGNfZ2NfZmVkX2lycS5udW1fdHlwZXMgPSAxOyAv
KiAweDgwIEZFRCBlcnJvciAqLw0KICAgICAgICBhZGV2LT5nZngucmxjX2djX2ZlZF9pcnEuZnVu
Y3MgPSAmZ2Z4X3YxMV8wX3JsY19nY19mZWRfaXJxX2Z1bmNzOw0KDQotLQ0KMi4zNC4xDQoNCg==
