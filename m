Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A43BA195DE
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Jan 2025 16:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A51310E720;
	Wed, 22 Jan 2025 15:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gCc9Vo5r";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C184010E71A;
 Wed, 22 Jan 2025 15:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZQXnXPcM6/mmm+QUdsc67cbSIHwDy1Jkt7Zftd9C2Daz2kA7iYpR2K6KT36OvaqyhL0fxJQYkaLQvWdaNiXMxk2ZjxMF135mKGm57HzKLZGv0zahKtSuSbxCHGJBKPADQQ4qxmCqgTzm6NZTbvdSjd0XFAwTDn6Ioaw3AVJsP+TKCXQCaSAHIO1vPuNAo4Hf264JTU1BOfR/H4wBGqhgoyFNJOADgEa7I4qPGhSVGXkqEk1UY76rmugiSOp8aP17AqtY8qhE7/tDsqzHPXCM8E9oLtOM2bP8BofouO9xcV7aWE9LLNi+zyYBCi4Cy6H39qj5HVbhnUifKUvRSkhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76jcNZKWWCzpsfqR8v2tYjcEaw7aJpbEsSq8F+9SMlU=;
 b=hbCAlg8503CqauhSeyIfIhxiCwDqfBN2+MG/meCuBUdLpcjuGdmoPQxTLv9pg9Ons9FebPTofapgV5Y/c4NFPRsW3vqGOWfDepuQ7LUllAGU/jVNGw+S6hEXtsVs32SqJeqs516jJoJAc81agTOWZoFlXLeHY1QWuLr8KIdZCuhCj8X6s32wJSMPqCroyR+WPPbnnQBCmJ6ypB7xLAtIRdF9janBRifl2YPvCtLPD1pwIRjyJaMHf04pDmPpNLncoXvtxC2nRgkG0KkRScMkzFHW1bg1LcBdskGNDELUOPeNFx2nndOib9KswLaP0LVMHhnDBHA2qOr3Mmhjl/mEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76jcNZKWWCzpsfqR8v2tYjcEaw7aJpbEsSq8F+9SMlU=;
 b=gCc9Vo5rAvik0f/4gqN3WEc5Szk2z32kzYOP9VgFrLr3nSt8dc+vMgRACJzjPYUwCNl5kvrRoNbzsbxEQ5Nmsu5rzm50qfoMqQzfLkXkViykpCN3u/QHKbZkyaAJq7Fa6krAF2NZl+DPgMOT1tf+dB/G1n4lgn4CcoNZmKfP5F4=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 15:56:15 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%2]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 15:56:14 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: "robert.dazi@yahoo.fr" <robert.dazi@yahoo.fr>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, amd-gfx
 list <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pichika, UdayKiran
 (Uday Kiran)" <UdayKiran.Pichika@amd.com>, "PV, SRIHARSHA"
 <SRIHARSHA.PV@amd.com>, "Swarnakar, Praful" <Praful.Swarnakar@amd.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>
Subject: Re: Introducing AMDGPU Composition Stack (ACS)
Thread-Topic: Introducing AMDGPU Composition Stack (ACS)
Thread-Index: AQHbbOQ+zJ7miyCeFUmQ3w6pjgvGGrMi8mHi
Date: Wed, 22 Jan 2025 15:56:14 +0000
Message-ID: <MW4PR12MB5667A004D286EC4CF43303C6F2E12@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <1857969400.5366816.1737560541442.ref@mail.yahoo.com>
 <1857969400.5366816.1737560541442@mail.yahoo.com>
In-Reply-To: <1857969400.5366816.1737560541442@mail.yahoo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-22T15:56:14.590Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|SA0PR12MB7479:EE_
x-ms-office365-filtering-correlation-id: 4abd7a9c-a4fa-439c-4885-08dd3afd4cf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: =?utf-8?B?SXZtcys5VSt4RzFTaS9La1JNa2JkK0xGSVhSenU0QzQrd0lqSm00RUpSU0p5?=
 =?utf-8?B?RkxJRGFVaEF0NmU3L2FqR3B5OGp5b01rQzBEbWZoRkx6aXlFNklJdXZpdTdq?=
 =?utf-8?B?T3lwVlVQRktKTFN4RlBiTldHTDdqQkc2cUQvUUdGVUxwY0VWY0M2Mi9ML1NP?=
 =?utf-8?B?MmJOL3hmYzhTTTg2WEZqM1gxM2owUU5rVTc5Q1d5cFlJUnRzb2Z1MTlLYW5L?=
 =?utf-8?B?WVZWV1ZGQXVnVXhHQ0k2OHljaWNVQ2tLVEpJYzZheUs1Y2txL1dpaVBDWHY2?=
 =?utf-8?B?bFZVWXJ2LzhMQ2s2c3hKZ05QL3BKQkJ5NUJiOHoydHZ5Z2RPaGxwZmNsUGV5?=
 =?utf-8?B?U0cwQ0RPNkhwVUtQK3czSjEzQUozZWtZWlI5Y1IzMlFRNFl0OWFpSmV1YVVP?=
 =?utf-8?B?VFRMVlNkOW5BNnA2V2grRU9CSmswM2ErSndQTEErZVdzVjNsSWNHcXZZZDMy?=
 =?utf-8?B?NWwzdVYvK08zVmZObUZISmdXcS83MHBmcnRMTEFzQWVvQWxsTHRhREdkdE1M?=
 =?utf-8?B?YThqdmpLRzZVMkFZK2YxdHBDTHRoWnJMTXZGcFVZUmNScmttQ2JENWJRa2sv?=
 =?utf-8?B?cTVNZTBrZE9UVHBhMnpNczVrcVlPWUpoaFZRUmo0UFZaZzdRT05iTFk3KzJr?=
 =?utf-8?B?S1JhZHBkaXRSY1hheTRqM0Z3VGk3VlhVY1lxQlZVV0lNc2NKa0lqdHRSRytH?=
 =?utf-8?B?Y0pIb3RKWTFIa1VPZXFUZEF5VisrQkRhOVJEWm9FeFBCcGtFYUpuVVplNzBp?=
 =?utf-8?B?bExTYmx4VXpzRktWbWJyMUZyMENvUFh5ZEVuVklUMWlCY1ljT2E5N2p1ZU5m?=
 =?utf-8?B?M3hwOTZKQkZRT050MmwwVGZZeWtZbDdLRUVKTlpYYmVTNE5WU0IxK0hFZE1V?=
 =?utf-8?B?Q0tWeXlGUjVXekRtK255Wm5PWWFEVHhSNVZJMlEzVFR5d09aTXFnTDdYeGor?=
 =?utf-8?B?d29DaGxnRENacFltY1NHRmR4U1U4SnIwU2IyWkxsalJBMmRPU2xQTXRvWTIz?=
 =?utf-8?B?aXBwUncxQmlyTnJlMkFHTHlkMnlhcVF4OHczS1BLOFVwQ0ZONTlJZUlQMmJK?=
 =?utf-8?B?ZDF6K2RCMkNLZXoxU3JLcXVRd21RaHRHMktLV2xhaTkybmFFYzlFeEdzcFgv?=
 =?utf-8?B?YkpWRGsvZ0hJcU1hMU5oQ2pxM2RVZnlsYXVtcCtrKzlEUkdrUXh5T2FsdW9R?=
 =?utf-8?B?V0tUQzN6ZzlBZXhrZGxIcGI4bXhqNEo0TlZ5aStGZHlWMzYvZzVLZzR0T3FU?=
 =?utf-8?B?U3pFNmZMSjI4MkJ5bGVxeWZSbXM1K3pLQVpFOXVFUWg5K3B0VzRyOEZ4OCs2?=
 =?utf-8?B?V0dFN3hTc3BZMWNXTmVoc2xpVlpvMjZOUExybElxSXg0bjZxTndGSGpBMEZU?=
 =?utf-8?B?d0FJc1BZUHdIVXNEZ1ByYk9VYWNZT2Q3cS9Gck9JQVlXaHgwaXUxcVJ3RHVh?=
 =?utf-8?B?WUVDOXV4Tllnd0FTRGpUc0ZXN0FuNTN4NVRHS2d2UjJCYTlhQ2xnMENGd3NQ?=
 =?utf-8?B?WmdnQmNDallEMjZINk8wUXhOdlFQaWI3Y1NJQWFOenFVL1dwcWs3RzBNWk1M?=
 =?utf-8?B?R25ZeVBWdVhQTGxEWnlJRXZnNlNzL1l0S3Ara2tnc2RUVXk1ZElnVFJzM3JX?=
 =?utf-8?B?dVBxMGZTaVdlenZZZzdxNXRkOVJxUXNlR09oWVByemw0UGVzOXpnMjZxSHRN?=
 =?utf-8?B?cWNINTZBRzNrZDVFeWRUYWJ2WlBRYnBMakxCaGJJNTd1T3VEQU1xTnZRNGps?=
 =?utf-8?B?aFBTdnZUTStIYUtxRVI5TFNIK1Iwb0RDamFGeDlXSFFjeVpwTjNodlRLUHZK?=
 =?utf-8?B?azB1S3RsR05GS1ZEMnlFeUZBdGpTTGtiZXA1a0pvUm5sZVVudVJ3SDdRcWNC?=
 =?utf-8?B?czAxK1RPRngwSWMzWmhDdU5rdURUODl3K3ZNdHFRNzZISkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aStYQU1rdVYxY3R2TFZpL2Yrby9tZHM2ZEtVTGVrUVZkdExXYzZFcVoxdTlh?=
 =?utf-8?B?QnNodEhOY29nRjhGUW1FSFdQMHFiVE96NjhnaXJ4MVcwOWxhQ1lEdzJLTU5F?=
 =?utf-8?B?ZGlmVkpwYWVFd1lDOVBjbjc4VEZWYVJHc0MwREJ3eXpCV1dsNjNCNVdtVHlu?=
 =?utf-8?B?bXBCditXVWkzN2pSVlJNY0FraitKclhXMnY3Qklha1ZBMTl2UEJ2c2tXRGYv?=
 =?utf-8?B?TGxta3pOYmdmYVgrU01UQnEvaG9xcWRhZXRSc2hxeFgzUDB0RS9kbzZMaUhv?=
 =?utf-8?B?SW44TEhmK2F6a1Q3VTVwdDNSWERoTWw4ZXo2NURBM0Q1c2trb1grbEMvaVNH?=
 =?utf-8?B?c2lsWDNtSVRxTXIrdWhndXBGeUQyS1NwKytiQkExT3B0K1p5SXhhU29kZjdD?=
 =?utf-8?B?cTVGTVJSdkp2cFE0L1ZIbjd4RGFvdEJCcTQ1YU1rUjhDeHdHYmlvYktWMjNh?=
 =?utf-8?B?eFVyQ2I3SUVEWUd4M3B1MDNwMncyQWEvVEduUGJGU0p1REtKT29FdVdpM2RS?=
 =?utf-8?B?UE9sV24wRHFYbUdiZWdOQVF1VUV5OTJWVTgwRDlyTGVCODZkVGdRQ0FTTUo4?=
 =?utf-8?B?UTBIVlByS1RpTFBHZGFPOUxCaUZYcmx3SGJVdzhrL2w4SmhCUTJ4T25IcDFL?=
 =?utf-8?B?Z04vUXF1SFZuaXR1cUl1ZS9xakE3dnQ5ckhtQ2JZNnJlTlJpNEluUFR2T0t3?=
 =?utf-8?B?eGM5RWhSTUxpa2pWZFA2MEtQN05DZzFjMHNrSy81MXplOWJoTmFhZjVCTDhx?=
 =?utf-8?B?anJCK3h6bU95TTN5a3NDb0s5amFzeVhnaEszeFJTNytFWmFaTVRIM055MzBp?=
 =?utf-8?B?YnJhT1FjNjVFYWM4aTJocDhkNUZRTU4wTHg0T1MxalNsdGdobk51aVpRaDZm?=
 =?utf-8?B?MExkNGNCYlRjczI2YWhnYy9zaUQrZ1haZGJTYXB1ZkFrRElaN2tKNG5hZWlw?=
 =?utf-8?B?Qy91c3pUQXo2NFE1K3kvWWVHRElmMUlaS0t6Q1JGUW0vVmJFODY4RVo0QXc1?=
 =?utf-8?B?amE4TlcxVW1QdW5nV2tqMll0MitPakVPdGc3S3AxbXBvbGpzYnpIM2tJNXBi?=
 =?utf-8?B?TlM3ZkxxQXZONjhiOXF2ZExRYW91MlRaTXRydDk0TkFFL1pINmk3Y2xDNzBR?=
 =?utf-8?B?Q3ltS1lobFpYK0QxcHlBdkQrUThicmU4UHJGZUpTSGRTYjJRMjJSOWVZcXYr?=
 =?utf-8?B?aVBMK3dhWkJya0dWbjJFK0dHOUpWbUdxOXJmRTZPYUx0Z3c0MktmNTdNS1ZK?=
 =?utf-8?B?VGVnQ2RRV3VqaDloK2d5STBhSlVWckhFMDI0bGRXTHdTV0N5L1BRQ053Q2Q1?=
 =?utf-8?B?QmpxWG9OcE1hU0hLM21sL2RxbWNVZDZOb016OHlJSnVLRDFqMkJWaTRLWFNB?=
 =?utf-8?B?aTU2emloaVRFY0ZoWmxEVU1hcXM3YXcwdURLbk1jcTRMbVJWSU1yeVE1K1Fz?=
 =?utf-8?B?QVgxbFArd1NmcnRocFdQVTdxWENHRzlOaTVzQkxTeW1ONXVLQWRhMnlrMUY5?=
 =?utf-8?B?cFFWZEhnZmFyZEJCTk43ejE4UXJZZzhjOEZHZytvZzVJRm5tRHRIa3VyV2NZ?=
 =?utf-8?B?TG5mU0kwMGtpWGhuWFFtSHZoNzRDYjlEclh4TXEybi9tQzByYkhKSW85c3NH?=
 =?utf-8?B?ekk5cEFnd2NRRXNMY3RBblRubURMbDBoY1kyOE9CanpCOWJJbnVSR2tiRndk?=
 =?utf-8?B?Q0prK1FuWlpwRnVleHVZL3E5VkVXRUFNYmh0S2puVnNGZUVNQTdCYVN5KzNr?=
 =?utf-8?B?TFNPZzdXeWdvSlZhbzJtelFsUjFabUNVZG9UTE1NbDFOSmR6ZU9hNUFVR3R4?=
 =?utf-8?B?N1JxdkRCTmpqd2g0dEFWZmtsdmhDcmc4bTNhc3FtbEZsRmlkekZlTHBPeXZI?=
 =?utf-8?B?OTNJVFhmcXM0eUl3RDRXNk5xYk8yRmZZcFNhRkw5dVRyK0dCT2pvOGZ1SW92?=
 =?utf-8?B?YVBad21LQmpYQWhJNjhVZk5VNW1sK1FHKyt0dXl1UnhzdklkbDkzWVJSeEJa?=
 =?utf-8?B?QUx5UFp6Nk1FWjVEZFJXaXJHWVNnNjg1M3BMdjZEY3BEVzNvUFFkNE5kMW1R?=
 =?utf-8?B?SWs5dytmZmZrQWJTVUxsMnZPaXFKaFcwVGxyV2RIak1nU2krSGhLVVJxRDl6?=
 =?utf-8?Q?QlOg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR12MB5667A004D286EC4CF43303C6F2E12MW4PR12MB5667namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abd7a9c-a4fa-439c-4885-08dd3afd4cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 15:56:14.8370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxbiW4V9JsQaVEC2S6rBNgo+XnKOrcfSgCSnBNjS8c8TDLlPBkhxSGgPYtD7SrCFjuRlPSMNYBxkS3e3clDvnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
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

--_000_MW4PR12MB5667A004D286EC4CF43303C6F2E12MW4PR12MB5667namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGV5LA0KV2UgY2FuIGNlcnRhaW5seSB0YWxrIGFib3V0IGl0IGFuZCBleHBsb3JlIGEgYml0
IG1vcmUgb24gdGhlIHJlcXVlc3QuDQoNClJlZ2FyZHMNClNoYXNoYW5rDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KRnJvbTogcm9iZXJ0LmRhemlAeWFob28uZnINClNlbnQ6IFdl
ZG5lc2RheSwgSmFudWFyeSAyMiwgMjAyNSA0OjQyIFBNDQpUbzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgYW1kLWdmeCBsaXN0OyBTaGFybWEsIFNoYXNoYW5rDQpDYzogRGV1Y2hl
ciwgQWxleGFuZGVyOyBQaWNoaWthLCBVZGF5S2lyYW4gKFVkYXkgS2lyYW4pOyBQViwgU1JJSEFS
U0hBOyBTd2FybmFrYXIsIFByYWZ1bDsgV2VudGxhbmQsIEhhcnJ5DQpTdWJqZWN0OiBSZTogSW50
cm9kdWNpbmcgQU1ER1BVIENvbXBvc2l0aW9uIFN0YWNrIChBQ1MpDQoNCkhlbGxvLA0KDQpEbyB5
b3UgcGxhbiB0byBtaWdyYXRlIHNvbWUgb2YgdGhlIEdQVS1PcGVuIHJlcG9zIHRvIHRoaXMgR2l0
bGFiIG9yZyA/IE9yIGlzIGl0IGZvciBhIHZlcnkgZGlzdGFudCBmdXR1cmUgYXMgdGhlIHByaW9y
aXR5IGZvciB0aGUgbmV4dCB5ZWFycyBpcyBvbiBXYXlsYW5kIEFNRC1zcGVjaWZpYyBvcHRpbWlz
YXRpb25zL2ludGVyZmFjZXMvcHJvdG9jb2xzID8gKG9yIGdpdmUgaW4gdG8gdGhlIHNlY29uZCBw
cmluY2lwbGUgb2YgdGhlcm1vZHluYW1pY3MgOkQgKQ0KDQpMZSBtZXJjcmVkaSAyMiBqYW52aWVy
IDIwMjUgw6AgMTU6NTM6NDggVVRDKzEsIFNoYXJtYSwgU2hhc2hhbmsgPHNoYXNoYW5rLnNoYXJt
YUBhbWQuY29tPiBhIMOpY3JpdCA6DQoNCg0KDQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1E
IEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpJbnRyb2R1Y2luZyBBTURHUFUgQ29tcG9z
aXRpb24gU3RhY2sgKEFDUykuDQpBQ1MgaXMgc2ltcGx5IEFNRCdzIGZvcmsgb2YgV2VzdG9uIGNv
bXBvc2l0b3IsIHdpdGggc29tZSBhZGRpdGlvbmFsIGFkdmFuY2VkIGZlYXR1cmVzLiBXZSBoYXZl
IGNyZWF0ZWQgQUNTIGNvbnNpZGVyaW5nIHRoZSBmb2xsb3dpbmcgcHJpbWFyeSBnb2FscyBpbiBt
aW5kOg0KDQogICogICBUbyBhY3QgYXMgYSBzdGFnaW5nIGFyZWEgZm9yIFdheWxhbmQgZmVhdHVy
ZXMgdG8gYmUgb3Blbi1zb3VyY2VkIHRvIG1haW5saW5lIFdlc3RvbiBwcm9qZWN0Lg0KICAqICAg
VG8gYWN0IGFzIGEgcmVmZXJlbmNlIGNvbXBvc2l0b3IgZm9yIEFNRCdzIGFkdmFuY2VkIGdyYXBo
aWNzIGFuZCBkaXNwbGF5IGZlYXR1cmUgZGV2ZWxvcG1lbnQuDQogICogICBUbyBwcm92aWRlIGEg
bWlkZGxld2FyZSBjb21wb3NpdG9yIHdoaWNoIGV4dHJhY3RzIHRoZSBiZXN0IG91dCBvZiBBTUQg
RGlzcGxheSBhbmQgR3JhcGhpY3MgSFcgKFdlIGRvbid0IG1pbmQgYmVpbmcgYmlhc2VkIHRvIEFN
REdQVSBIVyDwn5mCKQ0KICAgICAqICAgVG8gaG9zdCBzb21lIG9mIHRoZSBBTUQgSFcgc3BlY2lm
aWMgY29kZSwgd2hpY2ggY2FuJ3QgYmUgbWVyZ2VkIGluIFdlc3RvbiBtYWlubGluZSBkdWUgdG8g
aXRzIGJpYXMgdG93YXJkcyBBTUQgSFcuDQogICogICBUbyBiZSB1dGlsaXNlZCBpbiBmdWxsIHN0
YWNrIG9wZW5zb3VyY2UgZGVsaXZlcnkgdmVoaWNsZSBmb3IgQU1EcyBjb21tZXJjaWFsIHNvbHV0
aW9ucyBhbmQgcHJvZHVjdHMuDQogICoNClRvIGJlIHRoZSBzcGFjZSB3aGVyZSBBTUQgc3BlY2lm
aWMgaW4taG91c2UgU1cgdG9vbHMgKHBlcmZvcm1hbmNlIHR3ZWFrZXJzLCBtdWx0aW1lZGlhIHBs
YXllcnMsIDNEIGdhbWVzLCBwcm9maWxpbmcgdG9vbHMgZXRjKSBjYW4gYmUgc2F2ZWQgaW4gZnV0
dXJlLg0KDQpBQ1MgcHJvamVjdCBpcyBob3N0ZWQgaGVyZToNCmh0dHBzOi8vZ2l0bGFiLmNvbS9h
Y3Mtd2F5bGFuZA0KDQpBIGRldGFpbGVkIHdpa2kgb2YgaW50cm9kdWN0aW9uIHRvIEFDUywgaXRz
IGZlYXR1cmVzIGFuZCBmZWF0dXJlIHJvYWRtYXAgY2FuIGJlIGZvdW5kIGhlcmU6DQpodHRwczov
L2dpdGxhYi5jb20vYWNzLXdheWxhbmQvd2VzdG9uLy0vd2lraXMvaG9tZQ0KDQpUaGUgZGV0YWls
cyBhYm91dCBhZGRpdGlvbmFsIGZlYXR1cmVzIGltcGxlbWVudGVkIGluIEFDUyBhcmUgZG9jdW1l
bnRlZCBoZXJlOg0KaHR0cHM6Ly9naXRsYWIuY29tL2Fjcy13YXlsYW5kL3dlc3Rvbi8tL3dpa2lz
L2hvbWUvQUNTLUZlYXR1cmVzDQoNClBTOiBXZSBhcmUgeWV0IHRvIGRlcGxveSBhIENJL0NEIGJ1
aWxkIGZvciBBQ1MgcHJvamVjdC4NCg0KUmVnYXJkcw0KU2hhc2hhbmsgU2hhcm1hDQo=

--_000_MW4PR12MB5667A004D286EC4CF43303C6F2E12MW4PR12MB5667namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpDYWxp
YnJpO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5v
cm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVm
dCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBP
bmx5XTxicj4NCjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIg
c3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0Zv
bnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFw
dDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KSGV5LCZuYnNwOzwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCldlIGNhbiBjZXJ0YWlu
bHkgdGFsayBhYm91dCBpdCBhbmQgZXhwbG9yZSBhIGJpdCBtb3JlIG9uIHRoZSByZXF1ZXN0LiZu
YnNwOzwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1l
bnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2Es
IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KUmVn
YXJkczwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpTaGFzaGFuazwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNw
bGF5OiBpbmxpbmUtYmxvY2s7IHdpZHRoOiA5OCU7Ij4NCjxzcGFuIHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+PGI+RnJvbTo8L2I+Jm5ic3A7cm9iZXJ0LmRhemlAeWFo
b28uZnI8YnI+DQo8Yj5TZW50OjwvYj4mbmJzcDtXZWRuZXNkYXksIEphbnVhcnkgMjIsIDIwMjUg
NDo0MiBQTTxicj4NCjxiPlRvOjwvYj4mbmJzcDtkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBhbWQtZ2Z4IGxpc3Q7IFNoYXJtYSwgU2hhc2hhbms8YnI+DQo8Yj5DYzo8L2I+Jm5ic3A7
RGV1Y2hlciwgQWxleGFuZGVyOyBQaWNoaWthLCBVZGF5S2lyYW4gKFVkYXkgS2lyYW4pOyBQViwg
U1JJSEFSU0hBOyBTd2FybmFrYXIsIFByYWZ1bDsgV2VudGxhbmQsIEhhcnJ5PGJyPg0KPGI+U3Vi
amVjdDo8L2I+Jm5ic3A7UmU6IEludHJvZHVjaW5nIEFNREdQVSBDb21wb3NpdGlvbiBTdGFjayAo
QUNTKSA8L3NwYW4+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgaWQ9InhfeWl2NDA3MjQ4MzQyMSIgc3R5bGU9ImNvbG9y
OiBpbmhlcml0OyI+DQo8ZGl2IGlkPSJ4X3lpdjQwNzI0ODM0MjF5ZHAxOGM4NDcyNHlpdjMxMDg3
OTU2NTgiIHN0eWxlPSJjb2xvcjogaW5oZXJpdDsiPg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6
ICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDE2cHg7Ij4NCkhlbGxvLDwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6ICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDE2cHg7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6ICZxdW90O0hlbHZldGljYSBOZXVlJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDE2cHg7Ij4NCkRvIHlvdSBwbGFuIHRvIG1pZ3JhdGUgc29tZSBv
ZiB0aGUgR1BVLU9wZW4gcmVwb3MgdG8gdGhpcyBHaXRsYWIgb3JnID8gT3IgaXMgaXQgZm9yIGEg
dmVyeSBkaXN0YW50IGZ1dHVyZSBhcyB0aGUgcHJpb3JpdHkgZm9yIHRoZSBuZXh0IHllYXJzIGlz
IG9uIFdheWxhbmQgQU1ELXNwZWNpZmljIG9wdGltaXNhdGlvbnMvaW50ZXJmYWNlcy9wcm90b2Nv
bHMgPyAob3IgZ2l2ZSBpbiB0byB0aGUgc2Vjb25kIHByaW5jaXBsZSBvZiB0aGVybW9keW5hbWlj
cw0KIDpEICk8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtIZWx2ZXRpY2Eg
TmV1ZSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNnB4
OyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgaWQ9InhfeWl2NDA3MjQ4MzQyMXlxdDIxNzg2IiBjbGFz
cz0ieF95aXY0MDcyNDgzNDIxeXF0NDkxMTY2NDMyNiIgc3R5bGU9ImNvbG9yOiBpbmhlcml0OyI+
DQo8ZGl2IGlkPSJ4X3lpdjQwNzI0ODM0MjF5ZHAxOGM4NDcyNHlpdjMxMDg3OTU2NTh5cXQ5MDI5
MyIgY2xhc3M9InhfeWl2NDA3MjQ4MzQyMXlkcDE4Yzg0NzI0eWl2MzEwODc5NTY1OHlxdDgyNjYw
ODc2NzYiIHN0eWxlPSJjb2xvcjogaW5oZXJpdDsiPg0KPGRpdiBpZD0ieF95aXY0MDcyNDgzNDIx
eWRwMThjODQ3MjR5aXYzMTA4Nzk1NjU4eWRwYTU4MTAyNzJ5YWhvb19xdW90ZWRfNzkwMDU5OTcw
NSIgY2xhc3M9InhfeWl2NDA3MjQ4MzQyMXlkcDE4Yzg0NzI0eWl2MzEwODc5NTY1OHlkcGE1ODEw
MjcyeWFob29fcXVvdGVkIiBzdHlsZT0iY29sb3I6IGluaGVyaXQ7Ij4NCjxkaXYgc3R5bGU9ImZv
bnQtZmFtaWx5OiAmcXVvdDtIZWx2ZXRpY2EgTmV1ZSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxM3B4OyBjb2xvcjogcmdiKDM4LCA0MCwgNDIpOyI+DQpM
ZSBtZXJjcmVkaSAyMiBqYW52aWVyIDIwMjUgw6AgMTU6NTM6NDggVVRDKzEsIFNoYXJtYSwgU2hh
c2hhbmsgJmx0O3NoYXNoYW5rLnNoYXJtYUBhbWQuY29tJmd0OyBhIMOpY3JpdCA6PC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7SGVsdmV0aWNhIE5ldWUmcXVvdDssIEhlbHZl
dGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTNweDsgY29sb3I6IHJnYigzOCwg
NDAsIDQyKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7
SGVsdmV0aWNhIE5ldWUmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTNweDsgY29sb3I6IHJnYigzOCwgNDAsIDQyKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2
IGlkPSJ4X3lpdjQwNzI0ODM0MjF5ZHAxOGM4NDcyNHlpdjMxMDg3OTU2NTh5ZHBhNTgxMDI3Mnlp
djU2NzA2MjIwNjMiIHN0eWxlPSJjb2xvcjogaW5oZXJpdDsiPg0KPHAgc3R5bGU9ImRpcmVjdGlv
bjogbHRyOyBtYXJnaW46IDVwdDsgZm9udC1mYW1pbHk6IENhbGlicmk7IGZvbnQtc2l6ZTogMTBw
dDsgY29sb3I6IHJnYigwLCAwLCAyNTUpOyI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1E
IEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XTwvcD4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjog
bHRyOyI+PGJyPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgbWFyZ2luLXRv
cDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07IGZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4NCkludHJvZHVjaW5nIEFNREdQVSBDb21wb3NpdGlvbiBTdGFjayAoQUNTKS48L2Rpdj4N
CjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0
b206IDFlbTsgZm9udC1mYW1pbHk6IEFwdG9zLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KQUNTIGlzIHNpbXBs
eSBBTUQncyBmb3JrIG9mIFdlc3RvbiBjb21wb3NpdG9yLCB3aXRoIHNvbWUgYWRkaXRpb25hbCBh
ZHZhbmNlZCBmZWF0dXJlcy4gV2UgaGF2ZSBjcmVhdGVkIEFDUyBjb25zaWRlcmluZyB0aGUgZm9s
bG93aW5nIHByaW1hcnkgZ29hbHMgaW4gbWluZDo8L2Rpdj4NCjx1bCBzdHlsZT0iZGlyZWN0aW9u
OiBsdHI7Ij4NCjxsaSBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsgZGly
ZWN0aW9uOiBsdHI7Ij4NClRvIGFjdCBhcyBhIHN0YWdpbmcgYXJlYSBmb3IgV2F5bGFuZCBmZWF0
dXJlcyB0byBiZSBvcGVuLXNvdXJjZWQgdG8gbWFpbmxpbmUgV2VzdG9uIHByb2plY3QuPC9saT48
bGkgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGRpcmVjdGlvbjogbHRy
OyI+DQpUbyBhY3QgYXMgYSByZWZlcmVuY2UgY29tcG9zaXRvciBmb3IgQU1EJ3MgYWR2YW5jZWQg
Z3JhcGhpY3MgYW5kIGRpc3BsYXkgZmVhdHVyZSBkZXZlbG9wbWVudC48L2xpPjxsaSBzdHlsZT0i
Zm9udC1mYW1pbHk6IEFwdG9zLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsgZGlyZWN0aW9uOiBsdHI7Ij4NClRvIHBy
b3ZpZGUgYSBtaWRkbGV3YXJlIGNvbXBvc2l0b3Igd2hpY2ggZXh0cmFjdHMgdGhlIGJlc3Qgb3V0
IG9mIEFNRCBEaXNwbGF5IGFuZCBHcmFwaGljcyBIVyAoV2UgZG9uJ3QgbWluZCBiZWluZyBiaWFz
ZWQgdG8gQU1ER1BVIEhXIPCfmYIpPC9saT48dWwgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+DQo8
bGkgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGRpcmVjdGlvbjogbHRy
OyI+DQpUbyBob3N0IHNvbWUgb2YgdGhlIEFNRCBIVyBzcGVjaWZpYyBjb2RlLCB3aGljaCBjYW4n
dCBiZSBtZXJnZWQgaW4gV2VzdG9uIG1haW5saW5lIGR1ZSB0byBpdHMgYmlhcyB0b3dhcmRzIEFN
RCBIVy48L2xpPjwvdWw+DQo8bGkgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7IGRpcmVjdGlvbjogbHRyOyI+DQpUbyBiZSB1dGlsaXNlZCBpbiBmdWxsIHN0YWNrIG9wZW5z
b3VyY2UgZGVsaXZlcnkgdmVoaWNsZSBmb3IgQU1EcyBjb21tZXJjaWFsIHNvbHV0aW9ucyBhbmQg
cHJvZHVjdHMuPC9saT48bGkgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+VG8gYmUgdGhlIHNwYWNlIHdoZXJlIEFN
RCBzcGVjaWZpYyBpbi1ob3VzZSBTVyB0b29scyAocGVyZm9ybWFuY2UgdHdlYWtlcnMsIG11bHRp
bWVkaWEgcGxheWVycywgM0QgZ2FtZXMsIHByb2ZpbGluZyB0b29scyBldGMpIGNhbiBiZSBzYXZl
ZCBpbiBmdXR1cmUuPC9kaXY+DQo8L2xpPjwvdWw+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0
cjsgZm9udC1mYW1pbHk6IEFwdG9zLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KQUNTIHByb2plY3QgaXMgaG9z
dGVkIGhlcmU6Jm5ic3A7PC9kaXY+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1m
YW1pbHk6IEFwdG9zLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTog
MTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29t
L2Fjcy13YXlsYW5kIiBpZD0iT1dBYTFlZjUzMGMtMDkyOS1jM2Q3LWI2MTctZjA0ODlkM2Y4M2Ri
IiBjbGFzcz0ieF95aXY0MDcyNDgzNDIxeWRwMThjODQ3MjR5aXYzMTA4Nzk1NjU4eWRwYTU4MTAy
NzJ5aXY1NjcwNjIyMDYzT1dBQXV0b0xpbmsiIGRhdGEtYXV0aD0iTm90QXBwbGljYWJsZSI+aHR0
cHM6Ly9naXRsYWIuY29tL2Fjcy13YXlsYW5kPC9hPiZuYnNwOzwvZGl2Pg0KPGRpdiBzdHlsZT0i
ZGlyZWN0aW9uOiBsdHI7IGZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVsdmV0aWNhLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4N
CjwvZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7IGZvbnQtZmFtaWx5OiBBcHRvcywg
Q2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4NCkEgZGV0YWlsZWQgd2lraSBvZiBpbnRyb2R1Y3Rpb24gdG8gQUNTLCBp
dHMgZmVhdHVyZXMgYW5kIGZlYXR1cmUgcm9hZG1hcCBjYW4gYmUgZm91bmQgaGVyZTo8L2Rpdj4N
CjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBmb250LWZhbWlseTogQXB0b3MsIENhbGlicmks
IEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyI+DQo8YSBocmVmPSJodHRwczovL2dpdGxhYi5jb20vYWNzLXdheWxhbmQvd2VzdG9uLy0v
d2lraXMvaG9tZSIgaWQ9Ik9XQTIzZTZlYzAzLWRkZDAtYzgwNy1jMjI4LWZjYjBmOGU2NDM4ZCIg
Y2xhc3M9InhfeWl2NDA3MjQ4MzQyMXlkcDE4Yzg0NzI0eWl2MzEwODc5NTY1OHlkcGE1ODEwMjcy
eWl2NTY3MDYyMjA2M09XQUF1dG9MaW5rIiBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPmh0dHBz
Oi8vZ2l0bGFiLmNvbS9hY3Mtd2F5bGFuZC93ZXN0b24vLS93aWtpcy9ob21lPC9hPiZuYnNwOzwv
ZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7IGZvbnQtZmFtaWx5OiBBcHRvcywgQ2Fs
aWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7IGZv
bnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRoZSBkZXRhaWxzIGFib3V0IGFkZGl0
aW9uYWwgZmVhdHVyZXMgaW1wbGVtZW50ZWQgaW4gQUNTIGFyZSBkb2N1bWVudGVkIGhlcmU6PC9k
aXY+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6IEFwdG9zLCBDYWxp
YnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigw
LCAwLCAwKTsiPg0KPGEgaHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL2Fjcy13YXlsYW5kL3dlc3Rv
bi8tL3dpa2lzL2hvbWUvQUNTLUZlYXR1cmVzIiBpZD0iT1dBMDBiOWY4ZjYtOTRlZC00NmZlLWMw
MTMtZTI5MjUzODg2YWZkIiBjbGFzcz0ieF95aXY0MDcyNDgzNDIxeWRwMThjODQ3MjR5aXYzMTA4
Nzk1NjU4eWRwYTU4MTAyNzJ5aXY1NjcwNjIyMDYzT1dBQXV0b0xpbmsiIGRhdGEtYXV0aD0iTm90
QXBwbGljYWJsZSI+aHR0cHM6Ly9naXRsYWIuY29tL2Fjcy13YXlsYW5kL3dlc3Rvbi8tL3dpa2lz
L2hvbWUvQUNTLUZlYXR1cmVzPC9hPjwvZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7
IGZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBz
dHlsZT0iZGlyZWN0aW9uOiBsdHI7IGZvbnQtZmFtaWx5OiBBcHRvcywgQ2FsaWJyaSwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4N
ClBTOiBXZSBhcmUgeWV0IHRvIGRlcGxveSBhIENJL0NEIGJ1aWxkIGZvciBBQ1MgcHJvamVjdC48
L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBmb250LWZhbWlseTogQXB0b3MsIENh
bGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdi
KDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBm
b250LWZhbWlseTogQXB0b3MsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpSZWdhcmRzPC9kaXY+DQo8ZGl2IHN0
eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6IEFwdG9zLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTFwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K
U2hhc2hhbmsgU2hhcm1hPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwv
ZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_MW4PR12MB5667A004D286EC4CF43303C6F2E12MW4PR12MB5667namp_--
