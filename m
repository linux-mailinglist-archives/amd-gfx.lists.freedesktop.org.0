Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6075952B31
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2024 11:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80910E0CE;
	Thu, 15 Aug 2024 09:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QuKjZRmD";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E73F10E0CE
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2024 09:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfr94I2hl8onjo1hnXfpGje86VVJqa9q6CL0FUALggSmVUOEV1+bBIK7UTK9YK4sTkCUrGgCsaoDAXBYrzK6hVjW/F4CqOKnqYJV/iZ6qq/Y94Y42mcLH9fDIhO4FiYGvEuKf5nJ34sK6mgC5Rx5WuGuGtN6snqXFgItT1zrXsYEkxk97xl8TOmT+mauesep3xyEGihpEzVSVSgCrVc6O7L2qd4aVkR+9n0oNwLF2pgqV+tqe8Odf78GLRLFgV9o148SJ6ZnA4miZJ/Ki8vVR0qRUrv3R6YeBtKRK5gL4AAKU5WPFfO8fcV8RO1mgZxHqCp2TNYYPBuqvnI3zfsLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXHnT/DBbGmzIgddj/+Tjj2aiucJguA6NzFRt9Rj9CU=;
 b=skuyK598ye/yM+MyCw5yLWrmu2okln0h74FgJ/t9RTqiC31TtOIKY6rpImK4ca7+3ym1LpjZvrk0TIzOgoDSOM1aY8j15ydxQo+yMQoalTQjy7woyWArlkD1V96F5kgDdNe3f+Kb5Wla7EM4BdIHKXnp85npoQ3ckGJh0Lgv0wGUKxpC79ioNs4uuzVdiS2W4Fa2YmMUHAY8O95jgstPuI7w8zPtGAQ3/rZDqjdWqdH7ONR5IgxrE416q5FfYIMxojS6NL1yN0Qo47h40TVGNuNESuUsKyhM52hmj4Y1dTYeOx+BzsCRRMveMswIIhXjjSz+OKcgQhsmLL1ePmkyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXHnT/DBbGmzIgddj/+Tjj2aiucJguA6NzFRt9Rj9CU=;
 b=QuKjZRmDegKpu8+c1OgqfOdfX6yvRAJgH+0lIzndd6KgE9XDY3o9lJBCBUN1mROH852C0KtVWUYCJFS5L+uQZTEO81LyHgy7o2NP96gOLfrtKTAjTB9L44ul+tWdMHDpd2r2BkEwfjhX3Sf36zAuXjI59Gh/xnVRA5+FwxZHGrI=
Received: from CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 09:30:46 +0000
Received: from CY5PR12MB6369.namprd12.prod.outlook.com
 ([fe80::d4c1:1fcc:3bff:eea6]) by CY5PR12MB6369.namprd12.prod.outlook.com
 ([fe80::d4c1:1fcc:3bff:eea6%4]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 09:30:46 +0000
From: "Zhang, Yifan" <Yifan1.Zhang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Christopher Snowhill
 <chris@kode54.net>
CC: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Yang,
 Philip" <Philip.Yang@amd.com>
Subject: RE: [PATCH] drm/amdkfd: keep create queue success if cwsr save area
 doesn't match
Thread-Topic: [PATCH] drm/amdkfd: keep create queue success if cwsr save area
 doesn't match
Thread-Index: AQHa6W881OX1vpnp0U6vbxJOQG6+0LIdcF4AgADz69CAATLeAIADSLpwgAMmhICAAAJQgIAARk9ggACPygCAATl8gA==
Date: Thu, 15 Aug 2024 09:30:45 +0000
Message-ID: <CY5PR12MB636972B14FCF4768DDB03E7DC1802@CY5PR12MB6369.namprd12.prod.outlook.com>
References: <7e40e8c2-d6a7-4e10-b71c-c4f869e825ab@amd.com>
 <E3D1CFD8-93E9-4B38-BC02-7432B94432E8@kode54.net>
 <CY5PR12MB6369351BE6C7835F591DBCD2C1872@CY5PR12MB6369.namprd12.prod.outlook.com>
 <0ed6e47f-4b68-4da9-bc9b-1d2e47d1511f@amd.com>
In-Reply-To: <0ed6e47f-4b68-4da9-bc9b-1d2e47d1511f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ecc1effa-9539-4645-940f-609d11600bca;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-15T09:29:08Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6369:EE_|CY5PR12MB6204:EE_
x-ms-office365-filtering-correlation-id: ac3021c4-85e8-4b9f-1627-08dcbd0cf109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cmVsMzF4Uks0MHlkQit3a0J0Z2VLdTlyY3NpcDhPRkJsM3VISkFaQTc1OUJ3?=
 =?utf-8?B?RkVmRU91RlVVREpGT0k2dDUwcVlzSGxoRGhQTG43R3VBbUd6and4aVl3OWNV?=
 =?utf-8?B?eWRwRlEzeVJubkhVTHRGKytEM2wyekxnMjRyQ09ieExGbGJaYkFkNDB1dko5?=
 =?utf-8?B?dC9nN2pyeDJjWkhQdmRsQnJiZEI5b0h0MFprenVRcmFiUExCQ0crU2s1ZEF3?=
 =?utf-8?B?MG8xendzemlkS0htNFdoTndWMVplQ3ZoVTVsMndqQ0hzbyt3aG9LUnRVK2Ew?=
 =?utf-8?B?V3ZiK1ZPbkwwdEFGcTh2ZGVhMDFKM0x0WFloQ0xLUkFDS1NIdkwzUlBZeEVw?=
 =?utf-8?B?V211R2EvWjVoK0xvK1BsUmdCMTYxUGd2bjR2dG5scERIQUpxbjFrNDVYWkgz?=
 =?utf-8?B?QnN2Z0RFcTk0amN3c09rRVFvNjcwdFV5TVBzQUhvalU2QS9hNXlOQ2I3bVla?=
 =?utf-8?B?QjA4ZW9NVVM4cHhVRUtlUWFyaElNU2tlZ3gvTmpnWDRkSHVaMFJHcjQ0dHVu?=
 =?utf-8?B?aWhuZkg5RDVSYW44L05ZWnEvTy9xSmN0TmREK09Cc3Y0bnJubzFUMWZKMVlO?=
 =?utf-8?B?WktDcmt3TjB1dWxxLzc2OHFYZlNlNmJXeHVKTkt6d29BU1MxVHJLdFA0Q0tj?=
 =?utf-8?B?TFViS1VHa2REK201dDIxVGF1RHRRU0lmSzc5S0NPcUZMcUJycXZBVlRhcXJN?=
 =?utf-8?B?RG9HbG5IVDZ4blJ1ZnprSWtDQm9MeW1RaXdmMW9lTmhKSHJjeDB0SU04bXN3?=
 =?utf-8?B?amcvOWlrQ214Um1zTEk2SXJwWFc3b0NUVXhBK3BTN1V3Uk1PVWhNelltSEJr?=
 =?utf-8?B?ekVXbUx1Wmg0VnJFQ0hWdktZZUlLQ2dBZFNkdmRhaHBGV2NuVFV3cG1zMG55?=
 =?utf-8?B?cWplbmg1R2VTb1kybWR5OXdMSU9qeHU4bXc5V0pjaWlCK0NMWVVyZ2pWTFNC?=
 =?utf-8?B?T1VCajdzY0xGSXkrU1RQY293TzNFZUJWdGptaHJES3c4UjJMR2dsK2hFQ0R2?=
 =?utf-8?B?T0dNbWxaN1F4YXh5b1lKWUdFRmhvcnM1eDdoK2kxZm4yMldGUzJTemx3NFRm?=
 =?utf-8?B?dXA2ek81Q2hVcm44WldUdkJvRmNOcWMxNWFMZWE1ZmxmbWRKdHhqQVZzTER6?=
 =?utf-8?B?WW1aQitYZloyV0x3aE1sbUJuWURiQ01EN3JNcWozVXZqSUpEbUt1T3VuTWkr?=
 =?utf-8?B?ZUs3VGZkS00rTnp5NEZ6NUQ0VmtNZEhKUllvTFhIWUhYSHFQZmhuOW1DNlRn?=
 =?utf-8?B?SEFsT3RlN2tSRXNtbnhrWEo0Ym9QL3hzVk1UYzR3UzdEUGpkZXJIVnBwYU5H?=
 =?utf-8?B?L3BYamtIc0NsZ3lramdCbEg1cVVKbjZGT2NZNSs0ZUVnL1UwSjE5NWUzbmxi?=
 =?utf-8?B?ZlVQWlVsODMxQW5BVWVRWmhuaGRZdy8wQ25WVmtDL3JxWHZyUXhqOVE3VU1M?=
 =?utf-8?B?YzE1S0RsRTVaQTIyTVRTNkx4N0pDRmZ5ck9EdlpCY0hCbGc1Q3NYNnRUUldU?=
 =?utf-8?B?aWdBQ0NWOWRzTmNBMUNDdWlvV1BnUmRUOGt6MWJqeFJrVlpFdFVtbDJhMWRE?=
 =?utf-8?B?SDVsdVRuOWJUYlJkalF1UC9HdGFUcUg5VkVyOUw3Q25nTGd0ejYrcXZRaEY3?=
 =?utf-8?B?RUZIU0tkcWhGT3Q0NDRManhTYTE1M2pGSDl5MHN0WU9oZlpaOEdyQ2VCMTF2?=
 =?utf-8?B?ZEp1dCt6a2FvSHo3aGJSVngrRDdVR1dTVllJS2ZDQUtJMlZsM1QvMkhZVWZ1?=
 =?utf-8?B?WmlaWVlLWXA1Z0tzS1pXMzZoSzBuWjZVd0FXNFVWSG9JNVRlNlV5aTQzQXhL?=
 =?utf-8?Q?KUEJvkhjLqe3r4d7bpwLCTutlwSfNASnBfX28=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6369.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGRqaGM3T2E1cUdMY0tnUng5VmNrSVNIZmNxNklVS0RXR053amwrZHUwOWQ2?=
 =?utf-8?B?aVhJQUZoT09FS3Z5RkxnNUFIMDFzOXlnZUNPWXgxUDVxaElBY2xFRXVNMlR1?=
 =?utf-8?B?dVBBRkhYVWZlMDZjSnhBMWxGZDBtVDJ4bzU4SnRQeS9xcUNPOGFib3ZLbGtJ?=
 =?utf-8?B?M202b2E4RGVYb1JBdm5UbkdJN09LMWMzUjliWDRZenZZY2JKUTJwOGUyenhY?=
 =?utf-8?B?U0pvK0pGbDE2VnR2QXRjZHIwZjVLRjNjWGZqQmtLZ2JKd0hrVG5ZQUhod0ZY?=
 =?utf-8?B?eTdCMnd5dnpWNTRTWWc4aHBhdGZjL3V5cjdnRDZVMnppTlFaSzdGUG1SMDdk?=
 =?utf-8?B?alNVNUczQmRpMlF1NXh6djFCS3M1MjBweDljbDQ5bEJvYy9saVBZdFRYWjNm?=
 =?utf-8?B?OHRIZjVJWk93MTJkRExDZ1F2WG5NMGRaalNRanlxT1NkKytFVmMwdzBIOVVk?=
 =?utf-8?B?bk5NWmtMeXFiRkthak9wTzVxNHpBaTRSUkxKNDJvUmFCNm9pZDRGWkxCZ2Np?=
 =?utf-8?B?ZDh5c0h6OTNCeXhvd3lFZmpLMWd6UzNQL0tWU3cxUDNnMm9CaWNremFYbHht?=
 =?utf-8?B?S0gybCtGQi9yUERLbHUzWCtrOUxRdUt2Z1VGNXVQQU5NU2FIV0xQdTRNanUv?=
 =?utf-8?B?cVZSUW5IVkl4alNrbDJzV1Erdy9lMDFoRzNDejB1dTc2NFFJQ0IzWlliRnVZ?=
 =?utf-8?B?NFA2Y1lZUCtDM2preTkzUEpTbUtpdTlKUU1XejFhVjNlODNMY1F2RTZGcUN3?=
 =?utf-8?B?QWMvUSt3cSt5aklxUVBydFA0bGQ5b2lMMmhWcmNQK3Rpa0gxV2dISndSV3V6?=
 =?utf-8?B?NFFQK1d3VXJoUXk1ZDh2YWRTMVNWRHpCV2xtc2twQ3orUy9JQVBQb295blJi?=
 =?utf-8?B?Ulk5aEpyaUNySGFTY25vZjl1WW1iZ2pwUkM1Sm5JOGdjWGdBK1psREo1RGIr?=
 =?utf-8?B?UzREUFRKck1wU29jeElzYUwxNnplcmxCNkVoR0FnN0Z3Y0FjV0pXWXg2eWJk?=
 =?utf-8?B?NExNOHkva3hSR0V5UE00Q2UyTUMrbFJxdEtadTFPNjdtTkd1S0hVOEZ6ZXRh?=
 =?utf-8?B?M2E3aUNheVE3em5mYXNkdVhpd0wyd3FvZHZ2YmVUVUd4V2x6eFplVTFHU0l6?=
 =?utf-8?B?SUFxazRFaDJnZ3BYSFRweWQzK1JYRTZmd0dUSS80ZEduNU43MENaVTltZzhG?=
 =?utf-8?B?cERkcXRHQmJ6eFVxNVkzQkhlUzBjaldzYVRQNFRDZVdEY1ZleG9VT0dvZnNK?=
 =?utf-8?B?YUNrWUtlZ29wTUp5WVZLVUVTU2FFVkJTbTNUc1dueCt0SlhhY053QXpFOTd5?=
 =?utf-8?B?cjJhZFdabnNNOGl6YUowS01KbXh3Uzd2dDJYODFrQ1o0eDI0N2NmOXNLWk52?=
 =?utf-8?B?U3VFNkVKSmZkU28rMlNlSlVGNlhqeVB6VG92Z0tpSUxOY05PRlpQNVgrR0JQ?=
 =?utf-8?B?b2ZzaGNrYW02SkNQSzU4RXFWc2VVUkM5c0FteUZmR1ovOHU5QmswMmU4ZHB6?=
 =?utf-8?B?ZEFiYUVTMEpjY1dLL1BONDZ0aTA2YXJQditUNmhpb21jOG16YkZ0SEFCTkNW?=
 =?utf-8?B?azFPUjVuM20xOW10TFdqU29nejV2NzR2enVLcmZkRnU5OHZOK2ZZU0ZnQVVa?=
 =?utf-8?B?YmFtUlJtckljankrWlVTbUNVRmFVVEUxUUJhdHpSV0ozTnJpSzhTd1ZQQXBC?=
 =?utf-8?B?WG9SbGtEVWsxbWYyaWMyL0tmQVUzZ1hlUlpoL2lGZUE1TEFuQ1AwVVJyNWZH?=
 =?utf-8?B?NWdaK0ROVDJPaVo1d1RoMFBMWWQ4Rk5qdVFnZ2xSWEtXVFhMRVpML3JBSE0v?=
 =?utf-8?B?OTBSZUcwWGdFZDNTSm9pOEVzOFk5cnpsdG1XL1llUUpBY2dDdzZFOG5ISVFY?=
 =?utf-8?B?K3ZWMmVGOXdqZGlTbUhJODJDZm5UT0s0eGs5VmJYdU1ObTdzbDNxK3U4eU1l?=
 =?utf-8?B?RUQySjBzYWJrVm93MTV5SUk1NjlzYjhDNGtSQ0tWYU80elFncE1ydk1JSG10?=
 =?utf-8?B?cjRCTGJlY21sc1ptd09SalpYUXhJcCtHdExFSDQrWWVFb1haWWVEMkdxQ0dT?=
 =?utf-8?B?cnlnc2QydnYzNlhZTkZUQmV4SWpIQlNxdXNIaVBpV3hKMGxhbzJZNjM3bm93?=
 =?utf-8?Q?zf8Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6369.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3021c4-85e8-4b9f-1627-08dcbd0cf109
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 09:30:46.0346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebdOnicLcKrYUmc3pM9xe0cWtuW7d+qG/vxB84n1+Nt5ZdDzGr+7nDcwQzox+8Je
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
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
Cg0KR290IGl0LiBXaWxsIGFkZHJlc3MgdGhpcyBpc3N1ZSBpbiBST0NyLg0KDQpCZXN0IFJlZ2Fy
ZHMsDQpZaWZhbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3VlaGxpbmcs
IEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KU2VudDogV2VkbmVzZGF5LCBBdWd1c3Qg
MTQsIDIwMjQgMTA6NDcgUE0NClRvOiBaaGFuZywgWWlmYW4gPFlpZmFuMS5aaGFuZ0BhbWQuY29t
PjsgQ2hyaXN0b3BoZXIgU25vd2hpbGwgPGNocmlzQGtvZGU1NC5uZXQ+DQpDYzogS2FzaXZpc3dh
bmF0aGFuLCBIYXJpc2ggPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNvbT47IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBZYW5nLCBQaGlsaXAgPFBoaWxpcC5ZYW5nQGFtZC5jb20+
DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1ka2ZkOiBrZWVwIGNyZWF0ZSBxdWV1ZSBzdWNj
ZXNzIGlmIGN3c3Igc2F2ZSBhcmVhIGRvZXNuJ3QgbWF0Y2gNCg0KDQoNCk9uIDIwMjQtMDgtMTQg
MjozNSwgWmhhbmcsIFlpZmFuIHdyb3RlOg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1E
IEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPg0KPiBBRkFJSywgZm9yIGxvdyBsZXZlbCBs
aWJyYXJpZXMsIGUuZy4gTExWTSwgUk9DciwgSGlwL09wZW5DTCBydW50aW1lcywgYWxsIEdQVXMg
YXJlIHN1cHBvcnRlZC4gQnV0IGZvciB0aGUgbWF0aGxpYnMgYW5kIGZyYW1ld29ya3MsIG9ubHkg
bGltaXRlZCBHUFVzIGFyZSBzdXBwb3J0ZWQuIEUuZy4gOg0KPg0KPiBodHRwczovL2dpdGh1Yi5j
b20vUk9DbS9yb2NCTEFTL2Jsb2IvMjg4NzdlNWUxMzRhMTU3YjdlYTU2Yjg4YTFhMTJiYTU1DQo+
IDFkNTNjYmYvQ01ha2VMaXN0cy50eHQjTDExMQ0KPg0KPiBzZXQoIFRBUkdFVF9MSVNUX1JPQ01f
Ni4zDQo+ICJnZng5MDA7Z2Z4OTA2OnhuYWNrLTtnZng5MDg6eG5hY2stO2dmeDkwYTtnZng5NDA7
Z2Z4OTQxO2dmeDk0MjtnZngxMDENCj4gMDtnZngxMDEyO2dmeDEwMzA7Z2Z4MTEwMDtnZngxMTAx
O2dmeDExMDI7Z2Z4MTIwMDtnZngxMjAxIikNCj4NCj4gT24gdGhlIHVuc3VwcG9ydGVkIEdQVXMs
IEhTQV9PVkVSUklERV9HRlhfVkVSU0lPTiBjdXJyZW50bHkgd29ya3MgYXMgYSB3b3JrYXJvdW5k
Lg0KDQpUaGVuIEhTQV9PVkVSUklERV9HRlhfVkVSU0lPTiBwcm9iYWJseSBkb2VzIG1vcmUgdGhh
biB3ZSBuZWVkIGl0IHRvIGZvciB3b3JraW5nIGFyb3VuZCBzdXBwb3J0IGluIHRoZSBtYXRoIGxp
YnMuIFdoYXQgbWF0aCBsaWJzIGNhcmUgYWJvdXQgaXMgbWFpbmx5IHRoZSBJU0EgdGFyZ2V0IHZl
cnNpb24uIFRoZXJlIHNob3VsZCBiZSBubyBuZWVkIHRvIGFsbG9jYXRlIGRpZmZlcmVudCBzaXpl
cyBmb3IgQ1dTUiBhcmVhcy4NCg0KUmVnYXJkcywNCiAgRmVsaXgNCg0KDQo+DQo+DQo+IEJlc3Qg
UmVnYXJkcywNCj4gWWlmYW4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogQ2hyaXN0b3BoZXIgU25vd2hpbGwgPGNocmlzQGtvZGU1NC5uZXQ+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgQXVndXN0IDE0LCAyMDI0IDEwOjAxIEFNDQo+IFRvOiBLdWVobGluZywgRmVsaXggPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IENjOiBaaGFuZywgWWlmYW4gPFlpZmFuMS5aaGFuZ0Bh
bWQuY29tPjsgS2FzaXZpc3dhbmF0aGFuLCBIYXJpc2gNCj4gPEhhcmlzaC5LYXNpdmlzd2FuYXRo
YW5AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBZYW5nLA0KPiBQaGls
aXAgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRr
ZmQ6IGtlZXAgY3JlYXRlIHF1ZXVlIHN1Y2Nlc3MgaWYgY3dzcg0KPiBzYXZlIGFyZWEgZG9lc24n
dCBtYXRjaA0KPg0KPg0KPg0KPj4gT24gQXVnIDEzLCAyMDI0LCBhdCA2OjUy4oCvUE0sIEZlbGl4
IEt1ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0BhbWQuY29tPiB3cm90ZToNCj4+DQo+PiDvu79IYW5n
IG9uIGEgc2Vjb25kLiBJZiB0aGVyZSBhcmUgcHJvZHVjdGlvbiBHUFVzIHRoYXQgb25seSB3b3Jr
IHdpdGggSFNBX09WRVJSSURFX0dGWF9WRVJTSU9OIHJpZ2h0IG5vdywgdGhlbiB3ZSBzaG91bGQg
bWFrZSB0aG9zZSBHUFVzIHByb3Blcmx5IHN1cHBvcnRlZC4gSSB0aG91Z2h0IHRoaXMgd2FzIG9u
bHkgdXNlZCBpbnRlcm5hbGx5IGZvciBicmluZy11cCBvciBtYXliZSBleHRlcm5hbGx5IGFzIGEg
c2hvcnQtdGVybSBzb2x1dGlvbiBiZWZvcmUgd2UgdXBzdHJlYW0gcHJvcGVyIHN1cHBvcnQgZm9y
IG5ldyBHUFVzLg0KPg0KPiBGb3IgaW5zdGFuY2UsIGZvciBhIGJ1bmNoIG9mIGNvbXB1dGUgdGhp
bmdzLCBJIGhhdmUgdG8gb3ZlcnJpZGUgMTAuMy4wIGZvciBteSAxMC4zLjEgR1BVLCBhIDY3MDAg
WFQsIGJlY2F1c2Ugbm9ib2R5IGJ1aWxkcyBvciBwYWNrYWdlcyB0aGUga2VybmVscyBmb3IgMTAu
My4xLg0KPg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiAgRmVsaXgNCj4+DQo+Pg0KPj4+IE9uIDIwMjQt
MDgtMTEgMjI6MTAsIFpoYW5nLCBZaWZhbiB3cm90ZToNCj4+PiBbQU1EIE9mZmljaWFsIFVzZSBP
bmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPj4+DQo+Pj4gSSBhZ3JlZSB0
aGF0IGFkZGluZyBleHBfaHdfc3VwcG9ydCBpcyBhIHNhZmVyIGFwcHJvYWNoLiBNeSBjb25jZXJu
IGlzIHRoYXQgSFNBX09WRVJSSURFX0dGWF9WRVJTSU9OIGhhcyBiZWVuIHVzZWQgZm9yIGEgd2hp
bGUgYW5kIGhhcyBiZWNvbWUgYSBzdGF0dXMgcXVvIGZvciBydW5uaW5nIFJPQ20gb24gdW5zdXBw
b3J0ZWQgQVBVcy4gSSdtIG5vdCBzdXJlIGlmIHRoaXMgYXBwcm9hY2ggd2lsbCBiZSBhIGJ1cmRl
biBmb3IgQVBVIGVuZCB1c2Vycy4gQWRkaW5nIGRyaXZlciBsb2FkIHBhcmFtZXRlcnMgaXMgbW9y
ZSBjb21wbGljYXRlZCB0aGFuIHNpbXBseSBhZGRpbmcgYW4gZW52aXJvbm1lbnQgdmFyaWFibGUg
b24gY29uc3VtZXIgUENzLg0KPj4+DQo+Pj4gQmVzdCBSZWdhcmRzLA0KPj4+IFlpZmFuDQo+Pj4N
Cj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IEt1ZWhsaW5nLCBGZWxp
eCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4+PiBTZW50OiBTYXR1cmRheSwgQXVndXN0IDEw
LCAyMDI0IDc6MzcgQU0NCj4+PiBUbzogWmhhbmcsIFlpZmFuIDxZaWZhbjEuWmhhbmdAYW1kLmNv
bT47IEthc2l2aXN3YW5hdGhhbiwgSGFyaXNoDQo+Pj4gPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5A
YW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gQ2M6IFlhbmcsIFBo
aWxpcCA8UGhpbGlwLllhbmdAYW1kLmNvbT4NCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0v
YW1ka2ZkOiBrZWVwIGNyZWF0ZSBxdWV1ZSBzdWNjZXNzIGlmIGN3c3INCj4+PiBzYXZlIGFyZWEg
ZG9lc24ndCBtYXRjaA0KPj4+DQo+Pj4gTWF5YmUgd2UgY2FuIHR1cm4gdGhpcyBjaGVjayBpbnRv
IGEgd2FybmluZ3MgaWYsIGFuZCBvbmx5IGlmIHRoZSBleHBfaHdfc3VwcG9ydCBtb2R1bGUgcGFy
YW0gaXMgc2V0LiBUaGF0IHdheSB3ZSBkb24ndCB3YXRlciBkb3duIHRoZSBjaGVja3Mgb24gdGhl
IHByb2R1Y3Rpb24gY29kZSBwYXRoIGJ1dCBhbGxvdyBleHBlcmltZW50YWwgc2V0dXBzIHRvIHJ1
biB3aXRob3V0IGEgc2VhdCBiZWx0Lg0KPj4+DQo+Pj4gUmVnYXJkcywNCj4+PiAgIEZlbGl4DQo+
Pj4NCj4+Pg0KPj4+PiBPbiAyMDI0LTA4LTA5IDAxOjM5LCBaaGFuZywgWWlmYW4gd3JvdGU6DQo+
Pj4+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9u
bHldDQo+Pj4+DQo+Pj4+IFllcywgSSB0aGluayB3ZSBuZWVkIHRoYXQgY2hhbmdlIGZvciBhIG5v
cm1hbCBjb2RlIHBhdGgsIGJ1dCB0aGlzIGNhc2UgaXMgaW50cm9kdWNlZCBvbmx5IHdpdGggdGhl
IEhTQV9PVkVSUklERV9HRlhfVkVSU0lPTiBlbnZpcm9ubWVudCBzZXR0aW5nLCB3aGljaCBpbXBs
aWVzIHRoYXQgInRoZSBvdmVycmlkZSBBU0lDIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgcmVhbCBB
U0lDLiIgSXQgaXMgaW50ZW5kZWQgZm9yIGV4cGVyaW1lbnRhbCBwdXJwb3Nlcy4gV2hlbiBhIHVz
ZXIgaXMgdXNpbmcgSFNBX09WRVJSSURFX0dGWF9WRVJTSU9OLCB0aGV5IHNob3VsZCBiZSBhd2Fy
ZSBvZiB0aGUgcG90ZW50aWFsIHJpc2tzIGl0IG1heSBicmluZy4gVXN1YWxseSwgSFNBX09WRVJS
SURFX0dGWF9WRVJTSU9OIGlzIHVzZWQgdG8gZm9yY2UgYW4gdW5zdXBwb3J0ZWQgQVBVIHRvIGJl
IHJlY29nbml6ZWQgYXMgYSBST0NtLXN1cHBvcnRlZCBoaWdoLWVuZCBkR1BVLCB3aGljaCBoYXMg
YSBsYXJnZSBjd3NyIHNhdmUgYXJlYSwgbWFraW5nIHRoZSBvcGVyYXRpb24gc2FmZS4gVGhpcyBj
aGVjayB3YXMgYWRkZWQgdG8gS0ZEIHR3byB3ZWVrcyBhZ28sIHRoZSBIU0FfT1ZFUlJJREVfR0ZY
X1ZFUlNJT04gZW52aXJvbm1lbnQgaGFkIGJlZW4gd29ya2luZyBmaW5lIGJlZm9yZSB0aGF0Lg0K
Pj4+Pg0KPj4+PiBCZXN0IFJlZ2FyZHMsDQo+Pj4+IFlpZmFuDQo+Pj4+DQo+Pj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+IEZyb206IEthc2l2aXN3YW5hdGhhbiwgSGFyaXNoIDxI
YXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+DQo+Pj4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1
c3QgOCwgMjAyNCAxMDo0NiBQTQ0KPj4+PiBUbzogWmhhbmcsIFlpZmFuIDxZaWZhbjEuWmhhbmdA
YW1kLmNvbT47DQo+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+IENjOiBL
dWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBZYW5nLCBQaGlsaXANCj4+
Pj4gPFBoaWxpcC5ZYW5nQGFtZC5jb20+OyBaaGFuZywgWWlmYW4gPFlpZmFuMS5aaGFuZ0BhbWQu
Y29tPg0KPj4+PiBTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1ka2ZkOiBrZWVwIGNyZWF0ZSBx
dWV1ZSBzdWNjZXNzIGlmIGN3c3INCj4+Pj4gc2F2ZSBhcmVhIGRvZXNuJ3QgbWF0Y2gNCj4+Pj4N
Cj4+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24g
T25seV0NCj4+Pj4NCj4+Pj4gSW4gdGhpcyBjYXNlLCBzaG91bGRuJ3QgbGFyZ2VyIG9mIHR3byBz
aXplcyBiZSB1c2VkLiBBbHNvLCB3ZSBzaG91bGQgaGF2ZSBhbiB1cHBlciBib3VuZCBjaGVjay4N
Cj4+Pj4NCj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4gRnJvbTogYW1kLWdm
eCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+
Pj4+IFlpZmFuIFpoYW5nDQo+Pj4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgOCwgMjAyNCA0OjQ0
IEFNDQo+Pj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+PiBDYzogS3Vl
aGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgWWFuZywgUGhpbGlwDQo+Pj4+
IDxQaGlsaXAuWWFuZ0BhbWQuY29tPjsgWmhhbmcsIFlpZmFuIDxZaWZhbjEuWmhhbmdAYW1kLmNv
bT4NCj4+Pj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1ka2ZkOiBrZWVwIGNyZWF0ZSBxdWV1ZSBz
dWNjZXNzIGlmIGN3c3Igc2F2ZQ0KPj4+PiBhcmVhIGRvZXNuJ3QgbWF0Y2gNCj4+Pj4NCj4+Pj4g
SWYgSFNBX09WRVJSSURFX0dGWF9WRVJTSU9OIGlzIHVzZWQgaW4gUk9DbSB3b3JrbG9hZCwgdXNl
ciBzcGFjZSBhbmQga2VybmVsIHVzZSBkaWZmZXJlbnQgc3BlYyB0byBjYWxjdWxhdGUgY3dzciBz
YXZlIGFyZWEsIGN1cnJlbnQgY2hlY2sgbWF5IGZhaWwgY3JlYXRlIHF1ZXVlIGlvY3RsLiBDaGFu
Z2UgZXJyb3IgdG8gd2FybiB0byBtYWtlIGNyZWF0ZSBxdWV1ZSBzdWNjZWVkIGluIHRoYXQgY2Fz
ZS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogWWlmYW4gWmhhbmcgPHlpZmFuMS56aGFuZ0Bh
bWQuY29tPg0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9x
dWV1ZS5jIHwgNCArLS0tDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMg
ZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcXVldWUuYw0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9xdWV1ZS5jDQo+Pj4+IGluZGV4IGUwYTA3M2FlNGE0OS4uOWYyODNhZmYwNTdhIDEwMDY0NA0K
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcXVldWUuYw0KPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcXVldWUuYw0KPj4+PiBAQCAtMjk1
LDExICsyOTUsOSBAQCBpbnQga2ZkX3F1ZXVlX2FjcXVpcmVfYnVmZmVycyhzdHJ1Y3Qga2ZkX3By
b2Nlc3NfZGV2aWNlICpwZGQsIHN0cnVjdCBxdWV1ZV9wcm9wZQ0KPj4+PiAgICAgICAgIH0NCj4+
Pj4NCj4+Pj4gICAgICAgICBpZiAocHJvcGVydGllcy0+Y3R4X3NhdmVfcmVzdG9yZV9hcmVhX3Np
emUgIT0gdG9wb19kZXYtPm5vZGVfcHJvcHMuY3dzcl9zaXplKSB7DQo+Pj4+IC0gICAgICAgICAg
ICAgICBwcl9kZWJ1ZygicXVldWUgY3dzciBzaXplIDB4JXggbm90IGVxdWFsIHRvIG5vZGUgY3dz
ciBzaXplIDB4JXhcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICBwcl93YXJuKCJxdWV1ZSBjd3Ny
IHNpemUgMHgleCBub3QgZXF1YWwgdG8gbm9kZQ0KPj4+PiArIGN3c3Igc2l6ZSAweCV4XG4iLA0K
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBwcm9wZXJ0aWVzLT5jdHhfc2F2ZV9yZXN0b3Jl
X2FyZWFfc2l6ZSwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgdG9wb19kZXYtPm5vZGVf
cHJvcHMuY3dzcl9zaXplKTsNCj4+Pj4gLSAgICAgICAgICAgICAgIGVyciA9IC1FSU5WQUw7DQo+
Pj4+IC0gICAgICAgICAgICAgICBnb3RvIG91dF9lcnJfdW5yZXNlcnZlOw0KPj4+PiAgICAgICAg
IH0NCj4+Pj4NCj4+Pj4gICAgICAgICB0b3RhbF9jd3NyX3NpemUgPSAodG9wb19kZXYtPm5vZGVf
cHJvcHMuY3dzcl9zaXplICsNCj4+Pj4gdG9wb19kZXYtPm5vZGVfcHJvcHMuZGVidWdfbWVtb3J5
X3NpemUpDQo+Pj4+IC0tDQo+Pj4+IDIuMzcuMw0KPj4+Pg0KPj4+Pg0K
