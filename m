Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5BCA5D0CE
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Mar 2025 21:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377F110E239;
	Tue, 11 Mar 2025 20:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rkEk57pt";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD0510E681
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Mar 2025 20:32:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLBzTRjLtq+smxEANnFX8yKP0Ru1aYDD2LzcI+CJ+RL70gDGTP+tmHeM36NZbgQn+joau238CMCTuO3QDhAMaDOk6ilP6+W/fIZim3unzW9x8a51EInYMcwpYxxe2VYMvOhucqs90dMwcrVB1AkCRMnVm8xurDJ1m4eAWDjlrcGhsAP7Cf+Zv6AJOmVScXFemD0+gAXCN4GjYr4YuhVQOr4Hs5oHqjJhKLKM0HeIJjyT30XtstGEoyAmMtGOxZ0+xJ+LWIGgah1AIu05GMwsgd5SBxR0nu7nv5m4LVMFGe/rCAJ1awc4palmstAHkzbnybg/AEKFCZXeh1bQgot9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y/d2+Uc56hzQ8dOyku9f3CHjUbCsjHj70uDcaONhgU=;
 b=bPZCR4uhSxMZdhglI4EMz2TffQkc8aIw7wRUNjsjExpmtvc2A1fTuJhXwfXpUH0n640qkMVYSZlbc0MjQT7x+xB+rLDINdfX/Uy4gdumMRkA367XdW9m7zs99CVWDk9SjedrHoBgBOVa96I5Xr62LtS5zzUMyGOwXXy6YCbAL+30JW+eK0at2JnImDyltIBkYbE6fUulDuZKq6MUzjtA2v8HCXhYBoNxtWNdL4yodoD+k6n7ftw25A0zP3//UiZHEwkmfcv6Tsgec2d8MF5OYli7XxbafjxBgl2V/hVsCMfzPqlLoKLtqQcejX58OaH7i2fVt8tFh3JkZPXQSgYE3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y/d2+Uc56hzQ8dOyku9f3CHjUbCsjHj70uDcaONhgU=;
 b=rkEk57pt2aimMmTQSojfNgXxMPQv56GlnDZGfVG7xXWoAagBK8HD+1qtcCXQIQw5GCovFYXEtAj6p9QtMuTWuB5XASMbKLbWiY+J4ZtXGCa0yQe8jd5CSsPeqz71yb40MybuwhI7by9o7ihbpA7HlqyJIApPiBEMZ154ARZGwqg=
Received: from BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:32:18 +0000
Received: from BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::8989:59a5:1a4a:60b8]) by BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::8989:59a5:1a4a:60b8%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 20:32:18 +0000
From: "Joshi, Mukul" <Mukul.Joshi@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu/gfx12: don't read registers in mqd init
Thread-Topic: [PATCH 2/2] drm/amdgpu/gfx12: don't read registers in mqd init
Thread-Index: AQHbjhAnPEU3kJJgq0mx/zxfxAyFzbNuZfGAgAAHHpA=
Date: Tue, 11 Mar 2025 20:32:18 +0000
Message-ID: <BL3PR12MB642592558A9512FD875674DBEED12@BL3PR12MB6425.namprd12.prod.outlook.com>
References: <20250305204929.1214682-1-alexander.deucher@amd.com>
 <20250305204929.1214682-2-alexander.deucher@amd.com>
 <CADnq5_PgS0K+nRv3Hk6UzfFwgFLkRRt_MuTzcBVk6+J10PE3CA@mail.gmail.com>
In-Reply-To: <CADnq5_PgS0K+nRv3Hk6UzfFwgFLkRRt_MuTzcBVk6+J10PE3CA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=d6eadd8c-91d7-4f98-bebc-691dd2b96938;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-11T20:32:05Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6425:EE_|BL3PR12MB6404:EE_
x-ms-office365-filtering-correlation-id: 9ba0acdd-7d1a-4df6-0365-08dd60dbd13c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U010SzljdUJYVmZmRE40aHFVb0p2UzJNQWd6OU4xZXdMT3lySy93RkpzTXgy?=
 =?utf-8?B?NHVpVHZlb1BqVjhYY05seDM1VkpjTXM1ZUhLaXZ3YWsxVkZJT2k4T2VyM0lZ?=
 =?utf-8?B?M1lNMXBGVGNUNGpFaHZEb2xZR00rci9abE5QT2lObFBjdFd3WnJNZi80bXU0?=
 =?utf-8?B?aHhSRUNzKzlZdTZBdWdvaU9uLy93RDBIcFlMTUp3MjVNeTgxU0hpOVBjMWhG?=
 =?utf-8?B?UURlZkJYT3pGekUvMncyK3ZmR2U3MlJNY3QrSVpjd1NlRm1SaktmK3gyQTVG?=
 =?utf-8?B?Uy9OVjB5TXdWN1M0UTk4MGZQUE9ZMWxoM3N0THhJcXdwWWZHVnlDUjZNM0Nt?=
 =?utf-8?B?RUlrTzVSRlpQQTRqRFZveE0zbGNVZEdMNGlQb1J4d3JwaCtPek51SmQzRHdX?=
 =?utf-8?B?SVZqL1Q0ME50cjNxVTZoRE94ZVVISU15MGMzeElHd1Q3bTdSbWZFbENiVkdY?=
 =?utf-8?B?L3ZZeEpxK2M2RWduL3k2Ym9OV01pdW15MlN6VktFOHhaZTFFQU9DVGxXN1Bp?=
 =?utf-8?B?QWRuU3JwQzBUeEVjZ213d0dsRTd1RDI5OWVFQ2dyODlaZ2xtTDc3TXZwM3l2?=
 =?utf-8?B?aEk1Ym0vOXBXM3RxTXRtVWlsRzFEUmlucXplelh2bEFlVVpxOUx2REZmaVpp?=
 =?utf-8?B?blh5eFJ0cDRud0svamZac2JVY0Q0K3BrWEFxMXU0M3F0MWpHa1BMd3VkbVhW?=
 =?utf-8?B?UkJnQ0RZeWxxWmF4b09VWXJVTmp2Y3N3OXFVVStPU1YvY2RtK0g4NWlDdm01?=
 =?utf-8?B?bWhSOTFHcHp2Y3NGUTc3MHlsVmo2NEZ1Y3JlbU13UnRSZzJ3eHZWWWRzVldq?=
 =?utf-8?B?eXh3eDJQT3JRSUxxcGJhcm91T2JRNFE4WlhvUG41dkljdVRZZm9PVHNkc0J1?=
 =?utf-8?B?ZnJ0ZFkwekoveWJ6QlAxR2MxME90TFpRcXVVT2tzNG5MeDZrTEVHTWMvblpX?=
 =?utf-8?B?T09TZmZqZGJPWkRTWklhQkYzakFYTDNPMG9GWjRwWWx3TmNTSWluVXJLdTVo?=
 =?utf-8?B?VkpMWUJLMVZEYVA2UDc4aGJsOUl2VVlrSWtIVlRnbzRsUHNlejBGbzRpalRH?=
 =?utf-8?B?cGQrTlZyU0pFbnVPZmJLck9KTC82c1NZQkg2cFlMUHA4UVFCeGR5Mm9Mem5p?=
 =?utf-8?B?VG5ZRUJsNU9KNUhCL250dkRBKzB3d25HbS8xQmt3RjFTeEd3UWRrelY1cjky?=
 =?utf-8?B?L3VyL2JZYzdsOHl4WXZpc2VaZlpSL1Ird3l0ZXNyRG50MkI3NlZyOHVIR090?=
 =?utf-8?B?QzU4VTUxZFZJYW9UcTUveVJnUWx3b0tvMXptQUdOQTY2MFVCcHFQK1AvbWU3?=
 =?utf-8?B?dGpTdGFBclFKczRsTGVsTXdNQW9PQzQ4NzlPZjlvSXBxNDhjYk1FQkRjK2th?=
 =?utf-8?B?Q2lQQlArWWl1OXVJS0tRTmdjdVVLUi9GVU9qc0tpeWN2RGgzd0J6VFpmRk1X?=
 =?utf-8?B?a213c1YzbGlFcnUzWlM5ZTZUSkY2TXBzTlNhUUVxSzZkQ2JTWlNSMk9ESzZo?=
 =?utf-8?B?ZmplL3FoMmd5eG9tT2FIa04zb1B4QmltSjNiK08zcGdPS3U2NVIzbm1KL3Np?=
 =?utf-8?B?bUg4Wk5LV2pBMnBWT2hpS1NTUXEwYnNxMzkzeVdpTUJMaU15dnJQT3Y2UnpT?=
 =?utf-8?B?S2NiRkRLT3RrZWYzYzhOU3lJd3JjTTdpbjBYUGtEV0RxaEhISzNOMlVlbVhp?=
 =?utf-8?B?bERvSGxsa3RkdURWRzJhRWRYSElRa3hBenBiOW15dElBRk54empaUHBTQjBD?=
 =?utf-8?B?dHRheU05OXFRRytWaEMybkJZajV1dEpGYmZPejk4RTZkR2ZrMGV2cnFYMWti?=
 =?utf-8?B?SS96RlB5RGkyWVVZbHFwMmlkOVBuS2xKSEdua25xWURNQUdqOVpubWZSUkpt?=
 =?utf-8?B?NnRFQVZwWkVSL29RSXkzaFNZODJIWWkrTU9RTmZVRDVEaXF4VUUzbDF4K2lj?=
 =?utf-8?Q?jnWsQrGDjhqadO+5H5MazcxjlreJT3VO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6425.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWNWaHU4eTVlaVJ5dXo5aW1NZ1NxUmhacVVKZW9VUjcxb29DNVd2NEdWU3ZB?=
 =?utf-8?B?QmwyY2UvbHZtMThIQjJrTHJpMVFVVW9sUWM4OEVxUzlTbGhvanl0dnF0NUNU?=
 =?utf-8?B?b0p1N2Z5ZHVsN0xjOXVhQ2dVMzVGdjVld0xTc21HbFdNb1JRRE9jcXRLVElx?=
 =?utf-8?B?ZDFaaFcwWTA5dTB4bmJ3Sng0ZDFWZk1DOTZBby9sRlF3eUpaRWViTThnSC9N?=
 =?utf-8?B?R1Zodnl1UGdEeHpkZXNvYmoveFFmSUVPeElIOEk3Sk8vNmJITFFaTU1TWlhu?=
 =?utf-8?B?Vjd1U254TXVmbWZHQXY4WEl2VmZ2cWdDZnpVL0hsVnpSU2FWSFcxcTZqSEZy?=
 =?utf-8?B?VEVqM0hubUZMQWl3dFRhT2I1dW9uNnIyQlVXSmk5eHdhT3JUUnVCcXdFSkh1?=
 =?utf-8?B?b0x5UFFoc2w0c2lxeWVXMW9kcktxNHAzeC9Scno1RlZoaUpTUGlTL1FEREs0?=
 =?utf-8?B?R3dPMmU3NDRMc0RLbmtlV3BBS3hqT0NLWWNtVGpLaERmaldUTmhxNDM1aXdw?=
 =?utf-8?B?WUhXb1M0eVNBczJpTWdFenBxZ1Vtc2Jzc3MzWnFjb2JGVWJ5Ukk4Sjc2M0RK?=
 =?utf-8?B?eER0M1dPYm9tTE4xTUZ0dURiVDl0Qkt0SjVmQnNuZlZISHNCWktDb3h5L3Mz?=
 =?utf-8?B?NlNpTmJnM3M1WW1acEVKUXN6eUZEQWJTTm5rN3hvSW01UHdxU3VVbFpDVHVk?=
 =?utf-8?B?RmROa1JDT095eDhOVzFPMG94dUpXUXU1N2RHUk9SRjQ0dmo4RVFCNVMvOHlm?=
 =?utf-8?B?R3Y0eWZHTlF6QzdtaHU1YjBvcUxkclFwL0tWdFlUYkZEd3UxZzF4U3F4ZFBo?=
 =?utf-8?B?NWhjSENLSkptaDRKM0lOcWY4V3NQOWFrZExrQmxaMWUybVgxN0xFVUFHRWZ5?=
 =?utf-8?B?ODVuZ1NmVWFnL2x4OXIzdDRmQVRZUW4wWHk0UHp5WFUxTVdUUkNQKzdzMkw2?=
 =?utf-8?B?T0txK0I3WkVzaEdCSTZCQVFmN2ZHdUQ0dUo2cDJFcXNoVHIzemdRcHBQU3RD?=
 =?utf-8?B?ZVNMT2tOYzN5eXhSaFprUUpvNm1zT0tyeW85YWt4Z1JZUTFNbWVqQ2lsQlJu?=
 =?utf-8?B?bHh3OEZTZzJHMmJvUTAxbkk2aDdyVUdwVy96WVBIWjlvNzdjK0NSdjNDRTRN?=
 =?utf-8?B?OWh2aFA4OHFsTEIrUVJqQk5vUzlTK3ZEeGVCY2pjdUZxNjdvSDRHbS9RM2x6?=
 =?utf-8?B?TTZzaE40RkxBZW9pdUdJUHJhSXF0U004aWlMNHAzTXU3ZXBtc0FVbTF4SXR4?=
 =?utf-8?B?WXVqVi9nd3ErNGdTT1E2SFZlOHNacEhIcVc1cnQxN3JuMU5xRm9seDZJd0Mw?=
 =?utf-8?B?eDYxTDJ4ZUJ1MmpCcFgrOHdWdDBsTzUxaWhvR3IvMElnODlybXNsOEtQcUt1?=
 =?utf-8?B?OTFHdEo3K3RTT3lQV2JGM0IwdzlZbWc5czU4TVFiYzhzbWkvVUkyZGg3YnNP?=
 =?utf-8?B?OHJjQ1lleDR3Y2t0N1J3YmZOWVhGYWVHdmpMWG53K0hBd1BWenlNSHJLTzIx?=
 =?utf-8?B?eTBpbXhwbEFXVEs0aUlITWVkWHdOelpJTHNTeitDYlhNczVFYmpmWDBraEpz?=
 =?utf-8?B?UzQ4T2pIaVFyb2RFazRwSFQySWJGSjJVRjY5MTJpRXlyaHNGcURUcWVoUlkz?=
 =?utf-8?B?SFFyanFDcmZHaXBhQzE2YXF4OHBUYkxlcjNnS0xFTEhsOW9nSzA1N3NhN3NY?=
 =?utf-8?B?Y1JVNjZJL3pHRWZkWXdFUm5NY3BxWG95Ymo5akpvcGg4MlFXZkNYaS9vOHFk?=
 =?utf-8?B?VG43RGtTMWdDMnRIaUlJczY4VnVuNC8rZ3FYb0wvakN6NzRUTTU4VVNseHB0?=
 =?utf-8?B?dEFaalZYV0FGT2dwcWNzUmVpZ3VjcDZ5cjBidXJZTXBqNG4xM3pQM1dHNzgx?=
 =?utf-8?B?b1VPZ1V0bENtSjRnOTQ3Wk9UUCtTZHJ4R25LZG9VMFJYOXlzT1djRkdpVFFY?=
 =?utf-8?B?cjdaR0cxSEhxNGZ3MC9wZDJoSC9HcmdvOFhwNzEzWDdwV21TV2REazFubWV0?=
 =?utf-8?B?TmFtVXFZb1RPbE1MZkx0SjF6NUN1emNmaytFSkpEaldvY0VVbHRTMVdpMmd0?=
 =?utf-8?B?U3VsQ1hzR2tBY3pKaFlaaWMrcElvUXpWUytscmhNd2ZjZDZOR0paRklWaFhN?=
 =?utf-8?Q?VoEY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6425.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba0acdd-7d1a-4df6-0365-08dd60dbd13c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 20:32:18.0410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1f6XWxOmX+ddEa530BDPOG3/ysrh6HZ+zxbi0mCoLAwf2pMkZjbGHnHhRpQ9QIcQ+DyvflYye7n8pp/+3aGnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KU2VyaWVzIGlzOg0KUmV2aWV3ZWQtYnk6IE11a3VsIEpvc2hpIDxtdWt1bC5q
b3NoaUBhbWQuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFt
ZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBBbGV4DQo+IERldWNoZXINCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMTEsIDIwMjUgNDowNiBQ
TQ0KPiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0K
PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAyLzJdIGRybS9hbWRncHUvZ2Z4MTI6IGRvbid0IHJlYWQgcmVnaXN0ZXJzIGluIG1xZCBpbml0
DQo+DQo+IFBpbmcgb24gdGhpcyBzZXJpZXM/DQo+DQo+IFRoYW5rcywNCj4NCj4gQWxleA0KPg0K
PiBPbiBXZWQsIE1hciA1LCAyMDI1IGF0IDQ6MDfigK9QTSBBbGV4IERldWNoZXINCj4gPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSnVzdCB1c2UgdGhlIGRlZmF1
bHQgdmFsdWVzLiAgVGhlcmUncyBub3QgbmVlZCB0byBnZXQgdGhlIHZhbHVlIGZyb20NCj4gPiBo
YXJkd2FyZSBhbmQgaXQgY291bGQgY2F1c2UgcHJvYmxlbXMgaWYgd2UgZG8gdGhhdCBhdCBydW50
aW1lIGFuZA0KPiA+IGdmeG9mZiBpcyBhY3RpdmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTJfMC5jIHwgNDgNCj4gPiArKysrKysrKysr
KysrKysrKystLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMl8wLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTJfMC5jDQo+ID4gaW5kZXggOGZkZTdiMjM5ZmRiYi4uZDcyOWViMGRkYjI2OCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEyXzAuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTJfMC5jDQo+ID4gQEAgLTUyLDYg
KzUyLDI0IEBADQo+ID4NCj4gPiAgI2RlZmluZSBSTENHX1VDT0RFX0xPQURJTkdfU1RBUlRfQURE
UkVTUyAgICAgICAweDAwMDAyMDAwTA0KPiA+DQo+ID4gKyNkZWZpbmUgcmVnQ1BfR0ZYX01RRF9D
T05UUk9MX0RFRkFVTFQNCj4gMHgwMDAwMDEwMA0KPiA+ICsjZGVmaW5lIHJlZ0NQX0dGWF9IUURf
Vk1JRF9ERUZBVUxUDQo+IDB4MDAwMDAwMDANCj4gPiArI2RlZmluZSByZWdDUF9HRlhfSFFEX1FV
RVVFX1BSSU9SSVRZX0RFRkFVTFQNCj4gMHgwMDAwMDAwMA0KPiA+ICsjZGVmaW5lIHJlZ0NQX0dG
WF9IUURfUVVBTlRVTV9ERUZBVUxUDQo+IDB4MDAwMDBhMDENCj4gPiArI2RlZmluZSByZWdDUF9H
RlhfSFFEX0NOVExfREVGQVVMVA0KPiAweDAwZjAwMDAwDQo+ID4gKyNkZWZpbmUgcmVnQ1BfUkJf
RE9PUkJFTExfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAwMDAwMDANCj4gPiArI2RlZmluZSByZWdD
UF9HRlhfSFFEX1JQVFJfREVGQVVMVA0KPiAweDAwMDAwMDAwDQo+ID4gKw0KPiA+ICsjZGVmaW5l
IHJlZ0NQX0hRRF9FT1BfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAwMDAwMDYNCj4gPiArI2RlZmlu
ZSByZWdDUF9IUURfUFFfRE9PUkJFTExfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAwMDAwMDANCj4g
PiArI2RlZmluZSByZWdDUF9NUURfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAwMDAxMDANCj4gPiAr
I2RlZmluZSByZWdDUF9IUURfUFFfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAzMDg1MDkNCj4gPiAr
I2RlZmluZSByZWdDUF9IUURfUFFfRE9PUkJFTExfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAwMDAw
MDANCj4gPiArI2RlZmluZSByZWdDUF9IUURfUFFfUlBUUl9ERUZBVUxUDQo+IDB4MDAwMDAwMDAN
Cj4gPiArI2RlZmluZSByZWdDUF9IUURfUEVSU0lTVEVOVF9TVEFURV9ERUZBVUxUDQo+IDB4MGJl
MDU1MDENCj4gPiArI2RlZmluZSByZWdDUF9IUURfSUJfQ09OVFJPTF9ERUZBVUxUDQo+IDB4MDAz
MDAwMDANCj4gPiArDQo+ID4gKw0KPiA+ICBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9nY18xMl8w
XzBfcGZwLmJpbiIpOw0KPiA+ICBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9nY18xMl8wXzBfbWUu
YmluIik7DQo+ID4gIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2djXzEyXzBfMF9tZWMuYmluIik7
DQo+ID4gQEAgLTI5MzMsMjUgKzI5NTEsMjUgQEAgc3RhdGljIGludCBnZnhfdjEyXzBfZ2Z4X21x
ZF9pbml0KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCB2b2lkICptLA0KPiA+ICAgICAg
ICAgbXFkLT5jcF9tcWRfYmFzZV9hZGRyX2hpID0gdXBwZXJfMzJfYml0cyhwcm9wLT5tcWRfZ3B1
X2FkZHIpOw0KPiA+DQo+ID4gICAgICAgICAvKiBzZXQgdXAgbXFkIGNvbnRyb2wgKi8NCj4gPiAt
ICAgICAgIHRtcCA9IFJSRUczMl9TT0MxNShHQywgMCwgcmVnQ1BfR0ZYX01RRF9DT05UUk9MKTsN
Cj4gPiArICAgICAgIHRtcCA9IHJlZ0NQX0dGWF9NUURfQ09OVFJPTF9ERUZBVUxUOw0KPiA+ICAg
ICAgICAgdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX0dGWF9NUURfQ09OVFJPTCwgVk1JRCwg
MCk7DQo+ID4gICAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfR0ZYX01RRF9DT05U
Uk9MLCBQUklWX1NUQVRFLCAxKTsNCj4gPiAgICAgICAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1w
LCBDUF9HRlhfTVFEX0NPTlRST0wsIENBQ0hFX1BPTElDWSwNCj4gMCk7DQo+ID4gICAgICAgICBt
cWQtPmNwX2dmeF9tcWRfY29udHJvbCA9IHRtcDsNCj4gPg0KPiA+ICAgICAgICAgLyogc2V0IHVw
IGdmeF9ocWRfdmltZCB3aXRoIDB4MCB0byBpbmRpY2F0ZSB0aGUgcmluZyBidWZmZXIncyB2bWlk
ICovDQo+ID4gLSAgICAgICB0bXAgPSBSUkVHMzJfU09DMTUoR0MsIDAsIHJlZ0NQX0dGWF9IUURf
Vk1JRCk7DQo+ID4gKyAgICAgICB0bXAgPSByZWdDUF9HRlhfSFFEX1ZNSURfREVGQVVMVDsNCj4g
PiAgICAgICAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBDUF9HRlhfSFFEX1ZNSUQsIFZNSUQs
IDApOw0KPiA+ICAgICAgICAgbXFkLT5jcF9nZnhfaHFkX3ZtaWQgPSAwOw0KPiA+DQo+ID4gICAg
ICAgICAvKiBzZXQgdXAgZGVmYXVsdCBxdWV1ZSBwcmlvcml0eSBsZXZlbA0KPiA+ICAgICAgICAg
ICogMHgwID0gbG93IHByaW9yaXR5LCAweDEgPSBoaWdoIHByaW9yaXR5ICovDQo+ID4gLSAgICAg
ICB0bXAgPSBSUkVHMzJfU09DMTUoR0MsIDAsIHJlZ0NQX0dGWF9IUURfUVVFVUVfUFJJT1JJVFkp
Ow0KPiA+ICsgICAgICAgdG1wID0gcmVnQ1BfR0ZYX0hRRF9RVUVVRV9QUklPUklUWV9ERUZBVUxU
Ow0KPiA+ICAgICAgICAgdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX0dGWF9IUURfUVVFVUVf
UFJJT1JJVFksDQo+IFBSSU9SSVRZX0xFVkVMLCAwKTsNCj4gPiAgICAgICAgIG1xZC0+Y3BfZ2Z4
X2hxZF9xdWV1ZV9wcmlvcml0eSA9IHRtcDsNCj4gPg0KPiA+ICAgICAgICAgLyogc2V0IHVwIHRp
bWUgcXVhbnR1bSAqLw0KPiA+IC0gICAgICAgdG1wID0gUlJFRzMyX1NPQzE1KEdDLCAwLCByZWdD
UF9HRlhfSFFEX1FVQU5UVU0pOw0KPiA+ICsgICAgICAgdG1wID0gcmVnQ1BfR0ZYX0hRRF9RVUFO
VFVNX0RFRkFVTFQ7DQo+ID4gICAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfR0ZY
X0hRRF9RVUFOVFVNLCBRVUFOVFVNX0VOLA0KPiAxKTsNCj4gPiAgICAgICAgIG1xZC0+Y3BfZ2Z4
X2hxZF9xdWFudHVtID0gdG1wOw0KPiA+DQo+ID4gQEAgLTI5NzMsNyArMjk5MSw3IEBAIHN0YXRp
YyBpbnQgZ2Z4X3YxMl8wX2dmeF9tcWRfaW5pdChzdHJ1Y3QNCj4gPiBhbWRncHVfZGV2aWNlICph
ZGV2LCB2b2lkICptLA0KPiA+DQo+ID4gICAgICAgICAvKiBzZXQgdXAgdGhlIGdmeF9ocWRfY29u
dHJvbCwgc2ltaWxhciBhcyBDUF9SQjBfQ05UTCAqLw0KPiA+ICAgICAgICAgcmJfYnVmc3ogPSBv
cmRlcl9iYXNlXzIocHJvcC0+cXVldWVfc2l6ZSAvIDQpIC0gMTsNCj4gPiAtICAgICAgIHRtcCA9
IFJSRUczMl9TT0MxNShHQywgMCwgcmVnQ1BfR0ZYX0hRRF9DTlRMKTsNCj4gPiArICAgICAgIHRt
cCA9IHJlZ0NQX0dGWF9IUURfQ05UTF9ERUZBVUxUOw0KPiA+ICAgICAgICAgdG1wID0gUkVHX1NF
VF9GSUVMRCh0bXAsIENQX0dGWF9IUURfQ05UTCwgUkJfQlVGU1osIHJiX2J1ZnN6KTsNCj4gPiAg
ICAgICAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBDUF9HRlhfSFFEX0NOVEwsIFJCX0JMS1Na
LCByYl9idWZzeiAtDQo+ID4gMik7ICAjaWZkZWYgX19CSUdfRU5ESUFOIEBAIC0yOTgyLDcgKzMw
MDAsNyBAQCBzdGF0aWMgaW50DQo+ID4gZ2Z4X3YxMl8wX2dmeF9tcWRfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdm9pZCAqbSwNCj4gPiAgICAgICAgIG1xZC0+Y3BfZ2Z4X2hxZF9j
bnRsID0gdG1wOw0KPiA+DQo+ID4gICAgICAgICAvKiBzZXQgdXAgY3BfZG9vcmJlbGxfY29udHJv
bCAqLw0KPiA+IC0gICAgICAgdG1wID0gUlJFRzMyX1NPQzE1KEdDLCAwLCByZWdDUF9SQl9ET09S
QkVMTF9DT05UUk9MKTsNCj4gPiArICAgICAgIHRtcCA9IHJlZ0NQX1JCX0RPT1JCRUxMX0NPTlRS
T0xfREVGQVVMVDsNCj4gPiAgICAgICAgIGlmIChwcm9wLT51c2VfZG9vcmJlbGwpIHsNCj4gPiAg
ICAgICAgICAgICAgICAgdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX1JCX0RPT1JCRUxMX0NP
TlRST0wsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRE9PUkJFTExf
T0ZGU0VULA0KPiA+IHByb3AtPmRvb3JiZWxsX2luZGV4KTsgQEAgLTI5OTQsNyArMzAxMiw3IEBA
IHN0YXRpYyBpbnQNCj4gZ2Z4X3YxMl8wX2dmeF9tcWRfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdm9pZCAqbSwNCj4gPiAgICAgICAgIG1xZC0+Y3BfcmJfZG9vcmJlbGxfY29udHJv
bCA9IHRtcDsNCj4gPg0KPiA+ICAgICAgICAgLyogcmVzZXQgcmVhZCBhbmQgd3JpdGUgcG9pbnRl
cnMsIHNpbWlsYXIgdG8gQ1BfUkIwX1dQVFIvX1JQVFIgKi8NCj4gPiAtICAgICAgIG1xZC0+Y3Bf
Z2Z4X2hxZF9ycHRyID0gUlJFRzMyX1NPQzE1KEdDLCAwLA0KPiByZWdDUF9HRlhfSFFEX1JQVFIp
Ow0KPiA+ICsgICAgICAgbXFkLT5jcF9nZnhfaHFkX3JwdHIgPSByZWdDUF9HRlhfSFFEX1JQVFJf
REVGQVVMVDsNCj4gPg0KPiA+ICAgICAgICAgLyogYWN0aXZlIHRoZSBxdWV1ZSAqLw0KPiA+ICAg
ICAgICAgbXFkLT5jcF9nZnhfaHFkX2FjdGl2ZSA9IDE7DQo+ID4gQEAgLTMwOTcsMTQgKzMxMTUs
MTQgQEAgc3RhdGljIGludCBnZnhfdjEyXzBfY29tcHV0ZV9tcWRfaW5pdChzdHJ1Y3QNCj4gYW1k
Z3B1X2RldmljZSAqYWRldiwgdm9pZCAqbSwNCj4gPiAgICAgICAgIG1xZC0+Y3BfaHFkX2VvcF9i
YXNlX2FkZHJfaGkgPSB1cHBlcl8zMl9iaXRzKGVvcF9iYXNlX2FkZHIpOw0KPiA+DQo+ID4gICAg
ICAgICAvKiBzZXQgdGhlIEVPUCBzaXplLCByZWdpc3RlciB2YWx1ZSBpcyAyXihFT1BfU0laRSsx
KSBkd29yZHMgKi8NCj4gPiAtICAgICAgIHRtcCA9IFJSRUczMl9TT0MxNShHQywgMCwgcmVnQ1Bf
SFFEX0VPUF9DT05UUk9MKTsNCj4gPiArICAgICAgIHRtcCA9IHJlZ0NQX0hRRF9FT1BfQ09OVFJP
TF9ERUZBVUxUOw0KPiA+ICAgICAgICAgdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQX0hRRF9F
T1BfQ09OVFJPTCwgRU9QX1NJWkUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKG9yZGVy
X2Jhc2VfMihHRlgxMl9NRUNfSFBEX1NJWkUgLyA0KSAtIDEpKTsNCj4gPg0KPiA+ICAgICAgICAg
bXFkLT5jcF9ocWRfZW9wX2NvbnRyb2wgPSB0bXA7DQo+ID4NCj4gPiAgICAgICAgIC8qIGVuYWJs
ZSBkb29yYmVsbD8gKi8NCj4gPiAtICAgICAgIHRtcCA9IFJSRUczMl9TT0MxNShHQywgMCwgcmVn
Q1BfSFFEX1BRX0RPT1JCRUxMX0NPTlRST0wpOw0KPiA+ICsgICAgICAgdG1wID0gcmVnQ1BfSFFE
X1BRX0RPT1JCRUxMX0NPTlRST0xfREVGQVVMVDsNCj4gPg0KPiA+ICAgICAgICAgaWYgKHByb3At
PnVzZV9kb29yYmVsbCkgew0KPiA+ICAgICAgICAgICAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxE
KHRtcCwgQ1BfSFFEX1BRX0RPT1JCRUxMX0NPTlRST0wsDQo+ID4gQEAgLTMxMzMsNyArMzE1MSw3
IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMl8wX2NvbXB1dGVfbXFkX2luaXQoc3RydWN0DQo+IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHZvaWQgKm0sDQo+ID4gICAgICAgICBtcWQtPmNwX21xZF9iYXNlX2Fk
ZHJfaGkgPSB1cHBlcl8zMl9iaXRzKHByb3AtPm1xZF9ncHVfYWRkcik7DQo+ID4NCj4gPiAgICAg
ICAgIC8qIHNldCBNUUQgdm1pZCB0byAwICovDQo+ID4gLSAgICAgICB0bXAgPSBSUkVHMzJfU09D
MTUoR0MsIDAsIHJlZ0NQX01RRF9DT05UUk9MKTsNCj4gPiArICAgICAgIHRtcCA9IHJlZ0NQX01R
RF9DT05UUk9MX0RFRkFVTFQ7DQo+ID4gICAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwg
Q1BfTVFEX0NPTlRST0wsIFZNSUQsIDApOw0KPiA+ICAgICAgICAgbXFkLT5jcF9tcWRfY29udHJv
bCA9IHRtcDsNCj4gPg0KPiA+IEBAIC0zMTQzLDcgKzMxNjEsNyBAQCBzdGF0aWMgaW50IGdmeF92
MTJfMF9jb21wdXRlX21xZF9pbml0KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCB2b2lk
ICptLA0KPiA+ICAgICAgICAgbXFkLT5jcF9ocWRfcHFfYmFzZV9oaSA9IHVwcGVyXzMyX2JpdHMo
aHFkX2dwdV9hZGRyKTsNCj4gPg0KPiA+ICAgICAgICAgLyogc2V0IHVwIHRoZSBIUUQsIHRoaXMg
aXMgc2ltaWxhciB0byBDUF9SQjBfQ05UTCAqLw0KPiA+IC0gICAgICAgdG1wID0gUlJFRzMyX1NP
QzE1KEdDLCAwLCByZWdDUF9IUURfUFFfQ09OVFJPTCk7DQo+ID4gKyAgICAgICB0bXAgPSByZWdD
UF9IUURfUFFfQ09OVFJPTF9ERUZBVUxUOw0KPiA+ICAgICAgICAgdG1wID0gUkVHX1NFVF9GSUVM
RCh0bXAsIENQX0hRRF9QUV9DT05UUk9MLCBRVUVVRV9TSVpFLA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAob3JkZXJfYmFzZV8yKHByb3AtPnF1ZXVlX3NpemUgLyA0KSAtIDEpKTsN
Cj4gPiAgICAgICAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBDUF9IUURfUFFfQ09OVFJPTCwg
UlBUUl9CTE9DS19TSVpFLA0KPiA+IEBAIC0zMTY4LDcgKzMxODYsNyBAQCBzdGF0aWMgaW50IGdm
eF92MTJfMF9jb21wdXRlX21xZF9pbml0KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2LCB2
b2lkICptLA0KPiA+ICAgICAgICAgdG1wID0gMDsNCj4gPiAgICAgICAgIC8qIGVuYWJsZSB0aGUg
ZG9vcmJlbGwgaWYgcmVxdWVzdGVkICovDQo+ID4gICAgICAgICBpZiAocHJvcC0+dXNlX2Rvb3Ji
ZWxsKSB7DQo+ID4gLSAgICAgICAgICAgICAgIHRtcCA9IFJSRUczMl9TT0MxNShHQywgMCwNCj4g
cmVnQ1BfSFFEX1BRX0RPT1JCRUxMX0NPTlRST0wpOw0KPiA+ICsgICAgICAgICAgICAgICB0bXAg
PSByZWdDUF9IUURfUFFfRE9PUkJFTExfQ09OVFJPTF9ERUZBVUxUOw0KPiA+ICAgICAgICAgICAg
ICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfSFFEX1BRX0RPT1JCRUxMX0NPTlRST0ws
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBET09SQkVMTF9PRkZTRVQsDQo+
ID4gcHJvcC0+ZG9vcmJlbGxfaW5kZXgpOw0KPiA+DQo+ID4gQEAgLTMxODMsMTcgKzMyMDEsMTcg
QEAgc3RhdGljIGludCBnZnhfdjEyXzBfY29tcHV0ZV9tcWRfaW5pdChzdHJ1Y3QNCj4gYW1kZ3B1
X2RldmljZSAqYWRldiwgdm9pZCAqbSwNCj4gPiAgICAgICAgIG1xZC0+Y3BfaHFkX3BxX2Rvb3Ji
ZWxsX2NvbnRyb2wgPSB0bXA7DQo+ID4NCj4gPiAgICAgICAgIC8qIHJlc2V0IHJlYWQgYW5kIHdy
aXRlIHBvaW50ZXJzLCBzaW1pbGFyIHRvIENQX1JCMF9XUFRSL19SUFRSICovDQo+ID4gLSAgICAg
ICBtcWQtPmNwX2hxZF9wcV9ycHRyID0gUlJFRzMyX1NPQzE1KEdDLCAwLCByZWdDUF9IUURfUFFf
UlBUUik7DQo+ID4gKyAgICAgICBtcWQtPmNwX2hxZF9wcV9ycHRyID0gcmVnQ1BfSFFEX1BRX1JQ
VFJfREVGQVVMVDsNCj4gPg0KPiA+ICAgICAgICAgLyogc2V0IHRoZSB2bWlkIGZvciB0aGUgcXVl
dWUgKi8NCj4gPiAgICAgICAgIG1xZC0+Y3BfaHFkX3ZtaWQgPSAwOw0KPiA+DQo+ID4gLSAgICAg
ICB0bXAgPSBSUkVHMzJfU09DMTUoR0MsIDAsIHJlZ0NQX0hRRF9QRVJTSVNURU5UX1NUQVRFKTsN
Cj4gPiArICAgICAgIHRtcCA9IHJlZ0NQX0hRRF9QRVJTSVNURU5UX1NUQVRFX0RFRkFVTFQ7DQo+
ID4gICAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfSFFEX1BFUlNJU1RFTlRfU1RB
VEUsDQo+IFBSRUxPQURfU0laRSwgMHg1NSk7DQo+ID4gICAgICAgICBtcWQtPmNwX2hxZF9wZXJz
aXN0ZW50X3N0YXRlID0gdG1wOw0KPiA+DQo+ID4gICAgICAgICAvKiBzZXQgTUlOX0lCX0FWQUlM
X1NJWkUgKi8NCj4gPiAtICAgICAgIHRtcCA9IFJSRUczMl9TT0MxNShHQywgMCwgcmVnQ1BfSFFE
X0lCX0NPTlRST0wpOw0KPiA+ICsgICAgICAgdG1wID0gcmVnQ1BfSFFEX0lCX0NPTlRST0xfREVG
QVVMVDsNCj4gPiAgICAgICAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBDUF9IUURfSUJfQ09O
VFJPTCwgTUlOX0lCX0FWQUlMX1NJWkUsDQo+IDMpOw0KPiA+ICAgICAgICAgbXFkLT5jcF9ocWRf
aWJfY29udHJvbCA9IHRtcDsNCj4gPg0KPiA+IC0tDQo+ID4gMi40OC4xDQo+ID4NCg==
