Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55293AEC6
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2024 11:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1878710E567;
	Wed, 24 Jul 2024 09:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZZ+4aYR+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343C410E612
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2024 09:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwkSitmlIHJ1yuNjAFjiTDM6iPhIYVRrFuhWQWJDdHO+puEtQRgZ5bDZGlE4gxnHezhOkl0Zx+hUhGLNVVe13CaLunt/zKM8eGx7SAYvWeKJELb2nOh9vnRsbz7LPYDSoO/pzkXLnMdxJ522gyt4g6Y+il0pze/oYvLWZ+meRwDXUYOSZkT9e1JYWJ/OSmKhORocMk4RohTdYQsHa1yFO1NcCtXtubnB+uqGIOwglCOGTncLzL1dNz108MuTki0S+ygheORGq4eDEUFAlOggS6J8kLFIRIcS0g1EHCOJgBx/mwQUBYKh2uvL090P+F8XezoUrFOKGDvKRSICFoQ5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0IIKTupWsx9UbvCu8poKW6jHc/YczcSM2Len8KyFBI=;
 b=E6I9e0mf1/1veCRuollFt5slv1VI215V2bu6Bv0R1nzHnyakModtbPtA0Akq+T0neXwDzZRtJlhJ/z6pjGM5zV+PHvUNNkuyxTvvIVAGEq2Bh85UYVqdCXeOj6U8H4Ww82ywto4gWhw0hy4AYn3rbLmQEd4Jrxif07B5aocw1Y9usgSHO473UA4FL+jSeoHq64xj9FS2tLSNZ5l+iDjNbNLscGXWny8mQzbjWiGwy5X4TgQrJwmSUiYvGrQSgpKYBy48cKoOHQ91NMTvIs4c9M3mXjH8I8oZrjATZADhb9SUXWMtJQWHKFJMtoyu4HFoCeFOHCyA10Pcg/yzAvUtNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0IIKTupWsx9UbvCu8poKW6jHc/YczcSM2Len8KyFBI=;
 b=ZZ+4aYR+j/WSOTjvk3VVGhNMEDeKr/xvLKR6ErQ+L72jvrPBsnwok4UhK52IrcYAiJ7oonjUNngdsVQwxQflPH8hoEGtB3Fd6SbWCliZP63nNMOqfomVqrCq7NPq51EIYIGH920Sti8R0WeBzhH11jf9Lzl4MGPYDJnGF0pRflo=
Received: from DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) by
 DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.17; Wed, 24 Jul 2024 09:20:40 +0000
Received: from DS7PR12MB6333.namprd12.prod.outlook.com
 ([fe80::cda7:a979:580:83a]) by DS7PR12MB6333.namprd12.prod.outlook.com
 ([fe80::cda7:a979:580:83a%7]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 09:20:40 +0000
From: "Zhu, Jiadong" <Jiadong.Zhu@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Friedrich Vock
 <friedrich.vock@gmx.de>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 00/34] GC per queue reset
Thread-Topic: [PATCH 00/34] GC per queue reset
Thread-Index: AQHa2Rvl+1l0Px+WiEyOulMeZQUJ07H8rRcAgAFi44CAB5EIUA==
Date: Wed, 24 Jul 2024 09:20:40 +0000
Message-ID: <DS7PR12MB6333400E4AC22FB5DFEE06DBF4AA2@DS7PR12MB6333.namprd12.prod.outlook.com>
References: <20240718140733.1731004-1-alexander.deucher@amd.com>
 <95387eeb-d81e-4a09-8475-820317605f49@gmx.de>
 <CADnq5_NaXHNz_AO9YJbe5X7qKP8h7CQqUVd5BwxDh4rbg2nBkw@mail.gmail.com>
In-Reply-To: <CADnq5_NaXHNz_AO9YJbe5X7qKP8h7CQqUVd5BwxDh4rbg2nBkw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=2d503fbc-c8e9-4ea5-bcb2-bb3c394c68a1;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-24T09:12:31Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6333:EE_|DS0PR12MB6582:EE_
x-ms-office365-filtering-correlation-id: 5272b866-4053-479d-dd78-08dcabc1e313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YlNMMit1dVRVa0dpaVBKeWxhQnB0bmJuaWN0RjVrZVEvWS9Cc2lMOE05bFR4?=
 =?utf-8?B?K3lVNEZ2OUt6ZXVweldBRnh3bEZ3LzFVM2orWlgyYmNZS0NqYWMrcldWT0hY?=
 =?utf-8?B?ekVzT2MwNnAvMzJVMllhVytEMUI5M1lydXIycVlmNndZakcyQldmTi96WjRk?=
 =?utf-8?B?UmUyb24vUE1pQitFcE5DWlNqVTlVTUZHZitpR3EvVlNYbzR6MDAwQTRWWUQx?=
 =?utf-8?B?VEcyazQ4N1lRYis1UHhTSW1nU29XdGZYZUxaUUhCUEJCc1VMRzVOcFVaRkxV?=
 =?utf-8?B?aUM4WUV1SzhpMTJQY1hsU3NzUEJkQXpEcVBNR3dNNzVtQ1EwVmFSYi9od1ZS?=
 =?utf-8?B?SU1yLzhLVlVnV25SbTdoSlV6V1Exa3NYUy9XNlN5VUlTU1dYaHZ4YkdnNWUz?=
 =?utf-8?B?WWlpWk5Obkw4VUpyLzlXNklzVzE3SlJ3YWZ5bW5iWG5vTVhxOFJzYkVJZUQ1?=
 =?utf-8?B?Y1hIMyt2VGxIdEhNU0ZWckJQbWtmWCt6KzRXZU9ZOFlBODNpRVRvSjU5SHFh?=
 =?utf-8?B?TE5SR05WT3FZeGxEeUllbXlGUksvaEpzY0k4RjV2c3Noemx0TFJqV2xKZHRR?=
 =?utf-8?B?K3FtYzFvY2E3bVBaZ3ByN1FSTm9Qdng0VFMzK1Vvc0xmMmJxSEhDdzRNTEpD?=
 =?utf-8?B?cXVldDF4MHhBZWZpcnVXQ2hrWW5Fb1NIdFY2VHpFYnFTdlQxT3lNM1lWOWZT?=
 =?utf-8?B?cXUyRDlyNWFvVGgxWU52Y1pWb2JXK2RZdm94MXRYYTNXa1p3dVY3OTB1YjBU?=
 =?utf-8?B?K2MrTzdxeVc2Yzl0SXh2SVg1VjM2SnZrTDRZREFTUDB5RWt5VFFzN1FSM2VL?=
 =?utf-8?B?M1dBQ2pDK0QxNXExWnhQdHNRaFJhZFozY0M4MEU5OGlhcWwyeW82dUw0cVFE?=
 =?utf-8?B?Zi9nWHRZbUVrQ3gwUWhRTHNQMW5NVFZsUjRLcno1VzlDQ2MzS0Z2YUhvcXVK?=
 =?utf-8?B?Q1hWQ29YTW1oYnBZTEpBV1M0UWxYZ203UkVROUhBdGEyQ1ZFdHpQSWplYzdM?=
 =?utf-8?B?REFxdnN3ZTVYVkFxNVJVclhRV3F5bE5mbkRWekFoR21kVDFZUVk2UmlRM1dV?=
 =?utf-8?B?YWlIMGpBZFlpUmpYZzFPOGRLN2ZxVUtGN3NKRzJNb0ZrbUhJdTlnalhrS3ZN?=
 =?utf-8?B?d1ZpS0p1OFRaV292RHBnQmV5ZDczQ1NmZ3pwWllBVWxvYTBJVlJHVGlVNitQ?=
 =?utf-8?B?NmxUUjdTdnpHQ2JRbjh6T3VsL0gyeUJlMlduZjdSVENyVHhhN2hENTlkRFRw?=
 =?utf-8?B?R21LZVRqa1ZkVHhFM3ErMG02ZVZoOE9mL3hkNHd0RmtnTng0aDFZNnJZa2pw?=
 =?utf-8?B?V3BIcDV3bDJ0U09zblJPRXR1VThreDNvVmZzY3FZZXdZak9tcjR0cXp0S2hW?=
 =?utf-8?B?Y1RRMXdsNjdBK2huQ0xjYks0S2R2ZVpQdWp2TFRZRWxla1lUcVBaTm1nOVBM?=
 =?utf-8?B?QllIWnJ2ZFJnTVVwQ0srVzJOT1I2VGZFQVJtSnhacEpNcHkza1B1QjNJWkdn?=
 =?utf-8?B?S1dBa0ZCcHQyRGhRdkxsbzYyUkU0bzVvT2RSdm9qbE1zbXZCMzdvOE9OWjJo?=
 =?utf-8?B?UThMMWR5cC9zQzE1Tk5aU0hWSWxsd2RIYmpQQXRQd3NNSXNZTHlZU1VtMkNH?=
 =?utf-8?B?WnAxaTNwZlluN2FtRW1STzd0clhqdThlQ3ZnM0FkWEN3UHp1RnBETEx2TDY2?=
 =?utf-8?B?ckRHaTduZk1TZElDQ3MwRFlaT1pRRXVNTUpLM1lwTHZUanloS1M0Z0J6TkZ6?=
 =?utf-8?B?Skc1aThOZC9WTDhMN0VvWmZBQkN4dDBSNmEvRURDcU5wV3RwWjNkZnlhWU1I?=
 =?utf-8?Q?ehtZtvV4G/EGKeTN4GFxSLdGdnakToSps41Jk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6333.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THA5cFdQSUpXcnkvS3cxSGNHd0Q3NE1GLysreXc1WERWRmFTQU1BUEx6Tllv?=
 =?utf-8?B?c1pJT1hFMUVSeWo3NDVraFBJTEJ0bjRRaGQrcUZUNUprNmVpOThJb2VMbHpk?=
 =?utf-8?B?V01DTlVhcUpoYS9XOUtFcytuZmxMN2dTcnhOSVRldkFrdmhmVkZKVnQrZFBy?=
 =?utf-8?B?U09QTUlZVUg4UmFKcTVzT1lJbm43MUVBaW8rYjNBejBQeno1eFRoVVFDS3RW?=
 =?utf-8?B?U2x4dXNkWVdDOGdsQ3hwb3NuY0tUMzAwZmlTcWNxQ2pmcUFYVDh2MGVwd3o0?=
 =?utf-8?B?ZUxqN1lRdlM3elpmcWxjZlo4V1kvbStkb3JBaThUUy9ZM1BDUmVEbFhJYVRh?=
 =?utf-8?B?U0dXelBMdHBrY3dGVW5xRW9mM29FNVg2T1dzdnZUWjI2Qm93LzRhSGVKWnBo?=
 =?utf-8?B?d1BwK3kvVXdhKzYwaXF6MU1Nd1Q0dVNGMFZ6SXVtSmZtUWE4QW9jVy9pQlZQ?=
 =?utf-8?B?cTl0OGRVZTJKSVh0WGNUbldOMVlOaEtjNVUvR3UvRkwwbWVXdjVrL2svdGNh?=
 =?utf-8?B?a08yYkl3RG1Rb0JjNk1BcGZBZSt0cnUxbDgrdEliVG91am5VRVBkQlh4Vmpu?=
 =?utf-8?B?SU1wSXJwT2k4VmpWcjlxY3BjeDlrSFEyUERNZHB6bU0rMkRzdWZFejkzOTFh?=
 =?utf-8?B?YjJQQVAybWJGcFBsMDk5VjF0ZlUzTWZQRmtPWWVoUHl3WUNZTFk2T1Eyc1pq?=
 =?utf-8?B?NXE2TzVBUk42M0pHNTBkbmE4cnZ5WnNPU0ZHSXlyVVJSMmduZDY2TDJhR05Q?=
 =?utf-8?B?QVBYYnU2bGxuQnkwM202VFo3WGNQd2xvbzZEOU5EaHpCb1VVSFRIWmk0U0o3?=
 =?utf-8?B?SEdVTUZoYjY3MVd0RWl1eXFXcEwvNHdaSFlvSXVyM0lJS0w5ZGJaR0dyWkRE?=
 =?utf-8?B?S2FUTXNyZUYzUEpSQ3lmbG4xTzVMWlowNkVzVk5SQytwOVJWbDQySVhHNS92?=
 =?utf-8?B?UFRUSnVsSGxxZFBuaHptQWFaTkdsVlYrY3g3dXdWZDlKWHk2Z1BUTDQ2Z2Ey?=
 =?utf-8?B?U3k1a1N0R3lza3BNN251RXlKY2I1dkt3dG43OWk4S2ZzR21FMnRLb0xCKzll?=
 =?utf-8?B?ODZLMkN3QjVGU1VGU2FOWDNOSWt2RnNOd0RIVlgvbXlnU0o2Z3pnRWMxSnNN?=
 =?utf-8?B?KzJsMVVsWkt5ci9qWUdHY1A1bWVvN1FZQVhjbkNPUW5Qbnd5M0JCMC9abWdq?=
 =?utf-8?B?dCtMMHQ3TjZ4WkJXTkt2TzlQaXNxZjkzSHV1d2F2VHU2Ny9mZ1VxeE5GWCt3?=
 =?utf-8?B?eTdRUWhMYm5kM2FjcnVuUnh5R0pMeTJucG13TmZta3NvTERGd3RxUVF5WXkz?=
 =?utf-8?B?SmQxUjNuLzRXaUxhcGg0VUtVcUF2aUhsVnZyTDQ3bUgxWkc2dkpndzl5RGdj?=
 =?utf-8?B?YXFQdXFwalJHaTloNFdtN0ZQNUdLdS9OK0p6cVo0R2wvV2ZrT1U4KzBqeGRy?=
 =?utf-8?B?czNWajIvU3pmd0N2R2UxN09tOHNPckp3RVZIdlNnS2ZDNHJLeTFTNURhcjFY?=
 =?utf-8?B?bnVzSHR0QkZUZTR4aW5ZcHRreVh0cmZ0VGlYb0tVM0hqTGtKaEFXVWxKa204?=
 =?utf-8?B?QnR1R3lTZk84Z1VQSG5yeVRGa0VLS1doMkpoc1J4VS9nOW1XVjJmN3EreEVv?=
 =?utf-8?B?Ulc3YWhuQ2lDTXZ1VER0V1dJeldhelorWDBqUmpnTklCcXdaaW1QRWx1eDNB?=
 =?utf-8?B?bzAyTko5SWhZVlBPTjQ1R2kwOUViTHhyUkJENVc4NndnOG40RHdoRjlVWlVQ?=
 =?utf-8?B?eGtINTd4S1JVL1JyaCtDMDN5OWZZaUVBWUhQSUVEeFhlRVk2ZXJrRExqcHZ6?=
 =?utf-8?B?VVRCd1JmeTBicWMvekYrL1FwMlRpU0hGYTNhNjMzUkZRS0Z5VGZtaU1hRnEx?=
 =?utf-8?B?UHNlYS9BM3ByYTE2SjJ5bUdOYmk2Y2x2MnorNndiVDRFMU0xaWtCbHVCSmh6?=
 =?utf-8?B?VGw5MllPTTA1RnlLdTN6eC80cHF3VkJacVNGSWJqNk1odHJiRktvcmpTb0R3?=
 =?utf-8?B?QmwzM0pRREw3U3YrSFZaQXVOMEpXbnNmYytTRjhxVnNSQXRHcm5VeFRLUVB5?=
 =?utf-8?B?RkJVcUd2MVIxVHU2SVg3NENDcWlLaDBEOVFQRkpWMzhsVTAzeWJ4NXdEb01T?=
 =?utf-8?Q?Z25A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6333.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5272b866-4053-479d-dd78-08dcabc1e313
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2024 09:20:40.5985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FpI5q7D1Irh5z/Eq5SizgYgW99LvIQDt6hqGgNuyb37bipMBvF0w/8bbHpXnLP/hmiymsZzVyPlgtWQ/crXwJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQWxleA0KPiBEZXVj
aGVyDQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxOSwgMjAyNCA5OjQwIFBNDQo+IFRvOiBGcmllZHJp
Y2ggVm9jayA8ZnJpZWRyaWNoLnZvY2tAZ214LmRlPg0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDAvMzRdIEdDIHBlciBxdWV1ZSByZXNldA0K
Pg0KPiBPbiBUaHUsIEp1bCAxOCwgMjAyNCBhdCAxOjAw4oCvUE0gRnJpZWRyaWNoIFZvY2sgPGZy
aWVkcmljaC52b2NrQGdteC5kZT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+IE9u
IDE4LjA3LjI0IDE2OjA2LCBBbGV4IERldWNoZXIgd3JvdGU6DQo+ID4gPiBUaGlzIGFkZHMgcHJl
bGltaW5hcnkgc3VwcG9ydCBmb3IgR0MgcGVyIHF1ZXVlIHJlc2V0LiAgSW4gdGhpcyBjYXNlLA0K
PiA+ID4gb25seSB0aGUgam9icyBjdXJyZW50bHkgaW4gdGhlIHF1ZXVlIGFyZSBsb3N0LiAgSWYg
dGhpcyBmYWlscywgd2UNCj4gPiA+IGZhbGwgYmFjayB0byBhIGZ1bGwgYWRhcHRlciByZXNldC4N
Cj4gPg0KPiA+IEZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IHNvIG11Y2ggZm9yIHdvcmtpbmcgb24g
dGhpcyEgSXQncyBncmVhdCB0bw0KPiA+IGZpbmFsbHkgc2VlIHByb2dyZXNzIGluIG1ha2luZyBH
UFUgcmVzZXRzIGJldHRlci4NCj4gPg0KPiA+IEkndmUganVzdCB0YWtlbiB0aGlzIHBhdGNoc2V0
ICh0b2dldGhlciB3aXRoIHlvdXIgb3RoZXINCj4gPiBwYXRjaHNldHNbMV1bMl1bM10pIGZvciBh
IHF1aWNrIHNwaW4gb24gbXkNCj4gPiBOYXZpMjEgd2l0aCB0aGUgR1BVIHJlc2V0IHRlc3RzWzRd
IEkgaGFkIHdyaXR0ZW4gYSB3aGlsZSBhZ28gLSB0aGUNCj4gPiBjdXJyZW50IHBhdGNoc2V0IHNh
ZGx5IHNlZW1zIHRvIGhhdmUgc29tZSByZWdyZXNzaW9ucyBXUlQgcmVjb3ZlcnkNCj4gdGhlcmUu
DQo+ID4NCj4gPiBJIHJhbiB0aGUgdGVzdHMgdW5kZXIgbXkgUGxhc21hIFdheWxhbmQgc2Vzc2lv
biBvbmNlIC0gdGhpcyB0cmlnZ2VyZWQNCj4gPiBhIGxpc3QgZG91YmxlLWFkZCBpbiBkcm1fc2No
ZWRfc3RvcCAoY2FsbHRyYWNlIGZvbGxvd3MpOg0KPg0KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGZp
eCB0aGUgZG91YmxlIGFkZDoNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9qb2IuYw0KPiBpbmRleCA3MTA3YzRkM2EzYjYuLjU1NWQzYjY3MWJkYiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiBAQCAtODgsNiArODgsOCBAQCBz
dGF0aWMgZW51bSBkcm1fZ3B1X3NjaGVkX3N0YXQNCj4gYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHJtX3NjaGVkX3N0YXJ0KCZyaW5nLT5zY2hlZCwgdHJ1ZSk7DQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gZXhpdDsNCj4gICAgICAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAg
ICAgIGlmIChhbWRncHVfcmluZ19zY2hlZF9yZWFkeShyaW5nKSkNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZHJtX3NjaGVkX3N0YXJ0KCZyaW5nLT5zY2hlZCwgdHJ1ZSk7DQo+ICAgICAgICAg
fQ0KPg0KPiAgICAgICAgIGlmIChhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShyaW5n
LT5hZGV2KSkgew0KPg0KPg0KPiA+DQo+ID4gPyBkaWUgKGFyY2gveDg2L2tlcm5lbC9kdW1wc3Rh
Y2suYzo0MjEgYXJjaC94ODYva2VybmVsL2R1bXBzdGFjay5jOjQzNA0KPiA+IGFyY2gveDg2L2tl
cm5lbC9kdW1wc3RhY2suYzo0NDcpID8gZG9fdHJhcA0KPiA+IChhcmNoL3g4Ni9rZXJuZWwvdHJh
cHMuYzoxMTMgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MTU0KSA/DQo+ID4gX19saXN0X2FkZF92
YWxpZF9vcl9yZXBvcnQgKGxpYi9saXN0X2RlYnVnLmM6MzUgKGRpc2NyaW1pbmF0b3IgMSkpID8N
Cj4gPiBkb19lcnJvcl90cmFwICguL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RyYXBzLmg6NTgNCj4g
PiBhcmNoL3g4Ni9rZXJuZWwvdHJhcHMuYzoxNzUpID8gX19saXN0X2FkZF92YWxpZF9vcl9yZXBv
cnQNCj4gPiAobGliL2xpc3RfZGVidWcuYzozNSAoZGlzY3JpbWluYXRvciAxKSkgPyBleGNfaW52
YWxpZF9vcA0KPiA+IChhcmNoL3g4Ni9rZXJuZWwvdHJhcHMuYzoyNjYpID8gX19saXN0X2FkZF92
YWxpZF9vcl9yZXBvcnQNCj4gPiAobGliL2xpc3RfZGVidWcuYzozNSAoZGlzY3JpbWluYXRvciAx
KSkgPyBhc21fZXhjX2ludmFsaWRfb3ANCj4gPiAoLi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9pZHRl
bnRyeS5oOjU2OCkNCj4gPiA/IF9fbGlzdF9hZGRfdmFsaWRfb3JfcmVwb3J0IChsaWIvbGlzdF9k
ZWJ1Zy5jOjM1IChkaXNjcmltaW5hdG9yIDEpKSA/DQo+ID4gX19saXN0X2FkZF92YWxpZF9vcl9y
ZXBvcnQgKGxpYi9saXN0X2RlYnVnLmM6MzUgKGRpc2NyaW1pbmF0b3IgMSkpDQo+ID4gZHJtX3Nj
aGVkX3N0b3AgKC4vaW5jbHVkZS9saW51eC9saXN0Lmg6MTUxIC4vaW5jbHVkZS9saW51eC9saXN0
Lmg6MTY5DQo+ID4gZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmM6NjE3KQ0K
PiA+IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXINCj4gPiAoZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jOjU4MDgpDQo+ID4gYW1kZ3B1X2pvYl90aW1lZG91dA0KPiAo
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jOjEwMykNCj4gPiBkcm1fc2No
ZWRfam9iX3RpbWVkb3V0IChkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYzo1
NjkpDQo+ID4gcHJvY2Vzc19vbmVfd29yayAoa2VybmVsL3dvcmtxdWV1ZS5jOjI2MzMpIHdvcmtl
cl90aHJlYWQNCj4gPiAoa2VybmVsL3dvcmtxdWV1ZS5jOjI3MDAgKGRpc2NyaW1pbmF0b3IgMikg
a2VybmVsL3dvcmtxdWV1ZS5jOjI3ODcNCj4gPiAoZGlzY3JpbWluYXRvciAyKSkgPyBfX3BmeF93
b3JrZXJfdGhyZWFkIChrZXJuZWwvd29ya3F1ZXVlLmM6MjczMykNCj4gPiBrdGhyZWFkIChrZXJu
ZWwva3RocmVhZC5jOjM4OCkgPyBfX3BmeF9rdGhyZWFkIChrZXJuZWwva3RocmVhZC5jOjM0MSkN
Cj4gPiByZXRfZnJvbV9mb3JrIChhcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzcy5jOjE0NykgPyBfX3Bm
eF9rdGhyZWFkDQo+ID4gKGtlcm5lbC9rdGhyZWFkLmM6MzQxKSByZXRfZnJvbV9mb3JrX2FzbQ0K
PiA+IChhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TOjI1MSkNCj4gPg0KPiA+IFdoZW4gcnVubmlu
ZyB0aGUgdGVzdHMgd2l0aG91dCBhIGRlc2t0b3AgZW52aXJvbm1lbnQgYWN0aXZlLCB0aGUNCj4g
PiBkb3VibGUtYWRkIGRpc2FwcGVhcmVkLCBidXQgdGhlIEdQVSByZXNldCBzdGlsbCBkaWRuJ3Qg
Z28gd2VsbCAtIHRoZQ0KPiA+IFRUWSByZW1haW5lZCBmcm96ZW4gYW5kIHRoZSBrZXJuZWwgbG9n
IGNvbnRhaW5lZCBhIGZldyBtZXNzYWdlcyBsaWtlOg0KPiA+DQo+ID4gW2RybV0gKkVSUk9SKiBb
Q1JUQzo5MDpjcnRjLTBdIGZsaXBfZG9uZSB0aW1lZCBvdXQNCg0KSGkgRnJpZWRyaWNoLCB3ZSBj
YW5ub3QgcmVwcm9kdWNlIHRoZSBmbGlwX2RvbmUgdGltZWQgb3V0IG9uIGRncHUuDQpjb3VsZCB5
b3UgaGF2ZSBhIGNoZWNrIGlmIHRoZSBoYW5ndGVzdCBydW5zIG9uIGludGVncmF0ZWQgZ3B1IG9y
IHRoZSBkZ3B1LiBJZiBpdCBydW5zIG9uIGlncHUsIGNvdWxkIHlvdSBoYXZlIGEgdHJ5IHRvIGRp
c2FibGUgaWdwdSBpbiBiaW9zIHRvIHNlZSBpZiBpdCB3b3Jrcy4gVGhhbmtzLg0KDQpUaGFua3Ms
DQpKaWFkb25nDQoNCj4gSSBkb24ndCB0aGluayB0aGUgZGlzcGxheSBoYXJkd2FyZSBpcyBodW5n
LCBJIHRoaW5rIGl0J3MgYSBmZW5jZSBzaWduYWxsaW5nIGlzc3VlDQo+IGFmdGVyIHRoZSByZXNl
dC4gIFdlIGFyZSBpbnZlc3RpZ2F0aW5nIHNvbWUgbGltaXRhdGlvbnMgd2UgYXJlIHNlZWluZyBp
biB0aGUNCj4gaGFuZGxpbmcgb2YgZmVuY2VzLg0KPg0KPiA+DQo+ID4gd2hpY2ggSSBndWVzcyBt
ZWFucyBhdCBsZWFzdCB0aGUgZGlzcGxheSBzdWJzeXN0ZW0gaXMgaHVuZy4NCj4gPg0KPiA+IEhv
cGUgdGhpcyBpbmZvIGlzIGVub3VnaCB0byByZXByby9pbnZlc3RpZ2F0ZS4NCj4NCj4gVGhhbmtz
IGZvciB0ZXN0aW5nIQ0KPg0KPiBBbGV4DQo+DQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gRnJpZWRy
aWNoDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbWQtZ2Z4LzIw
MjQwNzE3MjAzNzQwLjE0MDU5LTEtYWxleGFuZGVyLmRldWNoDQo+ID4gZXJAYW1kLmNvbS9ULyN0
IFsyXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FtZC1nZngvMjAyNDA3MTcyMDM4NDcu
MTQ2MDAtMS1hbGV4YW5kZXIuZGV1Y2gNCj4gPiBlckBhbWQuY29tL1QvI3QgWzNdDQo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYW1kLWdmeC8yMzBlZTcyZS00ZjdmLTQ4OTQtYTc4OS0NCj4g
MmUxZTU3ODgzNDRmQGENCj4gPiBtZC5jb20vVC8jdCBbNF0gaHR0cHM6Ly9naXRsYWIuc3RlYW1v
cy5jbG91ZC9ob2xvL0hhbmdUZXN0U3VpdGUNCj4gPg0KPiA+DQo+ID4gPg0KPiA+ID4gQWxleCBE
ZXVjaGVyICgxOSk6DQo+ID4gPiAgICBkcm0vYW1kZ3B1L21lczogYWRkIEFQSSBmb3IgbGVnYWN5
IHF1ZXVlIHJlc2V0DQo+ID4gPiAgICBkcm0vYW1kZ3B1L21lczExOiBhZGQgQVBJIGZvciBsZWdh
Y3kgcXVldWUgcmVzZXQNCj4gPiA+ICAgIGRybS9hbWRncHUvbWVzMTI6IGFkZCBBUEkgZm9yIGxl
Z2FjeSBxdWV1ZSByZXNldA0KPiA+ID4gICAgZHJtL2FtZGdwdS9tZXM6IGFkZCBBUEkgZm9yIHVz
ZXIgcXVldWUgcmVzZXQNCj4gPiA+ICAgIGRybS9hbWRncHUvbWVzMTE6IGFkZCBBUEkgZm9yIHVz
ZXIgcXVldWUgcmVzZXQNCj4gPiA+ICAgIGRybS9hbWRncHUvbWVzMTI6IGFkZCBBUEkgZm9yIHVz
ZXIgcXVldWUgcmVzZXQNCj4gPiA+ICAgIGRybS9hbWRncHU6IGFkZCBuZXcgcmluZyByZXNldCBj
YWxsYmFjaw0KPiA+ID4gICAgZHJtL2FtZGdwdTogYWRkIHBlciByaW5nIHJlc2V0IHN1cHBvcnQg
KHYyKQ0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZngxMTogYWRkIHJpbmcgcmVzZXQgY2FsbGJhY2tz
DQo+ID4gPiAgICBkcm0vYW1kZ3B1L2dmeDExOiByZW5hbWUgZ2Z4X3YxMV8wX2dmeF9pbml0X3F1
ZXVlKCkNCj4gPiA+ICAgIGRybS9hbWRncHUvZ2Z4MTA6IGFkZCByaW5nIHJlc2V0IGNhbGxiYWNr
cw0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZngxMDogcmV3b3JrIHJlc2V0IHNlcXVlbmNlDQo+ID4g
PiAgICBkcm0vYW1kZ3B1L2dmeDk6IGFkZCByaW5nIHJlc2V0IGNhbGxiYWNrDQo+ID4gPiAgICBk
cm0vYW1kZ3B1L2dmeDkuNC4zOiBhZGQgcmluZyByZXNldCBjYWxsYmFjaw0KPiA+ID4gICAgZHJt
L2FtZGdwdS9nZngxMjogYWRkIHJpbmcgcmVzZXQgY2FsbGJhY2tzDQo+ID4gPiAgICBkcm0vYW1k
Z3B1L2dmeDEyOiBmYWxsYmFjayB0byBkcml2ZXIgcmVzZXQgY29tcHV0ZSBxdWV1ZSBkaXJlY3Rs
eQ0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZngxMTogZW50ZXIgc2FmZSBtb2RlIGJlZm9yZSB0b3Vj
aGluZyBDUF9JTlRfQ05UTA0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZngxMTogYWRkIGEgbXV0ZXgg
Zm9yIHRoZSBnZnggc2VtYXBob3JlDQo+ID4gPiAgICBkcm0vYW1kZ3B1L2dmeDExOiBleHBvcnQg
Z2Z4X3YxMV8wX3JlcXVlc3RfZ2Z4X2luZGV4X211dGV4KCkNCj4gPiA+DQo+ID4gPiBKaWFkb25n
IFpodSAoMTMpOg0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZngxMTogd2FpdCBmb3IgcmVzZXQgZG9u
ZSBiZWZvcmUgcmVtYXANCj4gPiA+ICAgIGRybS9hbWRncHUvZ2Z4MTA6IHJlbWFwIHF1ZXVlIGFm
dGVyIHJlc2V0IHN1Y2Nlc3NmdWxseQ0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZngxMDogd2FpdCBm
b3IgcmVzZXQgZG9uZSBiZWZvcmUgcmVtYXANCj4gPiA+ICAgIGRybS9hbWRncHUvZ2Z4OTogcmVt
YXAgcXVldWUgYWZ0ZXIgcmVzZXQgc3VjY2Vzc2Z1bGx5DQo+ID4gPiAgICBkcm0vYW1kZ3B1L2dm
eDk6IHdhaXQgZm9yIHJlc2V0IGRvbmUgYmVmb3JlIHJlbWFwDQo+ID4gPiAgICBkcm0vYW1kZ3B1
L2dmeDkuNC4zOiByZW1hcCBxdWV1ZSBhZnRlciByZXNldCBzdWNjZXNzZnVsbHkNCj4gPiA+ICAg
IGRybS9hbWRncHUvZ2Z4XzkuNC4zOiB3YWl0IGZvciByZXNldCBkb25lIGJlZm9yZSByZW1hcA0K
PiA+ID4gICAgZHJtL2FtZGdwdS9nZng6IGFkZCBhIG5ldyBraXFfcG00X2Z1bmNzIGNhbGxiYWNr
IGZvcg0KPiByZXNldF9od19xdWV1ZQ0KPiA+ID4gICAgZHJtL2FtZGdwdS9nZng5OiBpbXBsZW1l
bnQgcmVzZXRfaHdfcXVldWUgZm9yIGdmeDkNCj4gPiA+ICAgIGRybS9hbWRncHUvZ2Z4OS40LjM6
IGltcGxlbWVudCByZXNldF9od19xdWV1ZSBmb3IgZ2Z4OS40LjMNCj4gPiA+ICAgIGRybS9hbWRn
cHUvbWVzOiBtb2RpZnkgbWVzIGFwaSBmb3IgbW1pbyBxdWV1ZSByZXNldA0KPiA+ID4gICAgZHJt
L2FtZGdwdS9tZXM6IGltcGxlbWVudCBhbWRncHVfbWVzX3Jlc2V0X2h3X3F1ZXVlX21taW8NCj4g
PiA+ICAgIGRybS9hbWRncHUvbWVzMTE6IGltcGxlbWVudCBtbWlvIHF1ZXVlIHJlc2V0IGZvciBn
ZngxMQ0KPiA+ID4NCj4gPiA+IFByaWtlIExpYW5nICgyKToNCj4gPiA+ICAgIGRybS9hbWRncHU6
IGluY3JlYXNlIHRoZSByZXNldCBjb3VudGVyIGZvciB0aGUgcXVldWUgcmVzZXQNCj4gPiA+ICAg
IGRybS9hbWRncHUvZ2Z4MTE6IGZhbGxiYWNrIHRvIGRyaXZlciByZXNldCBjb21wdXRlIHF1ZXVl
IGRpcmVjdGx5DQo+ID4gPiAodjIpDQo+ID4gPg0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAgIDEgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggICAgfCAgIDYgKw0KPiA+ID4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgICAgfCAgMTggKysrDQo+ID4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuYyAgICB8ICA4OCArKysrKysrKysrKysNCj4g
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oICAgIHwgIDM3ICsr
KysrDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggICB8
ICAgMiArDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jICAg
ICB8IDE1OA0KPiArKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMV8wLmMgICAgIHwgMTE3ICsrKysrKysrKysrKystLQ0KPiA+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjExXzAuaCAgICAgfCAgIDMgKw0KPiA+
ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEyXzAuYyAgICAgfCAgOTUgKysr
KysrKysrKysrLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
ICAgICAgfCAxMjYgKysrKysrKysrKysrKysrLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfNF8zLmMgICAgfCAxMjUNCj4gKysrKysrKysrKysrKysrLQ0KPiA+ID4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjExXzAuYyAgICAgfCAxMzINCj4gKysr
KysrKysrKysrKysrKysNCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3Yx
Ml8wLmMgICAgIHwgIDU0ICsrKysrKysNCj4gPiA+ICAgMTQgZmlsZXMgY2hhbmdlZCwgOTMwIGlu
c2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPg0KPiA+DQo+ID4NCg==
