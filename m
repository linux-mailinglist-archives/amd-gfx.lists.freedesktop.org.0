Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E69C38D7
	for <lists+amd-gfx@lfdr.de>; Mon, 11 Nov 2024 08:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7265B10E42B;
	Mon, 11 Nov 2024 07:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="42eTcfai";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7719310E427
 for <amd-gfx@lists.freedesktop.org>; Mon, 11 Nov 2024 07:04:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HufaDbuI7PwJ6bEqowuVGlB70SSqVkAC/oGvoi2c5/MMxfOUkBzz+cijd9EfbcmSCw2r+U/6K31nXirS6OxSo+NWW6rvpL4OOZE9NsRuDrVZR8oelE7GkTvMj7uJtp5u+NP8w3eViN2i0G/QXw5uibJn79jUYhEKuNX5guNkHxFWlvMO8ODYqUttqTkuJXUVrfh3nwISdmkS31Pqh8peJxMSpmOY1B9fypTnRhNSwxnX2qoDzU73sv63Kr2cchc3YZuYlcRfb2ZKU67J+G8hIvfpmexlnYVDYdDhJ5uc8VLfEaqLV1eX38uUlkD4hrTMxVUfuodRJ7+ZD1YPsHpSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTuI/RQ77BTcv/c2PGC424GAfVWDCD8sxpJ7n6Nk/0c=;
 b=itRIRxHwjiuOeAt/OjLxJlqWIQESOWpW8uvRbMpxWmXVPsJb+YRfetsuxxbidiao1/XJdiLUpSSgnNEuc9w63Nyh7HSK7sSuMr5T6rM70gDuWcW/xvIbQ9yfrwdQ4OOyjlUah/5V/xJi9vD09Z33GBgAKwkbBlQ5EFkCM9SCU/6HbAQumQIo/ebyZANtCuI+TqgHavhCBnsKfREltlRPCP/GEqilEqvRan0OShGifenpVmgZHlZHeQ26Naq7KriX1rtw+fy4p+/jH2W2O0EHKGXKsYAvRI+QoCqLce6BXAHvOv/7BMvup0pb39ankXPqWNnAxSG7/imnD4oediao8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTuI/RQ77BTcv/c2PGC424GAfVWDCD8sxpJ7n6Nk/0c=;
 b=42eTcfaiFQ3pDY1wb3cov4lNmeL6A/YhN2u4cKCogG5XlYaS2Bn7UTSiwTmnT+SNRZUP/hfqRW5y2xOdNCTw2oZdXFI66KNgaYMEUh3IHbP0eWmhpi1gSoODy1l+6HvkHKad24rqIhsCqXxaLrKu2G6FFXQvDUFMBOSzfA8JEbc=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by CY5PR12MB6477.namprd12.prod.outlook.com (2603:10b6:930:36::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Mon, 11 Nov
 2024 07:04:33 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::d4b5:6a30:96d5:e3ed%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 07:04:33 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Huang, Tim" <Tim.Huang@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix double free vcn ip_dump
Thread-Topic: [PATCH] drm/amdgpu: fix double free vcn ip_dump
Thread-Index: AQHbNAMsbw5eK35gIkmwAGRtsdHglrKxouoAgAAEpIA=
Date: Mon, 11 Nov 2024 07:04:33 +0000
Message-ID: <DM4PR12MB515290EC35672190F63D1501E3582@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20241111063011.1380340-1-jesse.zhang@amd.com>
 <788c8bb2-75c1-3ad4-4898-6a01d6019587@amd.com>
In-Reply-To: <788c8bb2-75c1-3ad4-4898-6a01d6019587@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=e3e35607-3bef-4538-861f-7e7814604b1e;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-11T07:03:20Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|CY5PR12MB6477:EE_
x-ms-office365-filtering-correlation-id: a91732cd-66bb-4512-7072-08dd021f184a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?di80MGM3UXl4WVV5N2FOODdHdWJLbGxoQ2FLY3BBMTVua3F3M3FGWXNoYTNL?=
 =?utf-8?B?Q1VyaUgxRm5xU3FWTFNrK1FOQkZieUNqSVBpTVdqczgxUHVQaDZjU0g2VUR1?=
 =?utf-8?B?TzAxVUdjbjY1TUEzUjFVYUlTNXNSdENTRGI1ZTBMaDI2OHF1ZlAyelFhTGo5?=
 =?utf-8?B?RnBxdlk1TTl1SGcxblBycE9BU1lCSXFzZmhKa0txQjZXVmcvMkhiMzZ2QWFk?=
 =?utf-8?B?a216RFJEYXprTmU3MThDb29Cb2tpOU9NeGJNU21GS0lSWmNNUW5zZVVjTFRi?=
 =?utf-8?B?QzNBcXp5WjV1T2RhTk1ERUJtblNhL1Q2ZWJDSHhWUEhPd3gzWlBSeEQxcnBH?=
 =?utf-8?B?YnlxaXRaSVFQOVJ1dWNtOFRWVFMxWllXZEN0Y0tmbDN6K3MrTDJ4SjVZMUdW?=
 =?utf-8?B?N3p4cXdnUTB0Q0drTFlJbUtVWkZyTDAvbUJ5eVkyZ204YzBPNHBLRDE0akxw?=
 =?utf-8?B?U25EVUg3VGJBUTRORDVuaE5vb2tqNlBLOEgwY280OFcwVm5yTlpQR2NLeU44?=
 =?utf-8?B?RnhPRHU5dkZxMk8vQ0lZWlBBcnAvVlRXTTltN25iUm5jSjI4UFdSRkNOOVht?=
 =?utf-8?B?anhFVVl4eUNpVCtYbXg2QlNzT0xBM3dBVmNodGlTdjJZckZzTU5sVUFzRFRY?=
 =?utf-8?B?NElDK28zWkJPRmJtVjAwQ1NmUTMvYWY3N2dnWkNJRGUxT2VndXdicmR1cUtL?=
 =?utf-8?B?MWdmeGRjdUJtblVEVjVjZlp6KzNpbVNUTkVELzcwMGlRUTFSYWZONW5WWGYx?=
 =?utf-8?B?cTdxQXhHZVNUemZOck45MUlBcFZlaVJkQUJ5eGNTNzRnYTh1cVcvRm9sZzBv?=
 =?utf-8?B?ZXhJb1VvQ2E2K3M4bmVXWWtpbGNxemxybHlBTWxSTVZOWE5lZXZxZm96SXda?=
 =?utf-8?B?TnF1UVJCeFZCdUZsTzJYanNjK2I2N2dVQ0twL1hxNUovYmRuMVBXYTBKTFlj?=
 =?utf-8?B?cVM4bUMxQWx5NEJ4YmNRQ3VNWm9wbi9OZGZObHE5SytEOHVpRWNDNEhxTWt2?=
 =?utf-8?B?REdha1p2QkVyaVlrandlVW9zWkFNb2tIeHVEY0VqUlpTN3pZa21EQ094Yy9W?=
 =?utf-8?B?Y0J0KzZBV1p4RU5lUVJTb04wYU1DZXpyeUgwVEZ4RGJoaWJDV0Q0TldBYVAx?=
 =?utf-8?B?RmdDcEp5dlJSL3VjNWxBOC9xK1VDQXNCOEdMTHVQYUdNd01XanUxSllqUm5K?=
 =?utf-8?B?RE1uUXh2L05SajVubWxZQXVKYTBwdEZWbWg0Umcrdm9UYnk5V0lDTU5BU3E1?=
 =?utf-8?B?L05ueFhORHJHTGVWdkV1N1BqZ3JIaTF2cWd5bGRLSEI1dTFwTDZXMzVYTUNr?=
 =?utf-8?B?dW5wV0RYeUllcmcwT0NUU3I1ZEtLTGhNYXRMd0lBZm5tb0h0amxvWGcyeEtz?=
 =?utf-8?B?NWNMNG42eHlqckswdWE4MkttRDNLSjlqNWxRUEhneis0VU4rbHEwdWM4L2ta?=
 =?utf-8?B?ckNyaFdyczFwdnh4OXhvRDIyNDljT3greVBlZCtEMElrM2RZNkQySWtVTzlm?=
 =?utf-8?B?VHhrS3l3SndBL3NYaWFjYXpSMngxOE1YdWlrZDlzWTVscW9KODl5WVJmeGRW?=
 =?utf-8?B?ekZSdWV3dlpja0xJb1B6N2RobkRJMWp2bjdCWDBQdEZOSjFVeUJYaEhPZXZu?=
 =?utf-8?B?SHQ0a1lPcjJSRUZjL1FuR0V5UWlYemdDbHJaWVJZckNPL1dvSC83bnhLandi?=
 =?utf-8?B?NXk1MnBQbWZ0Zmg2eXYwZ3JaVjdmNHNrUFlmR0c3YmlMbm91cEZnL3pyU3lu?=
 =?utf-8?B?Y0hkY051WVlNQlk1aVdCazVyTCtqOTVuSUxoNkRhTGxpcDFOTGZ5a0pUOENn?=
 =?utf-8?Q?+DczMZMloJDKZJxwcKZoZa+04mMI6+7MUnEV4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmRhWHUxdTNLSmNRb0lCN3VRL0QrN0p6NU9RVzYya1JCeWQ2c1JqUmN6bnhk?=
 =?utf-8?B?ZEdFZDdoSWI3ek9ZM3dyb0FVd2IrcWZ2cEVnVW1VRzBFdklhTEtXL2VEUXpo?=
 =?utf-8?B?RDVXRi96dXIzdFp4bzVROExYMFhjbWNEVW1qZGxWR083bUNiZDBvVUdwb0VI?=
 =?utf-8?B?MXhXcmxsRHhRaERIVWZuaFJvMlVFQkt1MjhMNFBCS2xscndHOTZ4NnY3VEE1?=
 =?utf-8?B?S1VnZWM4YnpQSmp0dFBhdFRIWGkwQWRjdmFXdjZjQ2tTUjhDaSt2dEsva1pD?=
 =?utf-8?B?QkMzQWZaYTlUamJ0VTMwRHZXKzJQQjhER3daQnNoSFBtODlVVHBYMWplVDlR?=
 =?utf-8?B?TEhkN0VXVWZmNzJNdkdUNzgrVzJhUGo3dm9TOXF4aG01WlF6VGxzcXp3QWY3?=
 =?utf-8?B?Nnc0Q1dQdDVFS0ovR3lHOSt3M3RhV0FSSWhZSElPaVhBNFFSWmZsRHhoZm55?=
 =?utf-8?B?YlV0clV0aFpFVDh2UTV0WmZJM0VpZjhkSUgvWkZjZEVCUVN1U1RiTGxMU1Uz?=
 =?utf-8?B?NGNjZy9KQkZsWWRiQnlkQzRBNFkrZUNWYTN3UnlKVStwNWdMdHpVZ0lmbERy?=
 =?utf-8?B?U3U5KytuYkJhTWNObW1VMlBPc1RhTndBNUFvRFcxdk00eGxLdjFOdnBLcXho?=
 =?utf-8?B?b1M3WHlaZ2VKQ2dZUWdCQ25RVnhMTy9tQUVUSlRzMTlCZ1IvaGt2SHlWYXJ2?=
 =?utf-8?B?aUNxTHlGcFBpRzRZVjdyZzhFaWZPenVnazA2Q2gvTVN0TnE1amFiZ0NyUmxJ?=
 =?utf-8?B?dE4rc3NDZFJoS1NCL2lXTjhDdmlBWlRJQ3VDR0hTRmNZK29DL3JkREY4WXdJ?=
 =?utf-8?B?RCtEdkdsZ29OOTB4d0RXTWlyai92TkdvcEFseFBtckJyNytueFMvOXpmdGlE?=
 =?utf-8?B?N2k1R25zQ0pVbWtIRE54cDUrVnQ1QnYrVkhIdWFHc0xpemd0NjFxTkdyWFRM?=
 =?utf-8?B?ckdCdDFmMEJkMjRVQ2FTRXJ1MS90ekxwUjFQRlhHcmJkM3IvdkNnNm8zeC9W?=
 =?utf-8?B?UDByK1d4UVdJS21qVGxrMjdlSHZBMy9yWG11NERSU2F3bVY5WWlVekM1SmZQ?=
 =?utf-8?B?NTh0NzhMYjZKbjBmSE1QNW5lZ2Z6VUYyQ1ZIYmsxTXNZcW1ZOTcvYW9NYXN6?=
 =?utf-8?B?S2NYMkVFdXIwYUo5S05HL2NVUFlJOGppcWJ0dm82MmEyK2RsaXJTZEl2UUJq?=
 =?utf-8?B?WFFXOVVyMlVuMU00RmJQU2RacWxrT01iUHlQbitZYUUxSHFRdkxkdXV2Y3FH?=
 =?utf-8?B?UllFak8yODhuQlZxWFdnelZaUlZ4WjBKS1RsYklPNk0yenpDRFBSckFzYkpZ?=
 =?utf-8?B?RlZVRitjdFJ1Mm5iVVA0K1BjL1dtbktobFpRZkFCWTBjNnpjcHUzY29OOElr?=
 =?utf-8?B?VWtIcENONFdwUW1IL2VRaXhDem4zU053aU5VenRFK0NtMkEyWlJxWm5jMSs4?=
 =?utf-8?B?ZWFUVkxOL1lIbWkzODVjcFVhWmRpOXNDTHVhS0JtYitBNzcrMTlEc3RtNzBo?=
 =?utf-8?B?MGpaMUdsRkkrZjR0cEsvbENpMVRRRjk0dVV5RUZKT2RsMFNZQno4RWNNeHgw?=
 =?utf-8?B?Rlp5QVJxYWo0Rys1N3BKdnNvUTV1Wk1JalZwcDZHNGs4SDNtdTYzNlUrUVg1?=
 =?utf-8?B?K1hReTVhQldOdTAvN2t5b0VMYjZkRGpGZG1IaGdTa1FqS2FwTWJzbnFCNXI1?=
 =?utf-8?B?WndxalVEbHk2OFFrbkM5MG1VS2prWS9vUSttU0FqWTZhU0I2YS9oMTEzV29R?=
 =?utf-8?B?dkJMNTRaRnppK0ZMSVE4cW1xVnVEYVNBeDY5d3VGeXl5T2FlVjVSM2szdWti?=
 =?utf-8?B?TmNaY2IxRSs1R0hPcTB4T3AyQkVySWsxdjRlOTBLWE9LRlNlOW9jL2xQb21s?=
 =?utf-8?B?ZEI4ZEZuYmsydWdTcEJGYklPNEtpM0YyTTRaQWJvY3p0bmNrYXQraGR3dHo4?=
 =?utf-8?B?M0swSVBRU3RJK0ZGTkluRTBSdnlFZmp5Wm5ya2xHMkJZSUZwaUNISCtlN3hR?=
 =?utf-8?B?RjFyRVdkYTNyK1NocXBLcmZyemZlWHlITHQ5TkFnUzFtWmF4dXdYYXlTSGxa?=
 =?utf-8?B?ek96d1NaS3MxWUJWSDNlSm5CTjM1ZUdWbGEzMDBuVzd1QXAyWld2b0hsKzAz?=
 =?utf-8?Q?pSyM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91732cd-66bb-4512-7072-08dd021f184a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 07:04:33.1073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/n0QC8qFftby3mqVHvm2NrsirIt1HZVnUZz7TyfCOf8gLpn+6gXipMpKvebbH2ZhLnCk8OshsoEsSR7gY9ufA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6477
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
Cg0KSGkgU3VuaWwgS2hhdHJpLA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
S2hhdHJpLCBTdW5pbCA8U3VuaWwuS2hhdHJpQGFtZC5jb20+DQpTZW50OiBNb25kYXksIE5vdmVt
YmVyIDExLCAyMDI0IDI6NDcgUE0NClRvOiBaaGFuZywgSmVzc2UoSmllKSA8SmVzc2UuWmhhbmdA
YW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxl
eGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFByb3N5YWssIFZpdGFseSA8Vml0YWx5LlByb3N5YWtA
YW1kLmNvbT47IEh1YW5nLCBUaW0gPFRpbS5IdWFuZ0BhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQ
QVRDSF0gZHJtL2FtZGdwdTogZml4IGRvdWJsZSBmcmVlIHZjbiBpcF9kdW1wDQoNClRoaXMgaXNu
dCBuZWVkZWQgYW55IG1vcmUgYXMgdGhlIGlzc3VlIGlzIGludHJvZHVjZWQgd2l0aCBwZXIgaXAg
Y2hhbmdlcyBpbiBWQ04uDQpDaGFuZ2VzIHRvIGFjY29tb2RhdGUgcGVyIGlwIGNoYW5nZXMgZm9y
IGlwIGR1bXAgaXMgYWxyZWFkeSByZXZpZXdlZCBhbmQgaW4gcHJvZ3Jlc3MgdG8gYmUgbWVyZ2Vk
LiBXaXRoIHRoYXQgZWFjaCBJUCBvZiBWQ04gaGF2ZSBpdCBvd24gbWVtb3J5IHdoaWNoIGlzIGZy
ZWVkIG9ubHkgb25jZS4NCg0KV2UgZG9udCBuZWVkIHRoaXMgY2hhbmdlIGFueW1vcmUgYXMgd2Ug
bmVlZCBwZXIgdmNuIGlwL2luc3RhbmNlIG1lbW9yeSB3aGljaCBpcyBhIGRlc2lnbiBjaGFuZ2Ug
YW5kIGlzIHRha2VuIGNhcmUgd2l0aCBjaGFuZ2VzIGluIG1lcmdlIHBpcGVsaW5lLg0KDQpUaGFu
a3MsIEkgc2VlIHlvdXIgcGF0Y2ggYW5kIHdpbGwgZHJvcCBpdC4NCg0KUmVnYXJkcw0KSmVzc2UN
Cg0KUmVnYXJkcw0KU3VuaWwgS2hhdHJpDQoNCk9uIDExLzExLzIwMjQgMTI6MDAgUE0sIEplc3Nl
LnpoYW5nQGFtZC5jb20gd3JvdGU6DQo+IFsgICA5MC40NDE4NjhdIC0tLS0tLS0tLS0tLVsgY3V0
IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiBbICAgOTAuNDQxODczXSBrZXJuZWwgQlVHIGF0IG1tL3Ns
dWIuYzo1NTMhDQo+IFsgICA5MC40NDE4ODVdIE9vcHM6IGludmFsaWQgb3Bjb2RlOiAwMDAwIFsj
MV0gUFJFRU1QVCBTTVAgTk9QVEkNCj4gWyAgIDkwLjQ0MTg5Ml0gQ1BVOiAwIFBJRDogMTUyMyBD
b21tOiBhbWRfcGNpX3VucGx1ZyBUYWludGVkOiBHICAgICAgICAgICAgRSAgICAgIDYuMTAuMCsg
IzQ3DQo+IFsgICA5MC40NDE5MDBdIEhhcmR3YXJlIG5hbWU6IEFNRCBTcGxpbnRlci9TcGxpbnRl
ci1QSFgyLCBCSU9TIFRTNDExMDJDXzkyNSAwMS8wNS8yMDI0DQo+IFsgICA5MC40NDE5MDddIFJJ
UDogMDAxMDpfX3NsYWJfZnJlZSsweDFjZS8weDMyMA0KPiBbICAgOTAuNDQxOTE2XSBDb2RlOiBm
NyBjMyAwMCAwMiAwMCAwMCAwZiA4NCA2YyBmZiBmZiBmZiBmYiAwZiAxZiA0NCAwMCAwMCBlOSA2
MSBmZiBmZiBmZiA0MSBmNyA0NiAwOCA4NyAwNCAwMCAwMCAwZiA4NSBkNiBmZSBmZiBmZiBlOSBj
YSBmZSBmZiBmZiA8MGY+IDBiIDQ5IDNiIDVjIDI0IDI4IDc1IGJkIDQ4IDhiIDQ0IDI0IDI4IDQ5
IDg5IDRjIDI0IDI4IGJhIDAxIDAwDQo+IFsgICA5MC40NDE5MjddIFJTUDogMDAxODpmZmZmYjlj
ODAxY2VmY2IwIEVGTEFHUzogMDAwMTAyNDYNCj4gWyAgIDkwLjQ0MTkzNF0gUkFYOiBmZmZmOGNk
YjQ4MWRjZjAwIFJCWDogMDAwMDAwMDAwMDIwMDAxMiBSQ1g6IGZmZmY4Y2RiNDgxZGNlMDANCj4g
WyAgIDkwLjQ0MTk0MF0gUkRYOiBmZmZmOGNkYjQ4MWRjZTAwIFJTSTogZmZmZmUzZjkwNDIwNzcw
MCBSREk6IGZmZmY4Y2RiNDAwNDJhMDANCj4gWyAgIDkwLjQ0MTk0NV0gUkJQOiBmZmZmYjljODAx
Y2VmZDUwIFIwODogMDAwMDAwMDAwMDAwMDAwMSBSMDk6IGZmZmZmZmZmYzE0OWY2MzINCj4gWyAg
IDkwLjQ0MTk1MF0gUjEwOiBmZmZmOGNkYjQ4MWRjZTAwIFIxMTogZmZmZjhjZTI2ZTYyMWUxOCBS
MTI6IGZmZmZlM2Y5MDQyMDc3MDANCj4gWyAgIDkwLjQ0MTk1Nl0gUjEzOiBmZmZmOGNkYjQ4MWRj
ZTAwIFIxNDogZmZmZjhjZGI0MDA0MmEwMCBSMTU6IGZmZmY4Y2RiNDgxZGNlMDANCj4gWyAgIDkw
LjQ0MTk2Ml0gRlM6ICAwMDAwN2YwYTRmM2ZlYzQwKDAwMDApIEdTOmZmZmY4Y2UyNmU2MDAwMDAo
MDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgOTAuNDQxOTY4XSBDUzogIDAwMTAg
RFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+IFsgICA5MC40NDE5NzRd
IENSMjogMDAwMDU1YmY3NGJhODkzMCBDUjM6IDAwMDAwMDAxMDhmNDgwMDAgQ1I0OiAwMDAwMDAw
MDAwNzUwZWYwDQo+IFsgICA5MC40NDE5NzldIFBLUlU6IDU1NTU1NTU0DQo+IFsgICA5MC40NDE5
ODNdIENhbGwgVHJhY2U6DQo+IFsgICA5MC40NDE5ODddICA8VEFTSz4NCj4gWyAgIDkwLjQ0MTk5
MV0gID8gc2hvd19yZWdzKzB4NmIvMHg4MA0KPiBbICAgOTAuNDQxOTk5XSAgPyBfX2RpZV9ib2R5
KzB4MjQvMHg3MA0KPiBbICAgOTAuNDQyMDA1XSAgPyBkaWUrMHg0Mi8weDcwDQo+IFsgICA5MC40
NDIwMTFdICA/IGRvX3RyYXArMHhkYS8weGYwDQo+IFsgICA5MC40NDIwMThdICA/IGRvX2Vycm9y
X3RyYXArMHg3Ni8weGEwDQo+IFsgICA5MC40NDIwMjNdICA/IF9fc2xhYl9mcmVlKzB4MWNlLzB4
MzIwDQo+IFsgICA5MC40NDIwMzBdICA/IGV4Y19pbnZhbGlkX29wKzB4NTcvMHg4MA0KPiBbICAg
OTAuNDQyMDM2XSAgPyBfX3NsYWJfZnJlZSsweDFjZS8weDMyMA0KPiBbICAgOTAuNDQyMDQyXSAg
PyBhc21fZXhjX2ludmFsaWRfb3ArMHgxZi8weDMwDQo+IFsgICA5MC40NDIwNTNdICA/IHZjbl92
NF8wX3N3X2ZpbmkrMHhjMi8weDExMCBbYW1kZ3B1XQ0KPiBbICAgOTAuNDQyMzA4XSAgPyBfX3Ns
YWJfZnJlZSsweDFjZS8weDMyMA0KPiBbICAgOTAuNDQyMzE2XSAgPyByZWxlYXNlX2Zpcm13YXJl
LnBhcnQuMCsweDJlLzB4NTANCj4gWyAgIDkwLjQ0MjMyM10gID8gc3Jzb19hbGlhc19yZXR1cm5f
dGh1bmsrMHg1LzB4ZmJlZjUNCj4gWyAgIDkwLjQ0MjMzMl0gID8gc3Jzb19hbGlhc19yZXR1cm5f
dGh1bmsrMHg1LzB4ZmJlZjUNCj4gWyAgIDkwLjQ0MjMzOF0gID8gdmNuX3Y0XzBfc3dfZmluaSsw
eGMyLzB4MTEwIFthbWRncHVdDQo+IFsgICA5MC40NDI0OTZdICBrZnJlZSsweDIzZS8weDJmMA0K
PiBbICAgOTAuNDQyNTAyXSAgdmNuX3Y0XzBfc3dfZmluaSsweGMyLzB4MTEwIFthbWRncHVdDQo+
IFsgICA5MC40NDI2NTNdICBhbWRncHVfZGV2aWNlX2Zpbmlfc3crMHgxMzMvMHg3MDAgW2FtZGdw
dV0NCj4gWyAgIDkwLjQ0MjgzNV0gIGFtZGdwdV9kcml2ZXJfcmVsZWFzZV9rbXMrMHgxYS8weDMw
IFthbWRncHVdDQo+IFsgICA5MC40NDI5ODFdICBkcm1fZGV2X3JlbGVhc2UrMHgyZC8weDUwIFtk
cm1dDQo+IFsgICA5MC40NDMwMDNdICBkcm1fbWlub3JfcmVsZWFzZSsweDNkLzB4NjAgW2RybV0N
Cj4gWyAgIDkwLjQ0MzAyNl0gIGRybV9yZWxlYXNlKzB4OTAvMHhkMCBbZHJtXQ0KPiBbICAgOTAu
NDQzMDUyXSAgX19mcHV0KzB4ZmEvMHgyZjANCj4gWyAgIDkwLjQ0MzA1OV0gIF9fZnB1dF9zeW5j
KzB4MWUvMHgzMA0KPiBbICAgOTAuNDQzMDY0XSAgX194NjRfc3lzX2Nsb3NlKzB4NDIvMHg5MA0K
PiBbICAgOTAuNDQzMDcxXSAgeDY0X3N5c19jYWxsKzB4MThmNi8weDIwZDANCj4gWyAgIDkwLjQ0
MzA3Nl0gIGRvX3N5c2NhbGxfNjQrMHg2Zi8weDExMA0KPiBbICAgOTAuNDQzMDgzXSAgPyBkb19z
eXNjYWxsXzY0KzB4N2IvMHgxMTANCj4gWyAgIDkwLjQ0MzA4OV0gIGVudHJ5X1NZU0NBTExfNjRf
YWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UNCj4gWyAgIDkwLjQ0MzA5Nl0gUklQOiAwMDMzOjB4N2Yw
YTUxNTE0ZjY3DQo+IFsgICA5MC40NDMxMDJdIENvZGU6IGZmIGU4IDBkIDE2IDAyIDAwIDY2IDJl
IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDAwIGYzIDBmIDFlIGZhIDY0IDhiIDA0IDI1
IDE4IDAwIDAwIDAwIDg1IGMwIDc1IDEwIGI4IDAzIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDAg
ZjAgZmYgZmYgNzcgNDEgYzMgNDggODMgZWMgMTggODkgN2MgMjQgMGMgZTggNzMgYmEgZjcgZmYN
Cj4gWyAgIDkwLjQ0MzExM10gUlNQOiAwMDJiOjAwMDA3ZmZlYzI5YjE2ZTggRUZMQUdTOiAwMDAw
MDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAwMw0KPiBbICAgOTAuNDQzMTIxXSBSQVg6IGZm
ZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogMDAwMDdmMGE1MTUxNGY2
Nw0KPiBbICAgOTAuNDQzMTI3XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDEgUlNJOiAwMDAwN2YwYTUx
Nzc2NDg1IFJESTogMDAwMDAwMDAwMDAwMDAwMw0KPiBbICAgOTAuNDQzMTMyXSBSQlA6IDAwMDA3
ZmZlYzI5YjE3NzAgUjA4OiAwMDAwNTVmOTQyMzgxMTcwIFIwOTogMDAwMDAwMDAwMDAwMDAwMA0K
PiBbICAgOTAuNDQzMTM4XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAw
MjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMA0KPiBbICAgOTAuNDQzMTQzXSBSMTM6IDAwMDA1NWY5
MGEyYTQxYzAgUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogMDAwMDAwMDAwMDAwMDAwMQ0KPiBb
ICAgOTAuNDQzMTUyXSAgPC9UQVNLPg0KPg0KPiBTZXQgaXBfZHVtcCB0byBudWxsIGFmdGVyIHJl
bGVhc2luZyB2Y24gaXBfZHVtcC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgWmhhbmcgPGpl
c3NlLnpoYW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml8wLmMgICB8IDUgKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjNfMC5jICAgfCA1ICsrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3Y0XzAuYyAgIHwgNSArKysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
NF8wXzMuYyB8IDUgKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjRf
MF81LmMgfCA1ICsrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y1XzBf
MC5jIHwgNSArKysrLQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jDQo+
IGluZGV4IGEzMjdjM2JmODRmMi4uYjIzYjU1NTM5YjQzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml8wLmMNCj4gQEAgLTI2Myw3ICsyNjMsMTAgQEAgc3RhdGljIGludCB2
Y25fdjJfMF9zd19maW5pKHN0cnVjdA0KPiBhbWRncHVfaXBfYmxvY2sgKmlwX2Jsb2NrKQ0KPg0K
PiAgICAgICByID0gYW1kZ3B1X3Zjbl9zd19maW5pKGFkZXYsIGluc3QpOw0KPg0KPiAtICAgICBr
ZnJlZShhZGV2LT52Y24uaXBfZHVtcCk7DQo+ICsgICAgIGlmIChhZGV2LT52Y24uaXBfZHVtcCkg
ew0KPiArICAgICAgICAgICAgIGtmcmVlKGFkZXYtPnZjbi5pcF9kdW1wKTsNCj4gKyAgICAgICAg
ICAgICBhZGV2LT52Y24uaXBfZHVtcCA9IE5VTEw7DQo+ICsgICAgIH0NCj4NCj4gICAgICAgcmV0
dXJuIHI7DQo+ICAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YzXzAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMNCj4g
aW5kZXggYjc4YzZkYTBhM2NkLi5kZjM4NTVlN2I1YzEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92M18wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YzXzAuYw0KPiBAQCAtMzMxLDcgKzMzMSwxMCBAQCBzdGF0aWMgaW50IHZj
bl92M18wX3N3X2Zpbmkoc3RydWN0DQo+IGFtZGdwdV9pcF9ibG9jayAqaXBfYmxvY2spDQo+DQo+
ICAgICAgIHIgPSBhbWRncHVfdmNuX3N3X2ZpbmkoYWRldiwgaW5zdCk7DQo+DQo+IC0gICAgIGtm
cmVlKGFkZXYtPnZjbi5pcF9kdW1wKTsNCj4gKyAgICAgaWYgKGFkZXYtPnZjbi5pcF9kdW1wKSB7
DQo+ICsgICAgICAgICAgICAga2ZyZWUoYWRldi0+dmNuLmlwX2R1bXApOw0KPiArICAgICAgICAg
ICAgIGFkZXYtPnZjbi5pcF9kdW1wID0gTlVMTDsNCj4gKyAgICAgfQ0KPiAgICAgICByZXR1cm4g
cjsNCj4gICB9DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjRfMC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y0XzAuYw0KPiBp
bmRleCA1YzNiNzE4ZWJkZmEuLmQ4YjQ2ZjQ0MGJhNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y0XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjRfMC5jDQo+IEBAIC0yOTUsNyArMjk1LDEwIEBAIHN0YXRpYyBpbnQgdmNu
X3Y0XzBfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1X2lwX2Jsb2NrICppcF9ibG9jaykNCj4gICAgICAg
YW1kZ3B1X3Zjbl9zeXNmc19yZXNldF9tYXNrX2ZpbmkoYWRldik7DQo+ICAgICAgIHIgPSBhbWRn
cHVfdmNuX3N3X2ZpbmkoYWRldiwgaW5zdCk7DQo+DQo+IC0gICAgIGtmcmVlKGFkZXYtPnZjbi5p
cF9kdW1wKTsNCj4gKyAgICAgaWYgKGFkZXYtPnZjbi5pcF9kdW1wKSB7DQo+ICsgICAgICAgICAg
ICAga2ZyZWUoYWRldi0+dmNuLmlwX2R1bXApOw0KPiArICAgICAgICAgICAgIGFkZXYtPnZjbi5p
cF9kdW1wID0gTlVMTDsNCj4gKyAgICAgfQ0KPg0KPiAgICAgICByZXR1cm4gcjsNCj4gICB9DQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjRfMF8zLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjRfMF8zLmMNCj4gaW5kZXggYWEwNmIy
ZmRlYjdhLi5jNzE3OTM0MzE0MzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92NF8wXzMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjRfMF8zLmMNCj4gQEAgLTI1Nyw3ICsyNTcsMTAgQEAgc3RhdGljIGludCB2Y25fdjRfMF8z
X3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9pcF9ibG9jayAqaXBfYmxvY2spDQo+ICAgICAgIGFtZGdw
dV92Y25fc3lzZnNfcmVzZXRfbWFza19maW5pKGFkZXYpOw0KPiAgICAgICByID0gYW1kZ3B1X3Zj
bl9zd19maW5pKGFkZXYsIGluc3QpOw0KPg0KPiAtICAgICBrZnJlZShhZGV2LT52Y24uaXBfZHVt
cCk7DQo+ICsgICAgIGlmIChhZGV2LT52Y24uaXBfZHVtcCkgew0KPiArICAgICAgICAgICAgIGtm
cmVlKGFkZXYtPnZjbi5pcF9kdW1wKTsNCj4gKyAgICAgICAgICAgICBhZGV2LT52Y24uaXBfZHVt
cCA9IE5VTEw7DQo+ICsgICAgIH0NCj4NCj4gICAgICAgcmV0dXJuIHI7DQo+ICAgfQ0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y0XzBfNS5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y0XzBfNS5jDQo+IGluZGV4IDRlN2RhNTZhOWYz
NC4uNGM0YjhhNzExYjk5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjRfMF81LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y0
XzBfNS5jDQo+IEBAIC0yNTIsNyArMjUyLDEwIEBAIHN0YXRpYyBpbnQgdmNuX3Y0XzBfNV9zd19m
aW5pKHN0cnVjdA0KPiBhbWRncHVfaXBfYmxvY2sgKmlwX2Jsb2NrKQ0KPg0KPiAgICAgICByID0g
YW1kZ3B1X3Zjbl9zd19maW5pKGFkZXYsIGluc3QpOw0KPg0KPiAtICAgICBrZnJlZShhZGV2LT52
Y24uaXBfZHVtcCk7DQo+ICsgICAgIGlmIChhZGV2LT52Y24uaXBfZHVtcCkgew0KPiArICAgICAg
ICAgICAgIGtmcmVlKGFkZXYtPnZjbi5pcF9kdW1wKTsNCj4gKyAgICAgICAgICAgICBhZGV2LT52
Y24uaXBfZHVtcCA9IE5VTEw7DQo+ICsgICAgIH0NCj4NCj4gICAgICAgcmV0dXJuIHI7DQo+ICAg
fQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y1XzBfMC5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Y1XzBfMC5jDQo+IGluZGV4IGE3
MmRlMjA0ZjEzMC4uNzFmMmNiNzVlOTFmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjVfMF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3Y1XzBfMC5jDQo+IEBAIC0yMjYsNyArMjI2LDEwIEBAIHN0YXRpYyBpbnQgdmNuX3Y1
XzBfMF9zd19maW5pKHN0cnVjdCBhbWRncHVfaXBfYmxvY2sgKmlwX2Jsb2NrKQ0KPiAgICAgICBh
bWRncHVfdmNuX3N5c2ZzX3Jlc2V0X21hc2tfZmluaShhZGV2KTsNCj4gICAgICAgciA9IGFtZGdw
dV92Y25fc3dfZmluaShhZGV2LCBpbnN0KTsNCj4NCj4gLSAgICAga2ZyZWUoYWRldi0+dmNuLmlw
X2R1bXApOw0KPiArICAgICBpZiAoYWRldi0+dmNuLmlwX2R1bXApIHsNCj4gKyAgICAgICAgICAg
ICBrZnJlZShhZGV2LT52Y24uaXBfZHVtcCk7DQo+ICsgICAgICAgICAgICAgYWRldi0+dmNuLmlw
X2R1bXAgPSBOVUxMOw0KPiArICAgICB9DQo+DQo+ICAgICAgIHJldHVybiByOw0KPiAgIH0NCg==
