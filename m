Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C0A54371
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Mar 2025 08:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0042710E905;
	Thu,  6 Mar 2025 07:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OyvjTUvs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748C410E905
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Mar 2025 07:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt+jaUUZc3LtgV7Dp4ieG343wk6+SVwvStgxDyojHbw0I0+vaq7LPG7q3lvujXnAYjZBpyZWHXA6HytvLKBnR52hngO5GwFSNyhzB/wFD+HvXnhDAFlMQy2012tmdKlLee6koxr38KOB8/8w/ZaWnoJW+xduBt2xWrJsawmg4vOmsgmsaj78qFFHxHtU+y5e17cWO4pxmThBHVgdWBdQ1x0hAfvhgGmtQeJdwNMcAT66Vz1PPlakUrbZVoZG05Y+NXbRBktTPFVU7FK7gevbrJuHasf9L3X8EgOgFgBCinF/drX/l6WlCXppIYuzBLRpwrw9fzog/qkxY+8c/iqV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAhRMsbuD66qyXLqb9Cwlhq0K1ADhLNz7HElIMLvX5s=;
 b=HGgGvq35Za9A28S/qlX//yXVDd6wHvdkKl1qN5uwBqGkWdvzbeLvbfD5+4HuudkS8MmDZkcCrYmRe3qd3uUevLb+a8DnaAY6Z6c+7wCH3GLpyzO5Rp3j5bTjq4snYeB7p907SP/y7lXUjff60X6wPP/YZv4vXWHLyrhVZce7cS36n5KNPsL8TT+PPQO1f98e7fKDxAE15pj0T8HnTyC4UIrIT2yzJvhdoURjw23Zp3a4QYYc/iLesD3dvUSUneRdEAix9qEUvVhAmY0oFbeODtGXIE5x91nF8YdSCa0zA7C3vLUiy/DTNwGzrckudYqi2/cj+hIu+SQPMus/h873Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAhRMsbuD66qyXLqb9Cwlhq0K1ADhLNz7HElIMLvX5s=;
 b=OyvjTUvslla1ZlimRZRAZq9xowgiemUXB7AARge1GBI/LujynvnQUdAS+0dbii6kDgGzQNuESPMUVMDnKVrv/IfjKWC+DmOEh0fTU9/xbYxLmZ1wiQ2gLijCns/ZdoP2NcrYsoSkhlRSQQKhp9fQJtOCZ+OQUgUoInxIrBnQOYs=
Received: from PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 07:15:29 +0000
Received: from PH0PR12MB8773.namprd12.prod.outlook.com
 ([fe80::47a4:8efb:3dca:c296]) by PH0PR12MB8773.namprd12.prod.outlook.com
 ([fe80::47a4:8efb:3dca:c296%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 07:15:28 +0000
From: "Zhang, Morris" <Shiwu.Zhang@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Ma, Le" <Le.Ma@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: fix the gb_addr_config_fields init value
 mismatch
Thread-Topic: [PATCH 2/2] drm/amdgpu: fix the gb_addr_config_fields init value
 mismatch
Thread-Index: AQHbjZolW8QcnllEAEeK2+o1Xq2CB7NkLmkAgAGDAtA=
Date: Thu, 6 Mar 2025 07:15:28 +0000
Message-ID: <PH0PR12MB8773F1335C9EA1D47F692AC2F9CA2@PH0PR12MB8773.namprd12.prod.outlook.com>
References: <20250305064435.3658987-1-shiwu.zhang@amd.com>
 <20250305064435.3658987-2-shiwu.zhang@amd.com>
 <aceb5ed4-4e7e-4578-a92f-5fdd01fc0e96@amd.com>
In-Reply-To: <aceb5ed4-4e7e-4578-a92f-5fdd01fc0e96@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-Mentions: Lijo.Lazar@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=c8025805-e108-426a-b237-9140f7fa3dc2;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-06T07:06:41Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB8773:EE_|BL3PR12MB6594:EE_
x-ms-office365-filtering-correlation-id: fdd9d5f3-b0c9-40fd-8a1c-08dd5c7eaca3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?SkI1VkxnUHE5VWFLN1ExckVMd3FTR1BobGRmQXhvU2R6aU5BNGQvWlZFVFVR?=
 =?utf-8?B?SHVWU1BEdzlnRmR4YkY4dU16ODYvenRrNVgwS0poRDVKNXhjVlFmWCt0ejNa?=
 =?utf-8?B?aWFxTm1RN3d6OXJMelkrQy9abzB4QjRJUXRqcllSU2dQcnhFdU9XbjA0NXFQ?=
 =?utf-8?B?Sy84VUZpU1ZlZ2Ztb1B0czdEL1Y3V0hRcUplOWpNNUp4c3RmaFpSZ3dvckxP?=
 =?utf-8?B?bmwzSnpGbE9nZzFNTUE1eC9XVTNUNEZOMTh2QUk4bExUenVtK2NjcTJrOHdV?=
 =?utf-8?B?ZVN2UU0wdnQwN1kzVDYwU2Zqb1hjdWw0N3c1eE92d0dIOVBEVE9PRmZqa0tT?=
 =?utf-8?B?VnFYcVozeXRaUHRSSlpiVzVPTDVNYnRpcEx3cnJPeE5pak1ibHBBWjVDWjBj?=
 =?utf-8?B?ZGhBbWdlME1KQ2owSWdHVGFIMXlFQjcxRHE2Z3Z3bTZHM3QvQ3dHd2s2QUhP?=
 =?utf-8?B?bHJramVSVWZLT3NqQXZQeGlWK1F0ZlAybmlsNml5UFJneWlzM3dVZG5xSkhs?=
 =?utf-8?B?WlJTTTNYQzJTRVBQTjRNL3R5UzdzNkhzekk0bGZlNkd2djlxOXc4aThBS2hX?=
 =?utf-8?B?ZkFjRW9mTTJZMVlLZ1MvcFlDVUdVUXdwcDdhWDVOMW1reVNEVlJCRXViUlVK?=
 =?utf-8?B?VXlrQzdRYktiaWF2NjdaK05ja2FDQ0ZOQTZkSXRnV0FxY3BNdE1yaGQxNUZr?=
 =?utf-8?B?NFF1eHZabUFpYnN1SitHKzladk8wbytJS3hCLy9rQWZPT2poaXhyWERSTkxv?=
 =?utf-8?B?VVFLZkcrMis0Q2dZalgrWHE2S2FWTXFwRkRqSW5xd2M3ejZpU0pNVzdTR1k2?=
 =?utf-8?B?c21FeFJnVHF4MTYzMnJjb0wyMXM1NGwweVNiUXdWRW0wdC90Ylh4cHJiYS8w?=
 =?utf-8?B?eFBtUktqNnVsVTN2amNXbDNBZHNPR0lUN2s3N0VwWnAyVzV2ZmxncUNmVnJz?=
 =?utf-8?B?MUZqcmlodTlHUHp4TnAxUEVOczdFV2NENDVaaTVsVThISTlMdkJNVmJFZlF6?=
 =?utf-8?B?R0lQcGloZTRuZWQ2SWV0dy9CWjUvZm1Db2dwdml2cnhiNFFqY04vOC80YzIx?=
 =?utf-8?B?N3lUYmQzSHhQaC9SeEhpRzM2V3FMVG1Ic2Y2ak5EVms4emVzSUtrdlAvMVU4?=
 =?utf-8?B?cmR2Q1pwajhiclFHbkJLcVFRUWdldXlncnV4WlZOR3lEYVNzeC9Ba2w2VUlm?=
 =?utf-8?B?MmhKVXNGSjBmRVl5OEp6a01IcEJaUUN4YUJQd3dHaUhUQmFkV0JaeGM5OTJG?=
 =?utf-8?B?L2FZdDR3V3lVNUh6c0taelp4M3llVDg5eEZuM0d5YzBYNzgzWlNScFMxZFB6?=
 =?utf-8?B?UExybUR1UldodEtoMFJobGRsL1ZCNGgzK24vZEZXN0lJNkx4dk5MTDc4STF0?=
 =?utf-8?B?aUZyUUNWWXREUGtkQlkveThCSy9wR2hUZUc4aDZsTTh5S0xkYjdvNk5zdlk2?=
 =?utf-8?B?Yi84ZFdWSTZ4eHYvNk03N1djc2V0cG16alVIQW1lTkdLOXdGQTV4WlNZVU9D?=
 =?utf-8?B?cmlQRnFDUWltb3BhajhkUnJFekpUQzlSYW9DYW5KMWNDckNhdktrUEcwVFpX?=
 =?utf-8?B?VHJxT0drUVMyT3BZL3JKTUZPNGR4MmMwY2F1b01Ya1huTmI3dnFpUEZuMk5Y?=
 =?utf-8?B?eWppZStzZmVVVHVHaGtmUTlTcEpxYXF1Q01vZmI1YXFqbE50ekNZTDZlYW53?=
 =?utf-8?B?K3A1UXJzMzJzTDFYZ2x6VUdtME54cXZULzJ4REFHYWJjRGs3Y25OeFc3RjhC?=
 =?utf-8?B?ZWlJd0Q3dU13d3hSS0RIb3pMVnY5QnR1MzE1UlVEUGtPeEU5ZUtmRmtJZk1W?=
 =?utf-8?B?Q1ZwcnJza3d3QWRoUDNsWVVIZDVQeldnOU9La25aUitPaVVvSUFydzA1eUlz?=
 =?utf-8?B?dXlLdmlWOWFvMGRzdzBud2FFUUJOc3lIRzdJeHVydUNMd3lCeE0wRytvN0RG?=
 =?utf-8?Q?XEnA440jml5pEKZ5o0fUQJNvoqNhEPqp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8773.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3gwTUV2SUNTbkIwQkxGZkJkaDhqVmxtV2ZlRzZEUXNqNnlTLytUc0RIdC9Y?=
 =?utf-8?B?eHdrRG9TWkdQNXJnZms4eFlIU1BMajFsQ0drdEN3WHQ4dmxmRnFVQllsaE92?=
 =?utf-8?B?UEJlbWsrZVlNQ2xaemJrbHNVUXBBTmR5ZUl1OEUwSjQ2RnlqaEpOeGJxaTM2?=
 =?utf-8?B?UkRrS3ZpaStuRko4REFHWDBWam9OZmZRYVNJSSt4SDdBSVJCbFNzZ1p3Wmdi?=
 =?utf-8?B?am9nM1hwR00zL1NYV1VDSzBOQU5MNS9zQjdYRnV2ZVV6TllHUVdBM0tGOG02?=
 =?utf-8?B?elNaS3lGa0hCcWl5djZNdU1BUWtEblc2ZGpJMFM4WXcwWEVHbTFhN1BLMXpq?=
 =?utf-8?B?UXJERnczSE5VSzFDejEwREdJNXpWeUFCc0FYbHNxcGxocnhiaFZjMzhxZURE?=
 =?utf-8?B?c05TNGhQVU9MamErWEVqT0tIL0trMFJWMmNCOVpVVDFIR2xPTkZvZmkySGxQ?=
 =?utf-8?B?VVVWRFNkellNejFNZmpLZys2VUhHVjJ2NFU4NUVPdjF4UDFuYm1ic2xrVHRI?=
 =?utf-8?B?V1lXdW1aTlN5TXNYbThOM0tHZ0ZYTmhLNzBIamtxY3RabUlPV01JM05MRDhk?=
 =?utf-8?B?eUFnenpPKzRvbUc1dy9UWElNVVUxbmtPL1RZRkR4MjdhQUFjMjUxUTVmMFlO?=
 =?utf-8?B?UHhVZEJGOCtoNXhyT1hWUEhEQlZ2K1NjN3VxZkFHa3B3SlY3bTVBUUtzMlR2?=
 =?utf-8?B?VW95NVl1SjNLUlpmelYyUHJLN3lJRUFFbDIwOWpZMC9zemJBZmt0eG4vcDFK?=
 =?utf-8?B?SjVWOEJmdkpQNGRvV29EV3BuZDdXMDJyRGZvOXRFSkJjeWNia0tRN095eGpG?=
 =?utf-8?B?anVGbWFsYTRNazIyTmpFeEh6NWw1bjM3Y2V0TFhpTUtVQzVQZEFNeHg3MytK?=
 =?utf-8?B?ZkVrQWsxUkw2Z2RiTXh0M2MrVHU2cWh1M09MTjArdVRmTHJkU0ljSEZBL1pk?=
 =?utf-8?B?dE9wcE1hbEswVXB5ZXBCaXR5TDFOT2JQRTB2SGQ0NmVaZWd5TFB3QzRqTjdL?=
 =?utf-8?B?bGJRVnpsNzhhQ01zdDNjOFNkZGlHNVE5cUMyZ004R1pIQUNUN0pzanBGcUJr?=
 =?utf-8?B?Y3ErS0t1UHBxM0pEWHczVHBUdFBjZFFFc2J3OGEyRy94alQvdldlNEZVVFIx?=
 =?utf-8?B?aWtTbDdMTU9kNExaaEJ0K1dDdjd2RXpaSk80VDMyZzNGRmhoQ2szTW5NbG1E?=
 =?utf-8?B?cjA2azZzT3hWaDdEL3I4bnBvM2l1WUN2KzdHSDR1L09od3l6UnJWYnVEb2JT?=
 =?utf-8?B?dVZ6dlg2UGJQQnZRKzZjQVl3QWxWYzczK2ZpZURObnRUSTMrWndIRXRhczBT?=
 =?utf-8?B?czNqSXoyZElHZnpGU3loNTI4UFlDR0h4d2RDY0JNQjBsT04zZ0hSQXRBWlRJ?=
 =?utf-8?B?dFpTUTkvSEdvb0lWVVl2RFBDamZzcVc3RWxZNEdEZ2tTemppRW44d3pOYTk3?=
 =?utf-8?B?MDB1eVJPTW9EdEJIYUVDMTdUTHFJMjZ6UnpPSUV3eXhDUmMwNUpzZVU3d0Z6?=
 =?utf-8?B?YmtCNlVyMDR5ajY5M3N1S1RPUzFCRWFVOE5naHRWNjJPWmp1WWNhNmswc2lK?=
 =?utf-8?B?NXV6WFprVEV4RENpU3M2OGxCWTQ5K250U0Z2T3J4UXorcGRaMnYrSklSUW11?=
 =?utf-8?B?R3lvWGhWL2dPZVZqY2ppL3BzbUQwd0ptaG14OWo0cVgvNFF4UlZtQWxJMnhQ?=
 =?utf-8?B?c1dWNkpSS095N3lVUHRKeWRzQWNDc3creGRaNzV4bUhLVDFVVGJaOTI3K2dt?=
 =?utf-8?B?UGMzeFN0Q3BPakdjWDBRTVVPNTA1SjJzVG9raldUdG9yZVFZVFdRbEhtNWFa?=
 =?utf-8?B?VG9YSitybWVWK204OHVadkgvNzhLZGlTV1hGKyt6VHBWRG9Beit0RTNrRitu?=
 =?utf-8?B?OG1EVzhJK1hlOTg5ZFdLbjRZLzFXMXJUSzVFVlc4dUhHSjQ4QVFhd3NGQXdB?=
 =?utf-8?B?UGNONkYyWDZORCtsdW5mVUdsRm9ZZmxpekliVzZxZHpGR3dIdWV6ZDFtNnB4?=
 =?utf-8?B?VlN1TUtEaTdCTGZPMitNaDdpZU1SR3dqVzRLQWJYaFJwNENIRXQrRXVuN2s1?=
 =?utf-8?B?Sm9EMkE2ZVBHWWt2VlBYQzJCak9Td2NwTFZoVWwzYWwvQkNBa3cvczJ5UkFE?=
 =?utf-8?Q?YQjM=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR12MB8773F1335C9EA1D47F692AC2F9CA2PH0PR12MB8773namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8773.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd9d5f3-b0c9-40fd-8a1c-08dd5c7eaca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 07:15:28.8461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiboyuVfH5HMYoAXWbZ07CKBmBlqGD1nHyhQpnlgFAOHA9iPs35p1JXsNnxVOaZNH9BfKZYlrE5E/qBeH4YmlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594
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

--_000_PH0PR12MB8773F1335C9EA1D47F692AC2F9CA2PH0PR12MB8773namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KDQpUaGFua3MgQExhemFyLCBMaWpvPG1haWx0bzpMaWpvLkxhemFyQGFtZC5jb20+IGZvciB0
aGUgcmV2aWV3Lg0KDQpBbmQgaW5pdGlhbGl6aW5nIHRoZSBnYl9hZGRyX2NvbmZpZ19maWVsZHMg
aXMgcGFydCBvZiBzd19pbml0IGFsdGhvdWdoIHRoZSBjYWxsYmFjayBoYXMgdGhlIG5hbWUgb2Yg
ZWFybHlfaW5pdCBpbiBpdC4NCg0KV2lsbCByZW1vdmUgdGhlIHBhcnQgb2YgIiBGaXggaXQgdGVt
cG9yYXJpbHkgYnkgdXNpbmcgdGhlIGdvbGRlbiB2YWx1ZSBpbiBzd19pbml0IGFzIHdlbGwuIiAg
aW4gY29tbWVudC4NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCg0KPiBGcm9t
OiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KDQo+IFNlbnQ6IFdlZG5lc2RheSwg
TWFyY2ggNSwgMjAyNSA0OjAyIFBNDQoNCj4gVG86IFpoYW5nLCBNb3JyaXMgPFNoaXd1LlpoYW5n
QGFtZC5jb20+OyBNYSwgTGUgPExlLk1hQGFtZC5jb20+OyBaaGFuZywNCg0KPiBIYXdraW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBmaXggdGhlIGdiX2FkZHJfY29u
ZmlnX2ZpZWxkcyBpbml0IHZhbHVlDQoNCj4gbWlzbWF0Y2gNCg0KPg0KDQo+DQoNCj4NCg0KPiBP
biAzLzUvMjAyNSAxMjoxNCBQTSwgU2hpd3UgWmhhbmcgd3JvdGU6DQoNCj4gPiBGb3IgZ2Z4X3Y5
XzRfMyBzcGVjaWZpY2FsbHksIGJlZm9yZSByZWdHQl9BRERSX0NPTkZJRyBpcyBvdmVyd3JpdHRl
bg0KDQo+ID4gaW4gZ2Z4IGh3X2luaXQgaXQgaXMgcmVhZCBvdXQgdG8gcG9wbHVhdGUgdGhlIGdi
X2FkZHJfY29uZmlnX2ZpZWxkcyBpbg0KDQo+ID4gdGhlIHN3X2luaXQgc3RhZ2UsIHdoaWNoIGNh
dXNlcyBtaXNtYXRjaC4NCg0KPiA+DQoNCj4gPiBGaXggaXQgdGVtcG9yYXJpbHkgYnkgdXNpbmcg
dGhlIGdvbGRlbiB2YWx1ZSBpbiBzd19pbml0IGFzIHdlbGwuDQoNCj4NCg0KPiBzd19pbml0ID0+
IGVhcmx5X2luaXQNCg0KPg0KDQo+ID4gVGhlIGZpbmFsIGZpeCBzaG91bGQgYmUgYnkgdkJJT1Mv
SUZXSS4NCg0KPg0KDQo+IFRoaXMgaXMgc3VwcG9zZWQgdG8gYmUgYSBkcml2ZXItc2V0IGdvbGRl
biByZWcuIE1vc3QgbGlrZWx5IHdpbGwgcmVtYWluIHRoaXMgd2F5Lg0KDQo+DQoNCj4gU2VyaWVz
IGlzIC0NCg0KPg0KDQo+ICAgICAgICAgIFJldmlld2VkLWJ5OiBMaWpvIExhemFyIDxsaWpvLmxh
emFyQGFtZC5jb208bWFpbHRvOmxpam8ubGF6YXJAYW1kLmNvbT4+DQoNCj4NCg0KPiBUaGFua3Ms
DQoNCj4gTGlqbw0KDQo+DQoNCj4gPg0KDQo+ID4gU2lnbmVkLW9mZi1ieTogU2hpd3UgWmhhbmcg
PHNoaXd1LnpoYW5nQGFtZC5jb208bWFpbHRvOnNoaXd1LnpoYW5nQGFtZC5jb20+Pg0KDQo+ID4g
LS0tDQoNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jIHwgNiAr
LS0tLS0NCg0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25z
KC0pDQoNCj4gPg0KDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV80XzMuYw0KDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlf
NF8zLmMNCg0KPiA+IGluZGV4IDI3MDVmMGNkZDZkYS4uYWY5Yjc4NGViNzhkIDEwMDY0NA0KDQo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jDQoNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNF8zLmMNCg0KPiA+IEBAIC05
MTgsOCArOTE4LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY2FfaW5mbyBnZnhfdjlfNF8zX2Fj
YV9pbmZvID0NCg0KPiA+IHsNCg0KPiA+DQoNCj4gPiAgc3RhdGljIGludCBnZnhfdjlfNF8zX2dw
dV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KSAgew0KDQo+ID4gLSAgICB1
MzIgZ2JfYWRkcl9jb25maWc7DQoNCj4gPiAtDQoNCj4gPiAgICAgICBhZGV2LT5nZnguZnVuY3Mg
PSAmZ2Z4X3Y5XzRfM19nZnhfZnVuY3M7DQoNCj4gPiAgICAgICBhZGV2LT5nZngucmFzID0gJmdm
eF92OV80XzNfcmFzOw0KDQo+ID4NCg0KPiA+IEBAIC05MjgsOSArOTI2LDcgQEAgc3RhdGljIGlu
dCBnZnhfdjlfNF8zX2dwdV9lYXJseV9pbml0KHN0cnVjdA0KDQo+IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpDQoNCj4gPiAgICAgICBhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXplX2JhY2tl
bmQgPSAweDEwMDsNCg0KPiA+ICAgICAgIGFkZXYtPmdmeC5jb25maWcuc2NfaGl6X3RpbGVfZmlm
b19zaXplID0gMHgzMDsNCg0KPiA+ICAgICAgIGFkZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3Rp
bGVfZmlmb19zaXplID0gMHg0QzA7DQoNCj4gPiAtICAgIGdiX2FkZHJfY29uZmlnID0gUlJFRzMy
X1NPQzE1KEdDLCBHRVRfSU5TVChHQywgMCksDQoNCj4gcmVnR0JfQUREUl9DT05GSUcpOw0KDQo+
ID4gLQ0KDQo+ID4gLSAgICBhZGV2LT5nZnguY29uZmlnLmdiX2FkZHJfY29uZmlnID0gZ2JfYWRk
cl9jb25maWc7DQoNCj4gPiArICAgYWRldi0+Z2Z4LmNvbmZpZy5nYl9hZGRyX2NvbmZpZyA9IEdP
TERFTl9HQl9BRERSX0NPTkZJRzsNCg0KPiA+DQoNCj4gPiAgICAgICBhZGV2LT5nZnguY29uZmln
LmdiX2FkZHJfY29uZmlnX2ZpZWxkcy5udW1fcGlwZXMgPSAxIDw8DQoNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBSRUdfR0VUX0ZJRUxEKA0KDQoNCg==

--_000_PH0PR12MB8773F1335C9EA1D47F692AC2F9CA2PH0PR12MB8773namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseToiXEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6
MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29QbGFp
blRleHQsIGxpLk1zb1BsYWluVGV4dCwgZGl2Lk1zb1BsYWluVGV4dA0KCXttc28tc3R5bGUtcHJp
b3JpdHk6OTk7DQoJbXNvLXN0eWxlLWxpbms6IlBsYWluIFRleHQgQ2hhciI7DQoJbWFyZ2luOjBj
bTsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJBcmlhbCIsc2Fucy1zZXJpZjsN
Cgltc28tbGlnYXR1cmVzOnN0YW5kYXJkY29udGV4dHVhbDt9DQpzcGFuLlBsYWluVGV4dENoYXIN
Cgl7bXNvLXN0eWxlLW5hbWU6IlBsYWluIFRleHQgQ2hhciI7DQoJbXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCW1zby1zdHlsZS1saW5rOiJQbGFpbiBUZXh0IjsNCglmb250LWZhbWlseToiQXJpYWwi
LHNhbnMtc2VyaWY7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9u
bHk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIuMHB0Ow0KCW1hcmdp
bjo3Mi4wcHQgMTAyLjVwdCA3Mi4wcHQgMTAyLjVwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3Bh
Z2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8
bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFb
ZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0i
ZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91
dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIj
NDY3ODg2IiB2bGluaz0iIzk2NjA3RCIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxw
IHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7
bWFyZ2luOjVwdDtmb250LXN0eWxlOm5vcm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNv
cmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVmdCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1E
IEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XTxicj4NCjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2
IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OkRlbmdYaWFuIj5UaGFua3MgPGEgaWQ9Ik9XQUFNM0VFNEYxN0U4MDMw
NDIwMTlFMTgwMTVCNDUzQzMwNDUiIGhyZWY9Im1haWx0bzpMaWpvLkxhemFyQGFtZC5jb20iPg0K
PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkRlbmdYaWFuO3RleHQtZGVjb3JhdGlvbjpub25lIj5A
TGF6YXIsIExpam88L3NwYW4+PC9hPiBmb3IgdGhlIHJldmlldy4NCjxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpE
ZW5nWGlhbiI+QW5kIGluaXRpYWxpemluZyB0aGUgZ2JfYWRkcl9jb25maWdfZmllbGRzIGlzIHBh
cnQgb2Ygc3dfaW5pdCBhbHRob3VnaCB0aGUgY2FsbGJhY2sgaGFzIHRoZSBuYW1lIG9mIGVhcmx5
X2luaXQgaW4gaXQuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4
dCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkRlbmdYaWFuIj5XaWxsIHJlbW92ZSB0aGUgcGFy
dCBvZiAmcXVvdDs8L3NwYW4+DQo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6RGVuZ1hpYW4iPkZp
eCBpdCB0ZW1wb3JhcmlseSBieSB1c2luZyB0aGUgZ29sZGVuIHZhbHVlIGluIHN3X2luaXQgYXMg
d2VsbC4mcXVvdDsgJm5ic3A7aW4gY29tbWVudC4NCjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29QbGFpblRleHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b1BsYWluVGV4dCI+Jmd0OyAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLTwvcD4NCjxwIGNsYXNz
PSJNc29QbGFpblRleHQiPiZndDsgRnJvbTogTGF6YXIsIExpam8gJmx0O0xpam8uTGF6YXJAYW1k
LmNvbSZndDs8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IFNlbnQ6IFdlZG5lc2Rh
eSwgTWFyY2ggNSwgMjAyNSA0OjAyIFBNPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0
OyBUbzogWmhhbmcsIE1vcnJpcyAmbHQ7U2hpd3UuWmhhbmdAYW1kLmNvbSZndDs7IE1hLCBMZSAm
bHQ7TGUuTWFAYW1kLmNvbSZndDs7IFpoYW5nLDwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQi
PiZndDsgSGF3a2luZyAmbHQ7SGF3a2luZy5aaGFuZ0BhbWQuY29tJmd0OzsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBmaXggdGhlIGdiX2FkZHJfY29uZmlnX2Zp
ZWxkcyBpbml0IHZhbHVlPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyBtaXNtYXRj
aDwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgPC9wPg0KPHAgY2xhc3M9Ik1zb1Bs
YWluVGV4dCI+Jmd0OyA8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IDwvcD4NCjxw
IGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgT24gMy81LzIwMjUgMTI6MTQgUE0sIFNoaXd1IFpo
YW5nIHdyb3RlOjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OyBGb3IgZ2Z4
X3Y5XzRfMyBzcGVjaWZpY2FsbHksIGJlZm9yZSByZWdHQl9BRERSX0NPTkZJRyBpcyBvdmVyd3Jp
dHRlbjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OyBpbiBnZnggaHdfaW5p
dCBpdCBpcyByZWFkIG91dCB0byBwb3BsdWF0ZSB0aGUgZ2JfYWRkcl9jb25maWdfZmllbGRzIGlu
PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7IHRoZSBzd19pbml0IHN0YWdl
LCB3aGljaCBjYXVzZXMgbWlzbWF0Y2guPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0
OyAmZ3Q7PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7IEZpeCBpdCB0ZW1w
b3JhcmlseSBieSB1c2luZyB0aGUgZ29sZGVuIHZhbHVlIGluIHN3X2luaXQgYXMgd2VsbC48L3A+
DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IDwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRl
eHQiPiZndDsgc3dfaW5pdCA9Jmd0OyBlYXJseV9pbml0PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWlu
VGV4dCI+Jmd0OyA8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsgVGhlIGZp
bmFsIGZpeCBzaG91bGQgYmUgYnkgdkJJT1MvSUZXSS48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5U
ZXh0Ij4mZ3Q7IDwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgVGhpcyBpcyBzdXBw
b3NlZCB0byBiZSBhIGRyaXZlci1zZXQgZ29sZGVuIHJlZy4gTW9zdCBsaWtlbHkgd2lsbCByZW1h
aW4gdGhpcyB3YXkuPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyA8L3A+DQo8cCBj
bGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7IFNlcmllcyBpcyAtPC9wPg0KPHAgY2xhc3M9Ik1zb1Bs
YWluVGV4dCI+Jmd0OyA8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBSZXZpZXdlZC1ieTogTGlq
byBMYXphciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxpam8ubGF6YXJAYW1kLmNvbSI+PHNwYW4gc3R5
bGU9ImNvbG9yOndpbmRvd3RleHQ7dGV4dC1kZWNvcmF0aW9uOm5vbmUiPmxpam8ubGF6YXJAYW1k
LmNvbTwvc3Bhbj48L2E+Jmd0OzwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgPC9w
Pg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyBUaGFua3MsPC9wPg0KPHAgY2xhc3M9Ik1z
b1BsYWluVGV4dCI+Jmd0OyBMaWpvPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyA8
L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDs8L3A+DQo8cCBjbGFzcz0iTXNv
UGxhaW5UZXh0Ij4mZ3Q7ICZndDsgU2lnbmVkLW9mZi1ieTogU2hpd3UgWmhhbmcgJmx0OzxhIGhy
ZWY9Im1haWx0bzpzaGl3dS56aGFuZ0BhbWQuY29tIj48c3BhbiBzdHlsZT0iY29sb3I6d2luZG93
dGV4dDt0ZXh0LWRlY29yYXRpb246bm9uZSI+c2hpd3UuemhhbmdAYW1kLmNvbTwvc3Bhbj48L2E+
Jmd0OzwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OyAtLS08L3A+DQo8cCBj
bGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsmbmJzcDsgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzRfMy5jIHwgNiArLS0tLS08L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0
Ij4mZ3Q7ICZndDsmbmJzcDsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0
aW9ucygtKTwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OzwvcD4NCjxwIGNs
YXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0
OyAmZ3Q7IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzRfMy5jPC9wPg0KPHAg
Y2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7IGluZGV4IDI3MDVmMGNkZDZkYS4uYWY5Yjc4
NGViNzhkIDEwMDY0NDwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OyAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfNF8zLmM8L3A+DQo8cCBjbGFzcz0i
TXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3Y5XzRfMy5jPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7IEBAIC05
MTgsOCArOTE4LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhY2FfaW5mbyBnZnhfdjlfNF8zX2Fj
YV9pbmZvID08L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsgezwvcD4NCjxw
IGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OzwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRl
eHQiPiZndDsgJmd0OyZuYnNwOyBzdGF0aWMgaW50IGdmeF92OV80XzNfZ3B1X2Vhcmx5X2luaXQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpJm5ic3A7IHs8L3A+DQo8cCBjbGFzcz0iTXNvUGxh
aW5UZXh0Ij4mZ3Q7ICZndDsgLSZuYnNwOyZuYnNwOyZuYnNwOyB1MzIgZ2JfYWRkcl9jb25maWc7
PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7IC08L3A+DQo8cCBjbGFzcz0i
TXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGFk
ZXYtJmd0O2dmeC5mdW5jcyA9ICZhbXA7Z2Z4X3Y5XzRfM19nZnhfZnVuY3M7PC9wPg0KPHAgY2xh
c3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyBhZGV2LSZndDtnZngucmFzID0gJmFtcDtnZnhfdjlfNF8zX3Jhczs8L3A+DQo8cCBjbGFzcz0i
TXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDs8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7
ICZndDsgQEAgLTkyOCw5ICs5MjYsNyBAQCBzdGF0aWMgaW50IGdmeF92OV80XzNfZ3B1X2Vhcmx5
X2luaXQoc3RydWN0PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyBhbWRncHVfZGV2
aWNlICphZGV2KTwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPiZndDsgJmd0OyZuYnNwOyAm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYWRldi0mZ3Q7Z2Z4LmNvbmZpZy5zY19wcmltX2ZpZm9f
c2l6ZV9iYWNrZW5kID0gMHgxMDA7PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAm
Z3Q7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBhZGV2LSZndDtnZnguY29uZmlnLnNj
X2hpel90aWxlX2ZpZm9fc2l6ZSA9IDB4MzA7PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+
Jmd0OyAmZ3Q7Jm5ic3A7ICZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBhZGV2LSZndDtnZnguY29u
ZmlnLnNjX2Vhcmx5el90aWxlX2ZpZm9fc2l6ZSA9IDB4NEMwOzwvcD4NCjxwIGNsYXNzPSJNc29Q
bGFpblRleHQiPiZndDsgJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7IGdiX2FkZHJfY29uZmlnID0g
UlJFRzMyX1NPQzE1KEdDLCBHRVRfSU5TVChHQywgMCksPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWlu
VGV4dCI+Jmd0OyByZWdHQl9BRERSX0NPTkZJRyk7PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4
dCI+Jmd0OyAmZ3Q7IC08L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsgLSZu
YnNwOyZuYnNwOyZuYnNwOyBhZGV2LSZndDtnZnguY29uZmlnLmdiX2FkZHJfY29uZmlnID0gZ2Jf
YWRkcl9jb25maWc7PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+Jmd0OyAmZ3Q7ICsmbmJz
cDsmbmJzcDsgYWRldi0mZ3Q7Z2Z4LmNvbmZpZy5nYl9hZGRyX2NvbmZpZyA9IEdPTERFTl9HQl9B
RERSX0NPTkZJRzs8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDs8L3A+DQo8
cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IGFkZXYtJmd0O2dmeC5jb25maWcuZ2JfYWRkcl9jb25maWdfZmllbGRzLm51bV9waXBl
cyA9IDEgJmx0OyZsdDs8L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij4mZ3Q7ICZndDsmbmJz
cDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IFJFR19HRVRfRklFTEQoPC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_PH0PR12MB8773F1335C9EA1D47F692AC2F9CA2PH0PR12MB8773namp_--
