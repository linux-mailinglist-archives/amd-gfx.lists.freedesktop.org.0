Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B169C8381
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Nov 2024 07:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A386010E7A6;
	Thu, 14 Nov 2024 06:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NzQLq9vH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D5C10E7A6
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Nov 2024 06:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeRg1lavkS/oTzK9TYxJJZg47HA4/TYRjXq50mwDl0ClOxXHmRW/O2NHKx4ZlLTKsraS7bRhnDBxJB3qRGefGI9JxAsLvGu0MQnmbBUie+/Ci1c7p9AEAROWs/lUS7VqezVg1PnmFYm5sSq0c3zrax+8g6/KKWqBN40fD0fpOYeU2q8y1HoJA5LQpAAVLvkZz1+nt2u6GJEC50DJZx83Xj4xU8uwKhzJKxjsE333cfW587PPz7sZUe95+aTEALNb5VoY3EfpzpARJPlsW8c1pOgfoBEhNJBYUcWnMU7t7CkTsl01nQrROxwE8VbUHhY3Tge3oJdFUkY7YnXYQqvSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhN1DQtU3AzVbeDFgWnGt8ZcslC/tJfM9CEGD/rCCmI=;
 b=GaT2HkUU1C9+fFeh4Ayj+QpUaaMFgebbrJS0OjUH3m8IEr2LepN6e8MBwaYxoWEHQ7pQb7/CkNm9n6idqhjY968nwDsffN5U39a6LVfAwUuuMshV/ALExbu55OdwqWKxajiy9tRmjDWONkiqKN16soF0N0F2ss3QzwhZ0uWx6zgKANXpWaf7M0vRS71imkXhnnNI4//YRFg/7fWd4pgfbGVRx3MuBhsPQsFHs45tvska0Cztpb5ESct7tCuKm/AOkVdM3qw8XfkIj9LdUPTwoSD9h/M8q4RrpH/DsVF5wkj0NYGZlvIs10x8mWQ/zEvJIOD1pywlafoSh96+Fsihqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhN1DQtU3AzVbeDFgWnGt8ZcslC/tJfM9CEGD/rCCmI=;
 b=NzQLq9vH5QFy2lN0peBBoc7oFuVX8A3rT5ooVSHQLJtnaW/TBLfRaPXnd7c1hmYhgv9BKk3eDJpqlIxEm9ZJFzpj/d7jGVz8ux60jVpYXz1Z42rP0i73IKPuceU0yQzLHC1QGLKClm5s5Daf7cnLND8gxIOQXGtQSDMLzChbSj4=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by SA3PR12MB8762.namprd12.prod.outlook.com (2603:10b6:806:31f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:59:26 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::962e:1ce3:e83f:8482]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::962e:1ce3:e83f:8482%7]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 06:59:26 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 "Zhao, Victor" <Victor.Zhao@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yang,
 Philip" <Philip.Yang@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: RE: [PATCH 2/2] drm/amdkfd: use cache GTT buffer for PQ and wb pool
Thread-Topic: [PATCH 2/2] drm/amdkfd: use cache GTT buffer for PQ and wb pool
Thread-Index: AQHbMBZHMXJO9/1Wb0SUcDj9uFrCqbKqXF8AgAD3oQCAAGQwgIABdj0ggAALTuCAAAgzAIAEDwiAgABMXYCAAHAagIAA+9eggABklYCAAvUhYA==
Date: Thu, 14 Nov 2024 06:59:26 +0000
Message-ID: <BL1PR12MB52690ED7A33543722B48ACA6845B2@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <20241106063322.2443403-1-Victor.Zhao@amd.com>
 <20241106063322.2443403-2-Victor.Zhao@amd.com>
 <CADnq5_NDDBsWrZvxQrCk8-qXfk-xBUBTM62SNawC__BANtpjOQ@mail.gmail.com>
 <6dc831bf-f7d8-4e9d-98c8-8204b330e466@amd.com>
 <7c8e9102-0d4f-405c-8749-1653118400f1@amd.com>
 <BL1PR12MB5269C32C36AEBAE40FBC131A845D2@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB52690F8688563810F74A261A845D2@BL1PR12MB5269.namprd12.prod.outlook.com>
 <7c0bc3a5-756d-4c60-b459-73a2ee910ce7@amd.com>
 <BL1PR12MB5269AC1E12A48107FA87A03084582@BL1PR12MB5269.namprd12.prod.outlook.com>
 <6950b5e1-c283-4029-84e8-7dcc42b16912@amd.com>
 <bef834a5-b7ae-4ef0-bd75-55003d38f4ac@gmail.com>
 <BL1PR12MB526909544DD2302032E2488084592@BL1PR12MB5269.namprd12.prod.outlook.com>
 <0b00a914-0274-4268-9e9f-c2ff3e43da12@amd.com>
In-Reply-To: <0b00a914-0274-4268-9e9f-c2ff3e43da12@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=76cebccc-897d-4345-8cfc-a417a52aece5;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-14T06:51:05Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5269:EE_|SA3PR12MB8762:EE_
x-ms-office365-filtering-correlation-id: 2d48bc1a-7169-469a-b02a-08dd0479e0e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2hvOUt4SXhZb0hYOW5xMHM5SlZsYUhIVTRZOGwraTdMaHlqVnIyWmYvSkxo?=
 =?utf-8?B?V094ZFNqMVN2bS9pQS9QRk9JNzBzWE9zZnY2bXhTdGpPaXRWNFh4dnZqMXhz?=
 =?utf-8?B?SXdDd0I1SmJmWndoNGJYcisvM2pRdk5CNlFNOTVhdnBCM0VabTFGU2wxSlF3?=
 =?utf-8?B?eHh4VnIwc1RwdnRuc240ek5vWUNqem1BcVFkZWhaSDFoTTA3NVU5anBmSHZL?=
 =?utf-8?B?Z0x5VGtxQ1hqcXl6Mlo4UUVBWHFHV3dmbUZnZWVzUUViay83VlhGanh6RTYw?=
 =?utf-8?B?TkZURXU0OGwvblNrS25sa3IxZWg4T1A4SVZDbHlwcnV1cE5mbzRDWWxiUDNE?=
 =?utf-8?B?aGJSeEFVRlNzUFJKWGt4dy9oZmVaeTVDVDlEOXIyNnhIQnFUYWZGclhUci9r?=
 =?utf-8?B?WDFueWNnd2pPYUpKYjhFQXVGOWZoNjZKQjZybFV4Y1R6ZFJYaGw2UGNKM0Jw?=
 =?utf-8?B?L09TZVA0akd3MXErTmFjQ0JRdTlnNFlNcEFYMlE2RXZ5NnA5ZW1Hak13ZW05?=
 =?utf-8?B?QTFkREREcXlnZ1p0eG42MW5mODkxV2hQeHl0aXM3clhZRnZjeWsrWG9ZbHlN?=
 =?utf-8?B?TDRVc2YwbjlEc2VNWHdUNG8rSVlWMHZlcExab2pGT1o2ekRsU05nbnNrNTJ0?=
 =?utf-8?B?dzBBaGllck0rMXBrWk5NSnhQTWJIL2FFaThoZjlPOVh3UlhKSGx5UmxJUTJr?=
 =?utf-8?B?c3hTZ2ZyQkpTcVVSSnN1cTA2UllsbVEzUnFGdG9vczBWQWszZjJxWmF6KzBx?=
 =?utf-8?B?aTB5Vk9OL1V3S1lCTndENVlLVmgyUDJjakVDaHl6V0UrVi84d0RFaXR3S05q?=
 =?utf-8?B?TlRXbVl3bmxoVEdvY08wdm9pNEk2UnozUlIwdWQyUEw3RmZwVGRib0Z0QzFX?=
 =?utf-8?B?Q2t3cFVHK05KOVRKb2dPVGdsZHJhWHBkWm5yZUlRaDB2MHphY3pXS0lUSFdu?=
 =?utf-8?B?VXNYLzNRQlloUERSZVZYYTJxUWtNck5oTlZNbW8rTXJ1cDhndVkvUmovOVAy?=
 =?utf-8?B?ZUYxa0dHK01OMjQrMmdEd1I3QzNSeW9KNEVTMVRFc3ZqOFd3RXcxRjJaeFUy?=
 =?utf-8?B?Ylc3cS9OQkpPanp0ZklHSkdwN2ZNQzdKQUR2UXVYQ2RrTVA2b0x1b2c5OGlu?=
 =?utf-8?B?NFQyeE1YZjRJcXpEQ3Y2RDJTT0Z2OUY4VlJnNldUcFNFbVJ0T04razdGZEJm?=
 =?utf-8?B?UWtLemJETTNiR2FBSytmV3ZEUnB3SkVQcTU2SnBlMFdDQlBFZExpS2F4azUx?=
 =?utf-8?B?MmdKSDRBUGxiV1pZSS9kNTg1d2kxanY5cGtDYjVQMzVPb25JcUhjclpYbGtn?=
 =?utf-8?B?ZGdwQTNjaDkxN29XNy9BZkFoYTBFSUJCRFdoTkFhQUxmUmdOT3NPQkF1VTZC?=
 =?utf-8?B?eTZ6dE9UZ3RZUkVZaFAzUUtoZTNkTzZ3d0xTOFNhYWJ5T3IzR1Q3VTkyd3V6?=
 =?utf-8?B?RHhhVFJxckpndTJWTnRpRTRCRlhEOEE5azhuN1VCYnpsd2lpYndIbjI1aXU0?=
 =?utf-8?B?RUZoczBPSU5vejlpNGlhaGx4Z3htZThsZUZLTjJaNW15YS9Nbkl4UGxiaEFq?=
 =?utf-8?B?SmFuM0RLbUVJYjJaV2VUSmFnZlFWZUlBekx4REt0Tmk2VDhCNU9acjZhOHQ5?=
 =?utf-8?B?TTllWnpEanRCMFIxTDU0d1FKOHdVWTkwNmdQb2NIUVFKYzk1WHV0cEQyQlBU?=
 =?utf-8?B?RjRCcmFpMnFyOWpneDNMNmhibzIwSVNTMTNjaUQzaTVyWDNIRWo1b2VqditU?=
 =?utf-8?B?N3NvY1BOMUx0b0Nya05WMStod2lkMVNEbkNodlFxMTNTZlNSV0JLNCt6NDA5?=
 =?utf-8?Q?Utlv8GKTyRhK8I5NSOn1trOIHEN9wimOmaazM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXZ0cE52ZC9QcjJDSzJlY05LSHNrQkxrRkFlNjNqL3E5bWxCZmNMUlYxMjY1?=
 =?utf-8?B?VW82SjFkbEd5KzJxaXFvSnMvSnVoOEVUWFpTNURGWDI3cXlWOEgvR3FQTUtl?=
 =?utf-8?B?V0RBb1lNT0pOdVFSSDlzbURvbzVKWVRkVzkwUEhNMTFoWHRYblNQVm5SOE9q?=
 =?utf-8?B?UnM4YXhkVTN4ckF3V05pMGpMWC9ISWQ1cFpSZjlzOFhKcS96Y29lZG03cWFV?=
 =?utf-8?B?ZzlDMUgyMVJZMlJML3JnWXI2VGYvOWxrTlRGcUdlbXRLc3JtcjNmSUNCQ05o?=
 =?utf-8?B?UzdpamNSOURmeUV3cnNVZlIrZDNDOXZHTVc5eTlsRW9pRGdLYWxVOWgxZ2Fx?=
 =?utf-8?B?NVpuTzdRcStmUWMxN3hVTE50TmhrK0NHbE4vV2ZaU2tXcHlJU0lPUVdXUXBF?=
 =?utf-8?B?VzR2RFRPSGdmTmtOYTRrREQ1UEtmNkIrdkFQZVR0dXo5UkRHak5vOUUwam5P?=
 =?utf-8?B?WmtjczNNZVN2ZCtzays5YUo3TUlQOFE5YU5NeStudTdGcmZKRm5xeFRGTXdx?=
 =?utf-8?B?cUkzaURlKytJSW5vMmpodUtrdE5XNWtwYXNkSEQ4aFczUGV1clZYc1JVaUJL?=
 =?utf-8?B?UjZIMUFQUEFEZUpDV3V3eWJJelpjMWE4UGhldHdET2RGbjY4WEFXQVd0ajFa?=
 =?utf-8?B?NE5zTElTc3JGdDZPblZBS2xMZjNFRlEzRHF0Sm9HMyt6NzVxTlBDWlQ5U0dS?=
 =?utf-8?B?STNZU2plQ29pdXp1c09Gd0RJQTFTb09rekhlUGp1VGd3bEx2YUJXRlJHMW1Q?=
 =?utf-8?B?TkllNDFyOHdvWmpxTjdCWG5GVGxKUVBqeFdmUUZJM0tvdHh4WlZ1Q0R5b05V?=
 =?utf-8?B?M0xjZWlFamlmTUxNVjRRMEIzZ3lDS3AydHpEZFRpdWNmRGt2VmpTWUUrOG9X?=
 =?utf-8?B?TjR0c01ySTRyVk45WnQyL0I5WGpzOXdzQmRkVTQ3RVo5YXBOK3dHYjlLZHFu?=
 =?utf-8?B?MGVxZ0ZKbUhIakdSb25OTjZLRVdFUjVZalpBU0VqZG1CeDlhb0EvWVU1Sld1?=
 =?utf-8?B?Q1hHbHJONmtZYUVXY3oyYkJQRUhhR1lrVXhMRGI5L284a2ZRejNuTFBIWTJo?=
 =?utf-8?B?eTVhY1QydFl4SFgrMkJCM3RGUVpPZGVVQUdRMjkwTVhOL3BoS3NwK1IzT3Zn?=
 =?utf-8?B?OEZrSE53NlRuSFVJVURKM0xJNHg2b3FPbEthZDFoU2owZnlxZ2tMc0pIMGxx?=
 =?utf-8?B?YmYzY050R092T0lSbGdlYVB4bmVZa1ByVUxPaC9USTVTdXpyLzhtVTRGbUtC?=
 =?utf-8?B?bktHaCthaWZxc2xEM1hQTTgyZTVGeWZyejhXa2NBMVBJQW9UcVdOaXg3N2xM?=
 =?utf-8?B?djVEdXlUeGdUc1ZaSEI3YlJ1UE5wK1ZxY2NHYTNqZ3hKYXZpK1ZrVWFtQzAv?=
 =?utf-8?B?emZnRnhaRUJGT3MzUWZKZFQrWW5qUWdUbU1rNG9LK0xKTHJNR2ZJcU5Rcmw2?=
 =?utf-8?B?ejRNQTJ3TEpIWHFEVElnZmNaV3IxYWFLcUhTT2s0TjNDeUZ3eFAxNXJFL0dh?=
 =?utf-8?B?U25pVm1Fd2x0aUllU093MjViNzNLUTRNSmpxUDlma3h0eEp5aTVKb1hLNmZM?=
 =?utf-8?B?S0tCb21wUWR4T1NpcHo0SVRPOGdabU1wTmpONmNlN01BMElDa2ptNHNyWkV6?=
 =?utf-8?B?dlNxcnZqZytOa3B6WmRQdGU0S3Erc2dNbXR5MldJRkRjSzhKUFB1Ym0xYzE5?=
 =?utf-8?B?cVlVd09EbGdXYmtEa2llbVhSYy9SQUFta0NTdk93eWRqOUlOTi9sOWRUSlh5?=
 =?utf-8?B?YWYvWDA4aTJWOXBDMlM0ZFNwWFE3Z2llTEx3WnJPaHIyM2pZL2czQWQyeTNr?=
 =?utf-8?B?aEpjZ3pVZk55eWlocHZTWW9FR0VNdTBGZEkrR1l1emx5amlQVUd1MnlBR0Zk?=
 =?utf-8?B?bzFOVGdVbW5nRGFWdDljZzdDNVdIMURSdTBkTXhFK1kzNC9LOUlFTnJFcG1O?=
 =?utf-8?B?b1oyZ2Z0Z0NwMlhWOHBqQlVEVUFQRXE3VEl2c0lUV1k2b1ZLeHl2NUpGUXly?=
 =?utf-8?B?alJCWkRVUE9kelJkY2RtdzkzMGdyQ0tHNVAwbW9sbU1BQ0FJMmNoTXRiZWJP?=
 =?utf-8?B?TzVqekZEVE1UNkJ2U1ZLaUwyNG1XS2plUDVtMjFNUG1OS29VQWFFS3d3S0JV?=
 =?utf-8?Q?/UuU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d48bc1a-7169-469a-b02a-08dd0479e0e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 06:59:26.6716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqOyMILC946tCtnrWLSpUrtC1HgTpzfqbgJ4uZ6ndCT8JiIxGkpKs6AGkoWGBnOS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8762
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
Cg0KPj4gUUVNVSBhbmQgdGhlaXIgdmlydHVhbCBkcml2ZXJzIHVzZXMgYSB2aXJ0dWFsIFBDSSBN
TUlPIEJBUiB0byBtYXAgYnVmZmVycyBmcm9tIHRoZSBob3N0IGludG8gdGhlIGd1ZXN0LiBUaG9z
ZSBidWZmZXJzIGNhbiBiZSBib3RoIHBvaW50IHRvIHRoZSBGQiBCQVIgYXMgd2VsbCBhcyBzeXN0
ZW0gbWVtb3J5Lg0KDQpXZWxsLCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdmlydC1pbyBHTCB1c2Ug
Y2FzZT8gT3IgbURldiBzb2x1dGlvbiA/IGJlY2F1c2UgdGhvc2UgY29udmVudGlvbmFsIGRldmlj
ZSBsaWtlIFFYTCwgTklDLCBzb3VuZGNhcmQgYXJlIHB1cmVseSBzb2Z0d2FyZSBlbXVsYXRlZCBh
bmQgbm8gd2F5IHRvIHBvaW50IHRvIHRoZSBGQiBCQVIgLi4uDQoNCkkgY2FuIHVuZGVyc3RhbmQg
dGhhdCBIb3N0IG1ha2UgdGhlIGZpbmFsIGRlY2lzaW9uIG9uIHRoZSBtZW1vcnkgaWYgaXQgaXMg
RkIgY2FuIGJlIGxldmVyYWdlZCBieSBndWVzdCBhcyBzb21lIHN5c3RlbSBtZW1vcnksIGJ1dCBi
cnV0ZWx5IHRyZWF0IGFsbCBzeXN0ZW0gbWVtb3J5IGFzIGNhY2hlIG5vIG1hdHRlciB3aGF0IGd1
ZXN0IGRvIGlzIHVnbHkgLi4uDQoNCkJhY2sgdG8gb3VyIHRvcGljLCBJIHByb3BhZ2F0ZWQgeW91
IGFuZCBMaWpvJ3Mgc3RhdGVtZW50IHRvIGN1c3RvbWVyIGFuZCB0aGV5IGRpZG4ndCBidXkgaXQs
IHJhdGlvbmFsIGFzOg0KDQoxKSB0aGV5IGRvbid0IHRoaW5rIGxldCBob3N0IGhvbm9yIHRoZSBy
ZWFsIG1hcHBpbmcgaXMgY29ycmVjdCBhcyB0aGV5IGRvbid0IGhhdmUgYW55dGhpbmcgbGlrZSB2
aXJ0LWlvIEdMIHNvbHV0aW9uIGluIHVzZS4uLg0KMikgdGhleSBjYW5ub3Qgc3VmZmVyIHJpc2sg
dG8gcmV2ZXJ0IHRoYXQgS1ZNIHBhdGNoIG9uIHRoZWlyIHNlcnZlci4NCg0KU28gdGhlIHRoaW5n
IGlzIHRoZXkgd2lsbCBsaXZlIHdpdGggYSBob3RmaXggcGF0Y2ggZm9yIG5vdywgYnV0IHRoZXkg
YXJlIGFsc28gYXNraW5nOg0KDQpXaHkgY2Fubm90IEFNRCBtYWtlIGFsbCByaW5nIGJ1ZmZlciAo
bWFuYWdlZCBieSBLTUQvS0ZEKSB0byB0aGUgc2FtZSB0eXBlIHdoaWNoIGlzIGNhY2hlLCBhcyB0
aGV5IGtub3cgdGhhdCBHRlggcmluZyBmcm9tIGFtZGdwdSBpcyBjYWNoZSB0eXBlLg0KDQpCZXNp
ZGVzLCBib3RoIGN1c3RvbWVyIGFuZCBDVlMgdGVhbSB3aWxsIGFsc28ga2VlcCBpbnZlc3RpZ2F0
ZSB3aHkgYWZ0ZXIgdGhlIG1hcCBpcyBob25vcmVkIGJ5IGd1ZXN0IHRoZXJlIGlzIHN0aWxsIGNv
aGVyZW5jZSBpc3N1ZSAodHlwZSBpcyBVU1dDLCBtZmVuY2UgaXMgaW5zZXJ0ZWQgYmV0d2VlbiBk
b29yYmVsbCBhbmQgd3B0cl9wb2xsaW5nIHVwZGF0ZXMpDQoNCkFueXdheSwgTGlqbywgQ2hyaXN0
aWFuLCB0aGFua3MgZm9yIHlvdXIgZXhwbGFpbiBhbmQgaW5zaWdodCAhDQoNCk1vbmsgTGl1IHwg
Q2xvdWQgR1BVICYgVmlydHVhbGl6YXRpb24gfCBBTUQNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT4NClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDEyLCAyMDI0IDU6NDEgUE0NClRvOiBMaXUsIE1v
bmsgPE1vbmsuTGl1QGFtZC5jb20+OyBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT47IExhemFyLCBMaWpvIDxMaWpvLkxhemFyQGFtZC5jb20+OyBBbGV4
IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT47IFpoYW8sIFZpY3RvciA8VmljdG9yLlpo
YW9AYW1kLmNvbT4NCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWWFuZywgUGhp
bGlwIDxQaGlsaXAuWWFuZ0BhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS9hbWRrZmQ6IHVzZSBjYWNo
ZSBHVFQgYnVmZmVyIGZvciBQUSBhbmQgd2IgcG9vbA0KDQpIaSBNb25rLA0KDQo+IFRoZSBtZW1v
cnkgd2UgYXJlIHRhbGtpbmcgYWJvdXQgaXMgcHVyZSBndWVzdCBzeXN0ZW0gbWVtb3J5IG5vdCBG
QiBCQVIgcmlnaHQ/DQoNCk5vLCB0aGF0IHdvcmtzIGEgYml0IGRpZmZlcmVudGx5Lg0KDQpRRU1V
IGFuZCB0aGVpciB2aXJ0dWFsIGRyaXZlcnMgdXNlcyBhIHZpcnR1YWwgUENJIE1NSU8gQkFSIHRv
IG1hcCBidWZmZXJzIGZyb20gdGhlIGhvc3QgaW50byB0aGUgZ3Vlc3QuIFRob3NlIGJ1ZmZlcnMg
Y2FuIGJlIGJvdGggcG9pbnQgdG8gdGhlIEZCIEJBUiBhcyB3ZWxsIGFzIHN5c3RlbSBtZW1vcnku
DQoNCk9ubHkgdGhlIGhvc3Qga25vd3MgaWYgdGhlIGJ1ZmZlciBpcyBiYWNrZWQgYnkgTU1JTyAo
RkIpIG9yIHN5c3RlbSBtZW1vcnksIHNvIG9ubHkgdGhlIGhvc3QgY2FuIHNldHVwIHRoZSB0YWJs
ZXMgdG8gaGF2ZSB0aGUgY29ycmVjdCBjYWNoaW5nIGFuZCBXQyBhdHRyaWJ1dGVzLg0KDQpUaGUg
S1ZNIHBhdGNoIGNvbXBsZXRlbHkgYnJlYWtzIHRoYXQgYmVjYXVzZSB0aGV5IHN1ZGRlbmx5IHNh
eSB0aGF0IG5vdCB0aGUgaG9zdCBzZXR1cHMgdGhlIGNhY2hpbmcgYW5kIFdDIGF0dHJpYnV0ZXMg
YnV0IHRoZSBndWVzdC4NCg0KQmVjYXVzZSBvZiB0aGF0IHRoaXMgS1ZNIHBhdGNoIG5vdCBvbmx5
IGJyZWFrcyBhbWRncHUsIGJ1dCBhbHNvIG90aGVyIGRyaXZlcnMgd2hpY2ggZG8gdGhlIHNhbWUg
dGhpbmcuIFRoZSBnZW5lcmFsIGFwcHJvYWNoIG9mIHRoZSBwYXRjaCBzZWVtcyB0byBiZSBicm9r
ZW4uDQoNCj4gICAgICAgICAgIGlmIChrcS0+ZGV2LT5rZmQtPmRldmljZV9pbmZvLmRvb3JiZWxs
X3NpemUgPT0gOCkgew0KPiAgICAgICAgICAgICAgICAgICAqa3EtPndwdHI2NF9rZXJuZWwgPSBr
cS0+cGVuZGluZ193cHRyNjQ7DQo+ICsgICAgICAgICAgICAgICBtYigpOw0KPiAgICAgICAgICAg
ICAgICAgICB3cml0ZV9rZXJuZWxfZG9vcmJlbGw2NChrcS0+cXVldWUtPnByb3BlcnRpZXMuZG9v
cmJlbGxfcHRyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBr
cS0+cGVuZGluZ193cHRyNjQpOw0KPiAgICAgICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAgICAg
ICAgICAgKmtxLT53cHRyX2tlcm5lbCA9IGtxLT5wZW5kaW5nX3dwdHI7DQo+ICsgICAgICAgICAg
ICAgICBtYigpOw0KPiAgICAgICAgICAgICAgICAgICB3cml0ZV9rZXJuZWxfZG9vcmJlbGwoa3Et
PnF1ZXVlLT5wcm9wZXJ0aWVzLmRvb3JiZWxsX3B0ciwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAga3EtPnBlbmRpbmdfd3B0cik7DQoNCldlIHNob3VsZCBwcm9i
YWJseSBtb3ZlIHRoYXQgaW50bw0Kd3JpdGVfa2VybmVsX2Rvb3JiZWxsKCkvd3JpdGVfa2VybmVs
X2Rvb3JiZWxsNjQoKSBidXQgaW4gZ2VuZXJhbCBsb29rcyBjb3JyZWN0IHRvIG1lIGFzIHdlbGwu
DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDEyLjExLjI0IHVtIDA0OjUwIHNjaHJpZWIg
TGl1LCBNb25rOg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3Ry
aWJ1dGlvbiBPbmx5XQ0KPg0KPiBIaSBMaWpvDQo+DQo+IFRoYW5rcyBmb3IgeW91ciBxdW90ZSB0
byB0aGUgU1BFQywgeWVzIEkgcmVhZCB0aGF0IGFzIHdlbGwsIHN1cHBvc2VkbHkgV0Mgc3RvcmFn
ZSBidWZmZXIgc2hhbGwgYmUgZmx1c2hlZCB0byBtZW1vcnkgd2l0aCBtZmVuY2UsIGJ1dCBpdCBq
dXN0IGRvZXNuJ3Qgd29yayBhZnRlciBhcHBsaWVkIHRoYXQgS1ZNIHBhdGNoIHdoaWNoIGhvbm9y
IHRoZSBXQyBhdHRyaWJ1dGVzIGZyb20gZ3Vlc3QuDQo+DQo+IFRoaXMgbWVhbnMgdGhlIFdDIHN0
b3JhZ2UgYnVmZmVyIGZyb20gYSBLVk0gZ3Vlc3QgY291bGRu4oCZdCBiZSBmbHVzaGVkDQo+IHRv
IG1lbW9yeSBldmVuIHdpdGggbWIgaW5zZXJ0ZWQuLi4gSSBkb24ndCBrbm93IHdoeS4gKGlzIHRo
ZXJlIGFueQ0KPiBpbmNvbnNpc3RlbmNpZXMgYmV0d2VlbiBuZXN0ZWQgcGFnZSB0YWJsZXMgYW5k
IGhvc3QgcGFnZSB0YWJsZXM/KQ0KPg0KPiBIaSBDaHJpc3RpYW4NCj4NCj4+PiBUaGUgZ3Vlc3Qg
c2VlcyBkcml2ZXIgZXhwb3NlZCBtZW1vcnkgYXMgImVtdWxhdGVkIiBNTUlPIEJBUiBvZiBhIFBD
SWUgZGV2aWNlLCB0aGF0J3MganVzdCBob3cgUUVNVSBpcyBkZXNpZ25lZC4gQmVjYXVzZSBvZiB0
aGlzIHRoZSBndWVzdCBtYXBzIHRoZSBtZW1vcnkgVVNXQyBvciB1bmNhY2hlZC4gQnV0IGluIHJl
YWxpdHkgdGhlIG1lbW9yeSBjYW4gYXMgd2VsbCBiZSBHVFQgbWVtb3J5IHdoaWNoIGlzIGNhY2hl
ZC4NCj4gVGhlIG1lbW9yeSB3ZSBhcmUgdGFsa2luZyBhYm91dCBpcyBwdXJlIGd1ZXN0IHN5c3Rl
bSBtZW1vcnkgbm90IEZCIEJBUiByaWdodD8gVGhlcmVmb3JlLCBJIGRvbid0IHNlZSB3aHkgaW4g
cmVhbGl0eSBpdCBoYXMgdG8gYmUgY2FjaGVkLCB5b3Ugc2VlIHRoYXQgb25seSBndWVzdCB2Q1BV
IGlzIGFjY2Vzc2luZyB0aGlzIGJ1ZmZlci4NCj4NCj4NCj4gQlRXOiB3ZSBzaG91bGQgYXdheXMg
aW5zZXJ0IHRoYXQgTUIoKSBpbiBvdXIgS0ZEIHBhcnQ6DQo+DQo+Pj4gICAgICAgICAgIGlmIChr
cS0+ZGV2LT5rZmQtPmRldmljZV9pbmZvLmRvb3JiZWxsX3NpemUgPT0gOCkgew0KPj4+ICAgICAg
ICAgICAgICAgICAgICprcS0+d3B0cjY0X2tlcm5lbCA9IGtxLT5wZW5kaW5nX3dwdHI2NDsNCj4+
PiArICAgICAgICAgICAgICAgbWIoKTsNCj4+PiAgICAgICAgICAgICAgICAgICB3cml0ZV9rZXJu
ZWxfZG9vcmJlbGw2NChrcS0+cXVldWUtPnByb3BlcnRpZXMuZG9vcmJlbGxfcHRyLA0KPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtxLT5wZW5kaW5nX3dwdHI2
NCk7DQo+Pj4gICAgICAgICAgIH0gZWxzZSB7DQo+Pj4gICAgICAgICAgICAgICAgICAgKmtxLT53
cHRyX2tlcm5lbCA9IGtxLT5wZW5kaW5nX3dwdHI7DQo+Pj4gKyAgICAgICAgICAgICAgIG1iKCk7
DQo+Pj4gICAgICAgICAgICAgICAgICAgd3JpdGVfa2VybmVsX2Rvb3JiZWxsKGtxLT5xdWV1ZS0+
cHJvcGVydGllcy5kb29yYmVsbF9wdHIsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAga3EtPnBlbmRpbmdfd3B0cik7DQo+Pj4gICAgICAgICAgIH0NCj4gVGhh
bmtzDQo+DQo+IE1vbmsgTGl1IHwgQ2xvdWQgR1BVICYgVmlydHVhbGl6YXRpb24gfCBBTUQNCj4N
Cj4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
Tm92ZW1iZXIgMTEsIDIwMjQgODo0MCBQTQ0KPiBUbzogTGF6YXIsIExpam8gPExpam8uTGF6YXJA
YW1kLmNvbT47IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47DQo+IEtvZW5pZywgQ2hyaXN0
aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBBbGV4IERldWNoZXINCj4gPGFsZXhkZXVj
aGVyQGdtYWlsLmNvbT47IFpoYW8sIFZpY3RvciA8VmljdG9yLlpoYW9AYW1kLmNvbT4NCj4gQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBZYW5nLCBQaGlsaXAgPFBoaWxpcC5ZYW5n
QGFtZC5jb20+Ow0KPiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm0vYW1ka2ZkOiB1c2UgY2FjaGUgR1RUIGJ1ZmZl
ciBmb3IgUFEgYW5kDQo+IHdiIHBvb2wNCj4NCj4gSGkgZ3V5cywNCj4NCj4gdHJ5aW5nIHRvIG1l
cmdlIG11bHRpcGxlIHJlc3BvbnNlcyBiYWNrIGludG8gb25lIG1haWwgdGhyZWFkLg0KPg0KPiBM
aWpvLCB5b3UncmUgY29tcGxldGVseSByaWdodCwgYnV0IHRoZXJlIGlzIG9uZSByZWFsbHkgc3Ry
b25nIGFyZ3VtZW50IHlvdSBhcmUgbWlzc2luZzoNCj4NCj4gVGhlIHBhdGNoIGhlcmUgZG9lc24n
dCBjaGFuZ2UgdGhlIHdyaXRlIGNvbWJpbmUgYmVoYXZpb3IsIGl0IGNoYW5nZXMgdGhlIGNhY2hp
bmcgYmVoYXZpb3IhDQo+DQo+IFNvIHdoZW4gdGhlIHBhdGNoIHdvcmtzIGFuZCBmaXhlcyB0aGUg
aXNzdWUsIHRoZW4gdGhlIGlzc3VlIGlzIDEwMCUNCj4gY2VydGFpbiBub3QgYSB3cml0ZSBjb21i
aW5lIGlzc3VlIGJ1dCByYXRoZXIgYW4gaW5jb3JyZWN0bHkgYXBwbGllZA0KPiBjYWNoaW5nIDop
DQo+DQo+PiAgIEZyb20gd2hhdCBJIGhlYXJkIHRoZXJlIHdhcyBhIEtWTSBwYXRjaCB0byBjb3Jy
ZWN0IHRoZSBtYXBwaW5nIGJlaGF2aW9yIC0tIHByZXZpb3VzbHkgdGhlIG1hcHBpbmcgaXMgZm9y
Y2VkIHRvIGNhY2hlIG1vZGUgZXZlbiBndWVzdCBLTUQgbWFwcyB0aGUgYnVmZmVyIHdpdGggIldD
Ii4NCj4+IEJ1dCBhZnRlciB0aGUgcGF0Y2ggdGhlIGJ1ZmZlciB3aWxsIGJlIHJlYWxseSAiV0Mi
IGlmIGd1ZXN0IG1hcHMgaXQgd2l0aCBXQyIuLi4gYW5kIHRoaXMgcmV2ZWFscyB0aGUgYnVnIGFu
ZCBoaXQgb3VyIGlzc3VlLg0KPiBZZWFoLCBleGFjdGx5IHRoYXQncyB0aGUgcHJvYmxlbS4gVGhl
IGd1ZXN0IGRvZXNuJ3Qga25vdyBpZiBXQiwgVVNXQyBvciB1bmNhY2hlZCBzaG91bGQgYmUgdXNl
ZCENCj4NCj4gVGhlIGd1ZXN0IHNlZXMgZHJpdmVyIGV4cG9zZWQgbWVtb3J5IGFzICJlbXVsYXRl
ZCIgTU1JTyBCQVIgb2YgYSBQQ0llIGRldmljZSwgdGhhdCdzIGp1c3QgaG93IFFFTVUgaXMgZGVz
aWduZWQuIEJlY2F1c2Ugb2YgdGhpcyB0aGUgZ3Vlc3QgbWFwcyB0aGUgbWVtb3J5IFVTV0Mgb3Ig
dW5jYWNoZWQuIEJ1dCBpbiByZWFsaXR5IHRoZSBtZW1vcnkgY2FuIGFzIHdlbGwgYmUgR1RUIG1l
bW9yeSB3aGljaCBpcyBjYWNoZWQuDQo+DQo+IFNvIGZvcmNpbmcgdGhlIGNhY2hlIG1vZGUgZXZl
biBpZiB0aGUgZ3Vlc3QgS01EIG1hcHMgdGhlIGJ1ZmZlciB3aXRoICJXQyIgaXMgaW50ZW50aW9u
YWwgYmVoYXZpb3IsIHRoYXQncyB0aGUgY29ycmVjdCBhcHByb2FjaC4NCj4NCj4gVGhlIHVwc3Ry
ZWFtIHBlb3BsZSByZWFsaXplZCB0aGF0IGFzIHdlbGwuIFRoYXQncyBvbmUgbWFqb3IgcmVhc29u
IHdoeSB0aGUgcGF0Y2ggd2FzIHJldmVydGVkLg0KPg0KPj4gQ2FuIHlvdSBleHBsYWluIHdoeSBV
U1dDIGZvciByaW5nIGJ1ZmZlciBpcyBzYWZlLCB3aHkgaXQgd2lsbCBub3QgaGl0IGNvaGVyZW5j
ZSBpc3N1ZSwgd2h5IHlvdSBkb24ndCBtYWtlIGFsbCByaW5nIGJ1ZmZlcnMgd2l0aCBVU1dDIGV2
ZW4gZm9yIGFtZGdwdSBzaWRlIGlmIHlvdSByZWFsbHkgYmVsaWV2ZSBVU1dDIGlzIGlubm9jZW50
IC4uLg0KPiBXZSBhbHJlYWR5IHRyaWVkIHRoaXMsIGJ1dCB0aGVyZSBpcyBzaW1wbHkgbm8gYmVu
ZWZpdCBmb3IgaXQuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4NCj4NCj4gQW0gMTEu
MTEuMjQgdW0gMDY6NTggc2NocmllYiBMYXphciwgTGlqbzoNCj4+IE9uIDExLzExLzIwMjQgNzow
MCBBTSwgTGl1LCBNb25rIHdyb3RlOg0KPj4+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQg
SW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQo+Pj4NCj4+PiBIaSBMaWpvDQo+Pj4NCj4+PiBU
aGlzIGlzIHRoZSBwYXRjaCB3ZSB2ZXJpZmllZCBiZWZvcmU6DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZS5jDQo+Pj4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMNCj4+PiBpbmRleCA0
ODQzZGNiOWE1ZjcuLjM5NTUzYzc2NDhlYiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMNCj4+PiBAQCAtMzA4LDEwICszMDgsMTIg
QEAgaW50IGtxX3N1Ym1pdF9wYWNrZXQoc3RydWN0IGtlcm5lbF9xdWV1ZSAqa3EpDQo+Pj4NCj4+
PiAgICAgICAgICAgaWYgKGtxLT5kZXYtPmtmZC0+ZGV2aWNlX2luZm8uZG9vcmJlbGxfc2l6ZSA9
PSA4KSB7DQo+Pj4gICAgICAgICAgICAgICAgICAgKmtxLT53cHRyNjRfa2VybmVsID0ga3EtPnBl
bmRpbmdfd3B0cjY0Ow0KPj4+ICsgICAgICAgICAgICAgICBtYigpOw0KPj4+ICAgICAgICAgICAg
ICAgICAgIHdyaXRlX2tlcm5lbF9kb29yYmVsbDY0KGtxLT5xdWV1ZS0+cHJvcGVydGllcy5kb29y
YmVsbF9wdHIsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
a3EtPnBlbmRpbmdfd3B0cjY0KTsNCj4+PiAgICAgICAgICAgfSBlbHNlIHsNCj4+PiAgICAgICAg
ICAgICAgICAgICAqa3EtPndwdHJfa2VybmVsID0ga3EtPnBlbmRpbmdfd3B0cjsNCj4+PiArICAg
ICAgICAgICAgICAgbWIoKTsNCj4+PiAgICAgICAgICAgICAgICAgICB3cml0ZV9rZXJuZWxfZG9v
cmJlbGwoa3EtPnF1ZXVlLT5wcm9wZXJ0aWVzLmRvb3JiZWxsX3B0ciwNCj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrcS0+cGVuZGluZ193cHRyKTsNCj4+PiAg
ICAgICAgICAgfQ0KPj4+DQo+Pj4NCj4+PiBUaGlzIG1iKCkgZG9lc24ndCByZXNvbHZlIHRoZSBw
cm9ibGVtIGR1cmluZyBjdXN0b21lcidzIHRlc3RpbmcsIEkgYWxzbyB0aG91Z2h0IG9mIE1CKCkg
Zmlyc3QgaW4gYmVnaW5uaW5nIGxpa2UgeW91IGFuZCBDaHJpc3RpYW4gLi4uDQo+Pj4gVGhlIG1i
KCkgaGVyZSBzaGFsbCByZXNvbHZlIHRoZSByZS1vcmRlcmluZyBiZXR3ZWVuIFdQVFIgYW5kIGRv
b3JiZWxsIGtpY2tpbmcgc28gR1BVIHdvbid0IGZldGNoIHN0YWxsZWQgZGF0YSBmcm9tIFdQVFIg
cG9sbGluZyBvbmNlIGl0IHJlY2VpdmVzIG5vdGlmaWNhdGlvbiBmcm9tIGRvb3JiZWxsIGtpY2tp
bmcuDQo+Pj4gKGluIFNSLUlPViB3ZSBzZXQgZG9vcmJlbGwgbW9kZSB0byBmb3JjZSBHUFUgc3Rp
bGwgZmV0Y2ggZnJvbSBXUFRSDQo+Pj4gcG9sbGluZyBhcmVhLCBkb29yYmVsbCBraWNraW5nIGlz
IGp1c3QgdG8gbm90aWZ5IEdQVSkNCj4+Pg0KPj4+IEFuZCBieSB5b3VyIHRoZW9yeTogbWIoKSBz
aGFsbCBmbHVzaCB0aGUgV0Mgc3RvcmFnZSBidWZmZXIgdG8gbWVtb3J5LCB0aHVzLCB0aGlzIG1i
KCkgc2hhbGwgYWxzbyBtYWtlIHN1cmUgdGhhdCB0aGUgcmluZyBidWZmZXIgaXMgbm90IGhvbGRp
bmcgc3RhbGxlZCBkYXRhIGFueW1vcmUsIHJpZ2h0ID8NCj4+IFRoaXMgaXMgbm90IG15IHRoZW9y
eS4gQWxsIHRoZSBxdW90ZXMgaW4gbXkgZWFybGllciBtYWlscyBhcmUgZnJvbQ0KPj4gIkludGVs
wq4gNjQgYW5kIElBLTMyIEFyY2hpdGVjdHVyZXMgU29mdHdhcmUgRGV2ZWxvcGVy4oCZcyBNYW51
YWwiLg0KPj4NCj4+IFlldCBhbm90aGVyIG9uZSAtDQo+Pg0KPj4gPHNuaXA+DQo+Pg0KPj4gV3Jp
dGVzIG1heSBiZSBkZWxheWVkIGFuZCBjb21iaW5lZCBpbiB0aGUgd3JpdGUgY29tYmluaW5nIGJ1
ZmZlciAoV0MNCj4+IGJ1ZmZlcikgdG8gcmVkdWNlIG1lbW9yeSBhY2Nlc3Nlcy4NCj4+DQo+PiAi
SWYgdGhlIFdDIGJ1ZmZlciBpcyBwYXJ0aWFsbHkgZmlsbGVkLCB0aGUgd3JpdGVzIG1heSBiZSBk
ZWxheWVkDQo+PiB1bnRpbCB0aGUgbmV4dCBvY2N1cnJlbmNlIG9mIGEgc2VyaWFsaXppbmcgZXZl
bnQ7IHN1Y2ggYXMgYW4gU0ZFTkNFDQo+PiBvciBNRkVOQ0UgaW5zdHJ1Y3Rpb24sIENQVUlEIG9y
IG90aGVyIHNlcmlhbGl6aW5nIGluc3RydWN0aW9uLCBhIHJlYWQNCj4+IG9yIHdyaXRlIHRvIHVu
Y2FjaGVkIG1lbW9yeSwgYW4gaW50ZXJydXB0IG9jY3VycmVuY2UsIG9yIGFuIGV4ZWN1dGlvbg0K
Pj4gb2YgYSBMT0NLIGluc3RydWN0aW9uIChpbmNsdWRpbmcgb25lIHdpdGggYW4gWEFDUVVJUkUg
b3IgWFJFTEVBU0UNCj4+IHByZWZpeCkuIg0KPj4NCj4+IDwvc25pcD4NCj4+DQo+Pg0KPj4+IEJ1
dCB3ZSBzdGlsbCBoaXQgaGFuZyBhbmQgZ2V0IHN0YWxsZWQgZGF0YSBmcm9tIGR1bXAuDQo+Pj4N
Cj4+PiBNYXliZSB3ZSBuZWVkIHRvIHB1dCBtYigpIGluIGFub3RoZXIgcGxhY2UgPyBjYW4geW91
IHByb3Bvc2FsIGlmIHlvdSBpbnNpc3QgdGhlIGNhY2hlIG1hcHBpbmcgaXMgbm90IGFjY2VwdGFi
bGUgdG8geW91IGFuZCB3ZSBjYW4gYXNrIGN1c3RvbWVyIHRvIHZlcmlmeSBhZ2Fpbi4NCj4+Pg0K
Pj4gVGhlcmUgYXJlIGEgY291cGxlIG9mIHRoaW5ncyB3aGljaCBhcmUgc3RpbGwgd29ya2luZyBz
dHJhbmdlbHksIHRoZXkNCj4+IHdpbGwgbmVlZCBzb21lIGV4cGxhbmF0aW9uIGFzIHdlbGwgLQ0K
Pj4NCj4+ICAgICAgICBFdmVuIHRob3VnaCB3cml0ZSBwb2ludGVyIGFsbG9jYXRpb25zIGFyZSBh
bHNvIHRvIFdDIHJlZ2lvbiwNCj4+IGFuZCBhcmUgY29ycmVjdGx5IHNlZW4gYnkgQ1AgZXZlcnkg
dGltZS4gU2luY2UgaXQgbmVlZHMgdG8gZ2V0IHdwdHINCj4+IHVwZGF0ZXMgZnJvbSBtZW1vcnkg
cmF0aGVyIHRoYW4gZG9vcmJlbGwgdmFsdWUsIGRvbid0IGtub3cgaG93IHlvdXINCj4+IHNub29w
aW5nIHRoZW9yeSB3b3JrcyBmb3IgdGhpcy4gQWxzbywgaXQgaXMgd2VpcmQgdGhhdCBXQyB3cml0
ZXMgdG8NCj4+IHRob3NlIHBhc3MgTVFEIGJ1ZmZlciB3cml0ZXMgZXZlbiB3aXRoIGZlbmNlLg0K
Pj4NCj4+ICAgICAgICBNUUQgYWxsb2NhdGlvbiBmb3IgdXNlciBxdWV1ZXMgYXJlIHN0aWxsIGZy
b20gVVNXQyBhcyBwZXIgeW91cg0KPj4gbGF0ZXN0IHBhdGNoIGFuZCB0aGV5IHN0aWxsIHdvcmsg
Y29ycmVjdGx5Lg0KPj4NCj4+IEZvciBkZWJ1ZyAtDQo+PiAgICAgICAgSXMgdGhlIFdQVFIgcmVn
IHZhbHVlIGNvcnJlY3RseSByZWZsZWN0aW5nIHRoZSBtZW1vcnkgdmFsdWU/DQo+PiBIYXZlIHlv
dSB0cmllZCBpbml0aWFsaXppbmcgTVFEIHRvIGEga25vd24gcGF0dGVybiAobWVtc2V0MzIvNjQp
IGxpa2UNCj4+IGEgc2VyaWVzIG9mIDB4Y2FmZWRlYWQgYW5kIHZlcmlmaWVkIHdoYXQgaXMgc2Vl
biBhdCB0aGUgQ1Agc2lkZT8NCj4+DQo+PiBUaGFua3MsDQo+PiBMaWpvDQo+Pg0KPj4+IFRoYW5r
cw0KPj4+DQo+Pj4gTW9uayBMaXUgfCBDbG91ZCBHUFUgJiBWaXJ0dWFsaXphdGlvbiB8IEFNRA0K
Pj4+DQo+Pj4NCj4+Pg0KPj4+DQo+Pj4NCj4+Pg0KPj4+DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4+PiBGcm9tOiBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KPj4+
IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgOCwgMjAyNCA3OjI2IFBNDQo+Pj4gVG86IExpdSwgTW9u
ayA8TW9uay5MaXVAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+Pj4gPENocmlzdGlhbi5L
b2VuaWdAYW1kLmNvbT47IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPjsNCj4+
PiBaaGFvLCBWaWN0b3IgPFZpY3Rvci5aaGFvQGFtZC5jb20+DQo+Pj4gQ2M6IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBZYW5nLCBQaGlsaXANCj4+PiA8UGhpbGlwLllhbmdAYW1kLmNv
bT47IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+PiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvMl0gZHJtL2FtZGtmZDogdXNlIGNhY2hlIEdUVCBidWZmZXIgZm9yIFBR
IGFuZA0KPj4+IHdiIHBvb2wNCj4+Pg0KPj4+DQo+Pj4NCj4+PiBPbiAxMS84LzIwMjQgNDoyOSBQ
TSwgTGl1LCBNb25rIHdyb3RlOg0KPj4+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIElu
dGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPj4+Pg0KPj4+PiBUbyBiZSBjbGVhciBmb3IgdGhl
IG1iKCkgYXBwcm9hY2g6IEV2ZW4gaWYgd2UgaW5zZXJ0IG1iKCkgaW4gcHJpb3IgdG8gYW1kZ3B1
X3Jpbmdfc2V0X3dwdHIocmluZyksIEdQVSBtaWdodCBzdGlsbCBmZXRjaCBzdGFsbGVkIGRhdGEg
ZnJvbSBQUSBkdWUgdG8gVVNXQyBhdHRyaWJ1dGVzLg0KPj4+Pg0KPj4+IEluc2VydGluZyBhbiBt
YigpIGRvZXNuJ3QgY2F1c2UgV0MgYnVmZmVyIGZsdXNoIGlzIGEgd3JvbmcgYXNzdW1wdGlvbi4N
Cj4+Pg0KPj4+IEFsbCBwcmlvciBsb2Fkcy9zdG9yZXMgYXJlIHN1cHBvc2VkIHRvIGJlIGdsb2Jh
bGx5IHZpc2libGUuIEhlbmNlIG1iKCkgZm9sbG93ZWQgYnkgYSB3cml0ZSBwb2ludGVyIHVwZGF0
ZSBhbHNvIHNob3VsZCBndWFyYW50ZWUgdGhlIHNhbWUgKEZyb20gQXJjaCBtYW51YWwpLg0KPj4+
DQo+Pj4gICAgICAgICAgIFRoZSBNRkVOQ0UgaW5zdHJ1Y3Rpb24gZXN0YWJsaXNoZXMgYSBtZW1v
cnkgZmVuY2UgZm9yIGJvdGgNCj4+PiBsb2FkcyBhbmQgc3RvcmVzLiBUaGUgcHJvY2Vzc29yIGVu
c3VyZXMgdGhhdCBubyBsb2FkIG9yIHN0b3JlIGFmdGVyDQo+Pj4gTUZFTkNFIHdpbGwgYmVjb21l
IGdsb2JhbGx5IHZpc2libGUgKnVudGlsIGFsbCBsb2FkcyBhbmQgc3RvcmVzDQo+Pj4gYmVmb3Jl
IE1GRU5DRSBhcmUgZ2xvYmFsbHkgdmlzaWJsZS4qDQo+Pj4NCj4+Pg0KPj4+IElnbm9yaW5nIHRo
ZSBhbWRncHUgZHJpdmVyIHBhcnQgb2YgaXQgLSBpZiBtYigpIGlzIG5vdCB3b3JraW5nIGFzIGV4
cGVjdGVkIGFzIHlvdSBjbGFpbSB0aGF0IG1lYW5zIHNvbWV0aGluZyBpcyB3cm9uZyB3aXRoIHRo
ZSBzeXN0ZW0uDQo+Pj4NCj4+PiBVU1dDIG9yIFdCIGZvciByaW5nIHR5cGUgbWF5IHN0aWxsIGJl
IGEgc2VwYXJhdGUgZGlzY3Vzc2lvbi4NCj4+Pg0KPj4+IFRoYW5rcywNCj4+PiBMaWpvDQo+Pj4N
Cj4+Pj4gVGhlIGlzc3VlIGhlcmUgaXMgbm90IHRoZSByZS1vcmRlcmluZyBidXQgdGhlIHN0YWxs
ZWQgUFEuDQo+Pj4+DQo+Pj4+IE1vbmsgTGl1IHwgQ2xvdWQgR1BVICYgVmlydHVhbGl6YXRpb24g
fCBBTUQNCj4+Pj4NCj4+Pj4NCj4+Pj4NCj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4+Pj4gRnJvbTogTGl1LCBNb25rDQo+Pj4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgOCwgMjAy
NCA2OjIyIFBNDQo+Pj4+IFRvOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tPjsgTGF6YXIsIExpam8NCj4+Pj4gPExpam8uTGF6YXJAYW1kLmNvbT47IEFsZXggRGV1
Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPjsgWmhhbywNCj4+Pj4gVmljdG9yIDxWaWN0b3Iu
Wmhhb0BhbWQuY29tPg0KPj4+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFlh
bmcsIFBoaWxpcA0KPj4+PiA8UGhpbGlwLllhbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeCA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+Pj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzJdIGRy
bS9hbWRrZmQ6IHVzZSBjYWNoZSBHVFQgYnVmZmVyIGZvciBQUQ0KPj4+PiBhbmQgd2IgcG9vbA0K
Pj4+Pg0KPj4+PiBDaHJpc3RpYW4vTGlqbw0KPj4+Pg0KPj4+PiBXZSB2ZXJpZmllZCBhbGwgYXBw
cm9hY2hlcywgYW5kIHdlIGtub3cgd2hhdCB3b3JrcyBhbmQgbm90IHdvcmtzLCBvYnZpb3VzbHkg
dGhlIG1iKCkgZG9lc24ndCB3b3JrLg0KPj4+Pg0KPj4+PiBUaGUgd2F5IG9mIG1iKCkgYmV0d2Vl
biBzZXQgd3B0cl9wb2xsaW5nIGFuZCBraWNraW5nIG9mZiBkb29yYmVsbCBpcyB0aGVvcmV0aWNh
bGx5IGNvcnJlY3QsIGFuZCBJJ20gbm90IG9iamVjdCB0byBkbyBzby4uLiBidXQgdGhpcyB3b24n
dCByZXNvbHZlIHRoZSBpc3N1ZSB3ZSBoaXQuDQo+Pj4+IEZpcnN0IG9mIGFsbCwgVVNXQyB3aWxs
IGhhdmUgc29tZSBjaGFuY2UgdGhhdCB0aGUgZGF0YSBpcyBzdGlsbCBpbiBDUFUncyBXQyBzdG9y
YWdlIHBsYWNlIGFuZCBub3QgZmx1c2hlZCB0byB0aGUgbWVtb3J5IGFuZCBldmVuIHdpdGggTUIo
KSBnZXQgcmlkIG9mIHJlLW9yZGVyaW5nIEdQVSBtaWdodCBzdGlsbCBoYXZlIGEgY2hhbmNlIHRv
IHJlYWQgc3RhbGxlZCBkYXRhIGZyb20gcmluZyBidWZmZXIgYXMgbG9uZyBhcyBpdCBpcyBtYXBw
ZWQgVVNXQy4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyB3aHkgb25seSBjYWNoZSBwbHVzIHNub29wIG1l
bW9yeSBjYW4gZ2V0IHJpZCBvZiBpbmNvbnNpc3RlbmNlIGlzc3Vlcy4NCj4+Pj4NCj4+Pj4gQmVz
aWRlcywgZG8geW91IGtub3cgd2hhdCdzIHRoZSByYXRpb25hbCB0byBrZWVwIGFsbCBHRlggS0NR
IGNhY2hlK3Nub29wIGJ1dCBvbmx5IEhJUS9LSVEgZnJvbSBLRkQgY29uZmlndXJlZCB0byBVU1dD
ID8NCj4+Pj4NCj4+Pj4gRm9yIHBlcmZvcm1hbmNlIGNvbmNlcm4gdGhhdCBsb29rcyB0byBtZSBh
bHdheXMgdGhlIHNlY29uZCBwcmlvcml0eSBjb21wYXJlZCB0byAiY29ycmVjdCIgZXNwZWNpYWxs
eSB1bmRlciB0aGUgY2FzZSBISVEgY29udHJpYnV0ZXMgdmVyeSBsaXR0bGUgdG8gUk9DTSBwZXJm
b3JtYW5jZSB3aGVuIHN3aXRjaGluZyB0byBjYWNoZSBtYXBwaW5nLg0KPj4+Pg0KPj4+Pg0KPj4+
PiBNb25rIExpdSB8IENsb3VkIEdQVSAmIFZpcnR1YWxpemF0aW9uIHwgQU1EDQo+Pj4+DQo+Pj4+
DQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+Pj4+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFt
ZC5jb20+DQo+Pj4+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciA3LCAyMDI0IDc6NTcgUE0NCj4+
Pj4gVG86IExhemFyLCBMaWpvIDxMaWpvLkxhemFyQGFtZC5jb20+OyBBbGV4IERldWNoZXINCj4+
Pj4gPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT47IFpoYW8sIFZpY3RvciA8VmljdG9yLlpoYW9AYW1k
LmNvbT4NCj4+Pj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBMaXUsIE1vbmsg
PE1vbmsuTGl1QGFtZC5jb20+Ow0KPj4+PiBZYW5nLCBQaGlsaXAgPFBoaWxpcC5ZYW5nQGFtZC5j
b20+OyBLdWVobGluZywgRmVsaXgNCj4+Pj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+Pj4+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkcm0vYW1ka2ZkOiB1c2UgY2FjaGUgR1RUIGJ1ZmZl
ciBmb3IgUFENCj4+Pj4gYW5kIHdiIHBvb2wNCj4+Pj4NCj4+Pj4gQW0gMDcuMTEuMjQgdW0gMDY6
NTggc2NocmllYiBMYXphciwgTGlqbzoNCj4+Pj4+IE9uIDExLzYvMjAyNCA4OjQyIFBNLCBBbGV4
IERldWNoZXIgd3JvdGU6DQo+Pj4+Pj4gT24gV2VkLCBOb3YgNiwgMjAyNCBhdCAxOjQ54oCvQU0g
VmljdG9yIFpoYW8gPFZpY3Rvci5aaGFvQGFtZC5jb20+IHdyb3RlOg0KPj4+Pj4+PiBGcm9tOiBN
b25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQXMgY2FjaGUgR1RU
IGJ1ZmZlciBpcyBzbm9vcGVkLCB0aGlzIHdheSB0aGUgY29oZXJlbmNlIGJldHdlZW4NCj4+Pj4+
Pj4gQ1BVIHdyaXRlIGFuZCBHUFUgZmV0Y2ggaXMgZ3VhcmFudGVlZCwgYnV0IG9yaWdpbmFsIGNv
ZGUgdXNlcyBXQw0KPj4+Pj4+PiArIHVuc25vb3BlZCBmb3IgSElRIFBRKHJpbmcgYnVmZmVyKSB3
aGljaCBpbnRyb2R1Y2VzIGNvaGVyZW5jeSBpc3N1ZXM6DQo+Pj4+Pj4+IE1FQyBmZXRjaGVzIGEg
c3RhbGwgZGF0YSBmcm9tIFBRIGFuZCBsZWFkcyB0byBNRUMgaGFuZy4NCj4+Pj4+PiBDYW4geW91
IGVsYWJvcmF0ZSBvbiB0aGlzPyAgSSBjYW4gc2VlIENQVSByZWFkcyBiZWluZyBzbG93ZXINCj4+
Pj4+PiBiZWNhdXNlIHRoZSBtZW1vcnkgaXMgdW5jYWNoZWQsIGJ1dCB0aGUgcmluZyBidWZmZXIg
aXMgbW9zdGx5IHdyaXRlcyBhbnl3YXkuDQo+Pj4+Pj4gSUlSQywgdGhlIGRyaXZlciB1c2VzIFVT
V0MgZm9yIG1vc3QgaWYgbm90IGFsbCBvZiB0aGUgb3RoZXIgcmluZw0KPj4+Pj4+IGJ1ZmZlcnMg
bWFuYWdlZCBieSB0aGUga2VybmVsLiAgV2h5IGFyZW4ndCB0aG9zZSBhIHByb2JsZW0/DQo+Pj4+
PiBXZSBoYXZlIHRoaXMgb24gb3RoZXIgcmluZ3MgLQ0KPj4+Pj4gICAgICAgICAgICBtYigpOw0K
Pj4+Pj4gICAgICAgICAgICBhbWRncHVfcmluZ19zZXRfd3B0cihyaW5nKTsNCj4+Pj4+DQo+Pj4+
PiBJIHRoaW5rIHRoZSBzb2x1dGlvbiBzaG91bGQgYmUgdG8gdXNlIGJhcnJpZXIgYmVmb3JlIHdy
aXRlIHBvaW50ZXINCj4+Pj4+IHVwZGF0ZXMgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBQQ0llIHNu
b29waW5nLg0KPj4+PiBZZWFoLCBjb21wbGV0ZWx5IGFncmVlIGFzIHdlbGwuIFRoZSBiYXJyaWVy
IGFsc28gdGFrZXMgY2FyZSBvZiBwcmV2ZW50aW5nIHRoZSBjb21waWxlciBmcm9tIHJlLW9yZGVy
aW5nIHdyaXRlcy4NCj4+Pj4NCj4+Pj4gUmVnYXJkcywNCj4+Pj4gQ2hyaXN0aWFuLg0KPj4+Pg0K
Pj4+Pj4gVGhhbmtzLA0KPj4+Pj4gTGlqbw0KPj4+Pj4NCj4+Pj4+PiBBbGV4DQo+Pj4+Pj4NCj4+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1vbmsuTGl1QGFtZC5jb20+DQo+Pj4+Pj4+
IC0tLQ0KPj4+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5j
IHwgMiArLQ0KPj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4+Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMNCj4+Pj4+Pj4gaW5kZXggMWYxZDc5YWM1ZTZjLi5mYjA4N2EwZmY1
YmMgMTAwNjQ0DQo+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYw0KPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMNCj4+Pj4+Pj4gQEAgLTc3OSw3ICs3NzksNyBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2lu
aXQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCj4+Pj4+Pj4gICAgICAgICAgICBpZiAoYW1kZ3B1X2Ft
ZGtmZF9hbGxvY19ndHRfbWVtKA0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBr
ZmQtPmFkZXYsIHNpemUsICZrZmQtPmd0dF9tZW0sDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZrZmQtPmd0dF9zdGFydF9ncHVfYWRkciwgJmtmZC0+Z3R0X3N0YXJ0X2NwdV9w
dHIsDQo+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGZhbHNlLCB0cnVlKSkgew0KPj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICBmYWxzZSwgZmFsc2UpKSB7DQo+Pj4+Pj4+ICAg
ICAgICAgICAgICAgICAgICBkZXZfZXJyKGtmZF9kZXZpY2UsICJDb3VsZCBub3QgYWxsb2NhdGUg
JWQgYnl0ZXNcbiIsIHNpemUpOw0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgZ290byBhbGxv
Y19ndHRfbWVtX2ZhaWx1cmU7DQo+Pj4+Pj4+ICAgICAgICAgICAgfQ0KPj4+Pj4+PiAtLQ0KPj4+
Pj4+PiAyLjM0LjENCj4+Pj4+Pj4NCg0K
