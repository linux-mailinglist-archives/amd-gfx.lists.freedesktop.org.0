Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C72A3092B
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Feb 2025 11:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C4710E64F;
	Tue, 11 Feb 2025 10:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5NTIBCLr";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D7E10E64F
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Feb 2025 10:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkQ1WXLYkhuHT+y0+wCq2YAemBepK7EjWMEEbDw9/jfdBTq2FE6naWvQmCWz0iSX8MX4z1xSxyye0OwCi0widlzukwBkcc9fgMHVnQoLWldufiivvj0pa6QFtv4PcaC22W51pm236Fy0gOCGjKzMBtqCfYKvmac/CVtetyoq+fWmgQm/h0LdR1TADJnz0V6GFeADXFYbmhr35KV2/+n9kAU2tJnJwYLnO4rcXwP7pxUX2it6N0dIUklAZTPsyVsrIitYK1m/X2z3CLkekmdfOJDZNYtjZxdmQAByCukxP66j4+UIu6HT1XXnJimYuE3r5wrvNtvIcYmerj7npuKMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JM9n1rjyLXUcqRkEyLpN9TnbM8t2ESOCN8lACn9/oc=;
 b=kzQVch9old5czaeJSphNLlb2+YFi9cA3CZPo1AZzPHeNMPpTW/1SDwMqsczsndmqKXAiYuIRa8GlJaxJVetpaEoRxOoQ0qrQR/RU1HVFDpuzLMs+XklPtMY2STpfjTV/mgQDroZD3g0CXJ3SiyhAxuggp43/EUafc9hoXQyrFN7YmjfU4z/acq0A4eX6MZyIZ9pcQlBwwmRC6tqrP76y4AkYZ/q6BFdmX+XopeUCt5F7ArINusJ3GJynu5lZKb3TH+RuHRq9XJlzrXlke20uPuNv37l7WfDXFHw716jT18qQS7v+ud+MBmgFXVDjAGrHTJovh6zMKTX3vXgFAKX2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JM9n1rjyLXUcqRkEyLpN9TnbM8t2ESOCN8lACn9/oc=;
 b=5NTIBCLr/FgpnW2SstoPLcJ0GtSJz5Z/R+iHXxBGQxEj37fCKdylYQeQGqXjGF/pyZ6rLX0s0VPWQPSAxvD86g8D7MXytNBjyE7SisccPFHRSsBAyJPF3S93Biy1CAAPS3tOdAxGGTLZbIkPOQ1FyHUzfhUzyAmOSOs/0AxZ9MU=
Received: from CO6PR12MB5411.namprd12.prod.outlook.com (2603:10b6:5:356::5) by
 PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Tue, 11 Feb
 2025 10:55:53 +0000
Received: from CO6PR12MB5411.namprd12.prod.outlook.com
 ([fe80::fa8f:8242:338b:869f]) by CO6PR12MB5411.namprd12.prod.outlook.com
 ([fe80::fa8f:8242:338b:869f%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 10:55:53 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Yang, Philip" <Philip.Yang@amd.com>, "Chen, Xiaogang"
 <Xiaogang.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Fix the deadlock in svm_range_restore_work
Thread-Topic: [PATCH] drm/amdkfd: Fix the deadlock in svm_range_restore_work
Thread-Index: AQHbeUsLw+x9TIpBREG7nHPj+Rk5d7M8uSQggAMYJQCAAAugkIABTcYAgABC0JA=
Date: Tue, 11 Feb 2025 10:55:53 +0000
Message-ID: <CO6PR12MB54117113A866F8DC26466CAE8FFD2@CO6PR12MB5411.namprd12.prod.outlook.com>
References: <20250207102823.1565467-1-Emily.Deng@amd.com>
 <PH0PR12MB541778A52306F3BF717609018FF02@PH0PR12MB5417.namprd12.prod.outlook.com>
 <841a21b8-b0b6-48a9-af2d-62b51d5d6a1b@amd.com>
 <PH0PR12MB54174DCAA0C2AF44C320C1098FF22@PH0PR12MB5417.namprd12.prod.outlook.com>
 <6c888bc6-a942-b608-3302-4c37374f76f8@amd.com>
In-Reply-To: <6c888bc6-a942-b608-3302-4c37374f76f8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=c541fd44-18a7-445c-872f-b58113a35194;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-11T02:52:52Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5411:EE_|PH7PR12MB9073:EE_
x-ms-office365-filtering-correlation-id: da1e2e9f-929b-485b-c3f9-08dd4a8aa773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZDJFdmpqdEJtVys0WmJ5aHFheVNOYWZpZnF0dDN3VWh0SUZxUERmZjVwSXBS?=
 =?utf-8?B?eXdSbzgvclZQQ0RpSGdJNHhPVVRscDlsMWtBaE9UZW4zMEsyNjh4TU5rUE1q?=
 =?utf-8?B?anV3NDhSNDZDZlRONXRqU0dMNHlmQStCNVQ5TWtaT0JUMnJTWVRoaERrZHZX?=
 =?utf-8?B?eWl2QnduR0FUQnN0Ry8wZEtGWEUrc3k4d0xKRDVDQTkxcmVmTmFaVVFPaGV1?=
 =?utf-8?B?NnJiRDRsajQvVk5Qb0FycXFFMjBCS3Y5TzNVMEp2UWpqRVFab0s2OGtSeEh5?=
 =?utf-8?B?M2huWm5VYXJXUDJGNVgvV29nUFBKNXg4M1preitGdWpxVjNuTUN1Q3hoMGhs?=
 =?utf-8?B?OXgvSXZhVXgwbEc0RDhWMFl0dE93Q2dueGdhNy9Cdzh4SlQrMGtiY2JMN1VT?=
 =?utf-8?B?R0VZTEhLVzBNU2pGZnB2L3BLUTJrWkM3SDdacEIrVncwS3pCR0w0TnRMWU9P?=
 =?utf-8?B?ZlVDdEovY1hhQUpWNmZoeTU5WG5KSzNlR2NvUDdVVW9VczkxZDVTQXhFSERq?=
 =?utf-8?B?TCtsbXE4TzZ6VHJaT3cwcmszWklWclRuSWRHMitNTHBHSDRkMDljMzBiM2or?=
 =?utf-8?B?K213dXh3a0FDWXYyVDRYWktzNFJoUWxyYjM0MzhMZ0xsYzhtRHFhaXJFc1NN?=
 =?utf-8?B?ejM4VHZ2U2tGQ1paY0hTMmlpTC9ZaEUyZEU5czF0SFdQZzMzb21RdEN4VUZD?=
 =?utf-8?B?aWl4U3dhMGQvVlgrYXV1dlN3dnBQbTFFcklTN3F4czJxN05aaEQ2c2VkWVYy?=
 =?utf-8?B?MWgrTHdLdUVidE9udkM1OWFscVBjNFgrd3NTbkFhZ2hxaVBZaVVZd01vWFRH?=
 =?utf-8?B?c2RSYVF0VGFOaEZrbWtGYXloVVNYRHVNbEZ0Q0JHYkZGeFdOSUl3MllBenJo?=
 =?utf-8?B?N1JFUHU0b1RZMVB6ek80UjFDTnpQUUpSNk5OV0k1amJwWHVRUGlTbkJCaTg0?=
 =?utf-8?B?Yk1NRUVEaHkwOC9INC9rcWJZSXAzb1JCbDFRVitqUkp6cnI4S0dyTDdEdXM3?=
 =?utf-8?B?VGpXaXgzbWR4RTVoRXBRUmJPdUVjWkE0UG91bHRKUW00Q1NIRDM5TWRONnZE?=
 =?utf-8?B?QytFSEZnNFBkWXFaQzhOVklreVhuank4NVA5ZTdoSjFkV1A2ZWpqd1g5TDlU?=
 =?utf-8?B?NXpSUTJkTitDTVdITmVoTytaV051ejM5T1B1alVTWGRXaEJZRzI4Mmt1bXZ1?=
 =?utf-8?B?L0lHRERZRTh2VDZZSTBoTUc3TWt0OFZTYzFwbzBrOThDaDcvdzFiOVlpYzZr?=
 =?utf-8?B?cHFwTHZYbkJUTVF4Q0N0VnV0QlV6NHg4RnNEY0g4K3l4Z2NJa3lqYlNYeitE?=
 =?utf-8?B?bVNVcEgwc1huNGUyRlJRZGpFVDl2ZFpDUWZXelNjN2kzaldGL0ZVa2huaVZ4?=
 =?utf-8?B?a1ByMjBiYjk2Mk5MYlZtL0h3VCtmUUNNYzYvWVdjSzFEVnpNSVRtVVdROGVi?=
 =?utf-8?B?MysxR3BZeTFkN3QzelRmTUx3Mm9ISzdyRjBSdjBuakFKMU52bU9uZERtbzNO?=
 =?utf-8?B?QzFKViswWFppT0N1bVhJSHNCZXhDVmJIWHd0SzdGdW1mRW14OElHeE5KZHIr?=
 =?utf-8?B?bHRYazRuVmpaMU5DT3F3elc0QzhqaWlBZUNuNGtFTWIzTG9KRHNUWDJLTWMv?=
 =?utf-8?B?R1VtZXJGWDdFa3doK0dHYzhDQ1B0YmVnNlhzWnpLMndnRnpzZUlTSnlYTlAy?=
 =?utf-8?B?dE4xWitGOEwzbW9PNC9KNlNtUkF3M0ZPUVlSOXBUZHVjSDFWNldpMDhTTjV1?=
 =?utf-8?B?RVFEcm9acUZYYjA1YnZCRzV3b0lQcEQ5TTN5VnlEWGlFNThGTUw3b2FlL0tj?=
 =?utf-8?B?VVNrNnRhbFV5dG1oRisxOHhWVTZEaVc1RmNGMWNJaWZYS0FvTk9PdmFseHFX?=
 =?utf-8?B?OHJaeU91YVRzaEg4bnc3U25iaXJzaU5YK0s5bTBXQXVIaURPQWh3OVZERGxB?=
 =?utf-8?Q?ajI747jhShClbbQ/0dW+m91IyAJV2B08?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5411.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnE1dFZROUdQdEkrWjltMmlyeGsxY3h3aUdLenNHUWVhR0RaQWo2T2czSVZp?=
 =?utf-8?B?M3BPbmpLWTEweGpldmhyd0dxOWtnNWlYN2hWcnVvME5uMFFHYmVRZVRGK2Nl?=
 =?utf-8?B?N3lkbFF4TVZ2eE42bmh2MEk4cXFwZlNDSTJKWEV3NHNheWlrN1pkMkVvS2d2?=
 =?utf-8?B?cFU2REM3Y2JMckdJYW1ucW1pczZyMFlJVExpZUZkaTVGYlRUcVIyZi9RbUhi?=
 =?utf-8?B?WjFIbGxHeGljMFJXcHR1czdBUzlmb3NIYm9jRWVETUphZnlHU3ZReVNjc2pl?=
 =?utf-8?B?OWpwRjVpeGJTR0VSRXhHaUZwREZVRk5iTEU4My9XbitTWEJ5UEk4aW10V2dD?=
 =?utf-8?B?REloTTJDWUVPZ09TeVhOS0FvMEgva2lNWTJYdjJpOEZETlcrc3dwY0ZZK1pP?=
 =?utf-8?B?djBXbngwUFRYVE8wZ1dBKyttNkNRdmZIbFozd25ydi8rYS9FU2pOY2NjanlW?=
 =?utf-8?B?b1hCTXdLS3FGaGx1OXNwZEg3K3ZUaXhLNGRGZDc1VTk1TG9SQlNZaHJIZ3pI?=
 =?utf-8?B?U3MwdlNmNG50NDRSdnhIZDFLb3JRZTBLcVZNa0Z1cE5Ga2hMdTZBRHNDNDZj?=
 =?utf-8?B?NG5XbHQxVDBtazhpMzBVMzIzTDVTTmN3MTdrOVRYdE5ZVkRBVUFnb29rMWpx?=
 =?utf-8?B?bDIyUWVpQnJFRWtDVEFpOGRvZUI1Q3JQVGtONjhCNm1VQkQ3cDNpaXN0cDBG?=
 =?utf-8?B?MkdTeGUzK2laWjdpL2lncXpwRVlnVlMyaWk2WExIbUNJMzBBSDNDeGlYWjdw?=
 =?utf-8?B?UDZ1UGlNWUJCMDlpS01VUkhxWHF0UWtGVktsSVQvMWdFVm9DRmdISDFHeHBN?=
 =?utf-8?B?M05PNWE0R0FtWlA4SUJQUEczOVZYQmMyODl0UTIvMkJtZDhzbTJra0xPVlhB?=
 =?utf-8?B?ZEZVeHZuQ1NVV1N3MnltM0VTSVk5YUJ3d3NkSzhRQWVpTVV5eXNhTHdNT3Rq?=
 =?utf-8?B?ZG9xWGhHOGRkZWl5aE9qWVZPYW0vb3dna2I5aXZIV0RUWnpicUN1RnNXMmVG?=
 =?utf-8?B?NXJheW44SGg1Vm0ySGxRZ3o3L3J3cVhVWUo1d0RoOEc0UFdXY3JqVDdNTnlP?=
 =?utf-8?B?VVpqTU9iQjVVNnNuVXpVQmtvQk1YRUE0UE5hNm5uOWtUek9LWC9Xa0JxZnRV?=
 =?utf-8?B?a1NxU3Ztd0Fmdllya2Jaam50Slg1U1ZhRnJXSXg2NGtjckw3RkNJMkNDUDI1?=
 =?utf-8?B?QkFPcThyblpRdFg4N21JTUxFY2Fwamo0VW1uamd4a2dkek1vaXNKZlkraHNX?=
 =?utf-8?B?enpmdEJFV2RxOFprbHY4NzFUV3lUK2d1MDJrQklBZkJkVFNBd2dINnRmS3Z4?=
 =?utf-8?B?QTAxdWdnT0drRTh5Uit0L2pvdHJKYTJCSncvczBFTlNONmhiNnBVU0dFczhx?=
 =?utf-8?B?TXM2cWxqakgxZUp1VHU3TnVKeTlMNEw0eVRuUTdHVUJXODQwc0g3TGxKSUh1?=
 =?utf-8?B?dXAzOHVLUVFKeXdIZFpsanhLdWtuYVQ2NkVQemMvMmNpcWhmYlY4Q0U4cWFS?=
 =?utf-8?B?VjBzR2U4Z29zZXowZXB3TDQweUZUQkhHZmpHOTExVFJiaW12bGxjQ2VVNEpK?=
 =?utf-8?B?L3I4WldDTnJpTjk0bE1EL2VmT3Q5blU2TzB4VkJVSnV2QnFGZmVWNWpIbFU5?=
 =?utf-8?B?anh0Q3F1eFVGWURQeWNYMHM1OThyOHRTSFJDTkhVWmg5UnV4cW1sOTlkVVM5?=
 =?utf-8?B?MmJiNTA2WXkxWmczeFRqOGVEZDAvcS9LSG9MNzVUN2hOV0NMZ1lPQUw0UzVG?=
 =?utf-8?B?Mm16S1QvTU0yVnVsa0hGZ2QzcHg5KzVwYmgzQXhCcnN1TmZGZmNIOURiSUVt?=
 =?utf-8?B?Zzh6bm8xM05laEFNQ3J6NXJvNGZEL3VVb3ZmRDg2ZmdyMk1VVHhDUXc3Z1Vr?=
 =?utf-8?B?dk9EaUdMcE1jY3ZncWUvZ1VjbkxCQ09BdTNERmlpc2V3a2dIbEFsdm4zTHBT?=
 =?utf-8?B?a2tZVEVnMTNkT1lPY2ZkZFpWZkc5d3htck4zdm9JV1pCQm9NUDRrYm05eXNN?=
 =?utf-8?B?MTBjK1FwL0JyQ2p6Z0x5WElhTm9pTDJaTnltK2ZOSzhFL2pYaElXRjhTZW1U?=
 =?utf-8?B?bWhMM1BVQlo5K0pqSFIzWlF1c3AzdEw1S3BFYTRaT0ZJV1NaWGdRMTFDSnNl?=
 =?utf-8?Q?gZ5E=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB54117113A866F8DC26466CAE8FFD2CO6PR12MB5411namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5411.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1e2e9f-929b-485b-c3f9-08dd4a8aa773
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 10:55:53.1287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jqoCGPbC64e/RFX4J8dPSi0D0InF26hosP+xsbgwEeo8xn1NVgKrQ63LDbkW6Dm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073
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

--_000_CO6PR12MB54117113A866F8DC26466CAE8FFD2CO6PR12MB5411namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KDQoNCkZyb206IFlhbmcsIFBoaWxpcCA8UGhpbGlwLllhbmdAYW1kLmNvbT4NClNlbnQ6IFR1
ZXNkYXksIEZlYnJ1YXJ5IDExLCAyMDI1IDY6NTQgQU0NClRvOiBEZW5nLCBFbWlseSA8RW1pbHku
RGVuZ0BhbWQuY29tPjsgQ2hlbiwgWGlhb2dhbmcgPFhpYW9nYW5nLkNoZW5AYW1kLmNvbT47IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1k
a2ZkOiBGaXggdGhlIGRlYWRsb2NrIGluIHN2bV9yYW5nZV9yZXN0b3JlX3dvcmsNCg0KDQoNCk9u
IDIwMjUtMDItMTAgMDI6NTEsIERlbmcsIEVtaWx5IHdyb3RlOg0KDQpbQU1EIE9mZmljaWFsIFVz
ZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQoNCltBTUQgT2ZmaWNp
YWwgVXNlIE9ubHkgLSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQoNCg0KDQpGcm9t
OiBDaGVuLCBYaWFvZ2FuZyA8WGlhb2dhbmcuQ2hlbkBhbWQuY29tPjxtYWlsdG86WGlhb2dhbmcu
Q2hlbkBhbWQuY29tPg0KU2VudDogTW9uZGF5LCBGZWJydWFyeSAxMCwgMjAyNSAxMDoxOCBBTQ0K
VG86IERlbmcsIEVtaWx5IDxFbWlseS5EZW5nQGFtZC5jb20+PG1haWx0bzpFbWlseS5EZW5nQGFt
ZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1ka2ZkOiBGaXgg
dGhlIGRlYWRsb2NrIGluIHN2bV9yYW5nZV9yZXN0b3JlX3dvcmsNCg0KDQoNCk9uIDIvNy8yMDI1
IDk6MDIgUE0sIERlbmcsIEVtaWx5IHdyb3RlOg0KDQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0g
QU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQoNCg0KW0FNRCBPZmZpY2lhbCBVc2Ug
T25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0NCg0KDQoNClBpbmcuLi4uLi4u
DQoNCg0KDQpFbWlseSBEZW5nDQoNCkJlc3QgV2lzaGVzDQoNCg0KDQoNCg0KDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQoNCkZyb206IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNv
bT48bWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbT4NCg0KU2VudDogRnJpZGF5LCBGZWJydWFyeSA3
LCAyMDI1IDY6MjggUE0NCg0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPG1haWx0
bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCg0KQ2M6IERlbmcsIEVtaWx5IDxFbWls
eS5EZW5nQGFtZC5jb20+PG1haWx0bzpFbWlseS5EZW5nQGFtZC5jb20+DQoNClN1YmplY3Q6IFtQ
QVRDSF0gZHJtL2FtZGtmZDogRml4IHRoZSBkZWFkbG9jayBpbiBzdm1fcmFuZ2VfcmVzdG9yZV93
b3JrDQoNCg0KDQpJdCB3aWxsIGhpdCBkZWFkbG9jayBpbiBzdm1fcmFuZ2VfcmVzdG9yZV93b3Jr
IHJhbWRvbmx5Lg0KDQpEZXRhaWwgYXMgYmVsb3c6DQoNCjEuc3ZtX3JhbmdlX3Jlc3RvcmVfd29y
aw0KDQogICAgICAtPnN2bV9yYW5nZV9saXN0X2xvY2tfYW5kX2ZsdXNoX3dvcmsNCg0KICAgICAg
LT5tbWFwX3dyaXRlX2xvY2sNCg0KMi5zdm1fcmFuZ2VfcmVzdG9yZV93b3JrDQoNCiAgICAgIC0+
c3ZtX3JhbmdlX3ZhbGlkYXRlX2FuZF9tYXANCg0KICAgICAgLT5hbWRncHVfdm1fdXBkYXRlX3Jh
bmdlDQoNCiAgICAgIC0+YW1kZ3B1X3ZtX3B0ZXNfdXBkYXRlDQoNCiAgICAgIC0+YW1kZ3B1X3Zt
X3B0X2FsbG9jDQoNCiAgICAgIC0+c3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXINCg0Kc3Zt
X3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXIgaXMgYSBmdW5jdGlvbiBydW5uaW5nIGJ5IGEga2Vy
bmVsIHRhc2sgZnJvbSBkZWZhdWx0IHN5c3RlbV93cS4gSXQgaXMgbm90IHRoZSB0YXNrIHRoYXQg
cnVucyBzdm1fcmFuZ2VfcmVzdG9yZV93b3JrIHdoaWNoIGlzIGZyb20gc3lzdGVtX2ZyZWV6YWJs
ZV93cS4gVGhlIHNlY29uZCB0YXNrIG1heSBuZWVkIHdhaXQgdGhlIGZpcnN0IHRhc2sgdG8gcmVs
ZWFzZSBtbWFwX3dyaXRlX2xvY2ssIGJ1dCB0aGVyZSBpcyBubyBjeWNsZSBsb2NrIGRlcGVuZGVu
Y3kuDQoNCkNhbiB5b3UgZXhwbGFpbiBtb3JlIGhvdyBkZWFkbG9jayBoYXBwZW5lZD8gSWYgYSBk
ZWFkbG9jayBleGlzdHMgYmV0d2VlbiB0d28gdGFza3MgdGhlcmUgYXJlIHNob3VsZCBiZSBhdCBs
ZWFzdCB0d28gbG9ja3MgdXNlZCBieSBib3RoIHRhc2tzLg0KDQpSZWdhcmRzDQoNClhpYW9nYW5n
DQoNCkluIFN0ZXAgMiwgZHVyaW5nIHRoZSBhbWRncHVfdm1fcHRfYWxsb2MgcHJvY2VzcywgdGhl
IHN5c3RlbSBlbmNvdW50ZXJzIGluc3VmZmljaWVudCBtZW1vcnkgYW5kIHRyaWdnZXJzIGFuIGV2
aWN0aW9uLiBUaGlzIGluaXRpYXRlcyB0aGUgc3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXIg
dGFzaywgYW5kIHdhaXRzIGZvciB0aGUgZXZpY3Rpb25fZmVuY2UgdG8gYmUgc2lnbmFsZWQuIEhv
d2V2ZXIsIHRoZSBzdm1fcmFuZ2VfZXZpY3Rfc3ZtX2JvX3dvcmtlciBjYW5ub3QgYWNxdWlyZSB0
aGUgbW1hcF9yZWFkX2xvY2sobW0pLCBwcmV2ZW50aW5nIGl0IGZyb20gc2lnbmFsaW5nIHRoZSBl
dmljdGlvbl9mZW5jZS4gQXMgYSByZXN1bHQsIGFtZGdwdV92bV9wdF9hbGxvYyByZW1haW5zIGlu
Y29tcGxldGUgYW5kIGNhbm5vdCByZWxlYXNlIHRoZSBtbWFwX3dyaXRlX2xvY2sobW0pLg0KDQpX
aGljaCBtZWFucyB0aGUgc3ZtX3JhbmdlX3Jlc3RvcmVfd29yayB0YXNrIGhvbGRzIHRoZSBtbWFw
X3dyaXRlX2xvY2sobW0pIGFuZCBpcyBzdHVjayB3YWl0aW5nIGZvciB0aGUgZXZpY3Rpb25fZmVu
Y2UgdG8gYmUgc2lnbmFsZWQgYnkgc3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXIuIEhvd2V2
ZXIsIHN2bV9yYW5nZV9ldmljdF9zdm1fYm9fd29ya2VyIGlzIGl0c2VsZiBibG9ja2VkLCB1bmFi
bGUgdG8gYWNxdWlyZSB0aGUgbW1hcF9yZWFkX2xvY2sobW0pLiBUaGlzIGNyZWF0ZXMgYSBkZWFk
bG9jay4NCg0KVGhlIGRlYWRsb2NrIHNpdHVhdGlvbiBzaG91bGQgbm90IGhhcHBlbiBhcyBzdm1f
cmFuZ2VfcmVzdG9yZV93b3JrIGlzIG9ubHkgdXNlZCBmb3IgeG5hY2sgb2ZmIGNhc2UsIHRoZXJl
IGlzIG5vIFZSQU0gb3ZlciBjb21taXRtZW50IHdpdGggS0ZEIGFtZGdwdV9hbWRrZmRfcmVzZXJ2
ZV9tZW1fbGltaXQuIFdlIHJlc2VydmVkIFZSQU0gRVNUSU1BVEVfUFRfU0laRSBmb3IgcGFnZSB0
YWJsZSBhbGxvY2F0aW9uIHRvIHByZXZlbnQgdGhpcyBzaXR1YXRpb24uDQoNClJlZ2FyZHMsDQoN
ClBoaWxpcA0KSGkgUGhpbGlwLA0KICAgICBZb3UncmUgY29ycmVjdC4gVXBvbiBmdXJ0aGVyIGlu
dmVzdGlnYXRpb24sIHRoZSBpc3N1ZSBhcmlzZXMgZnJvbSB0aGUgYWRkaXRpb25hbCBjYWxsIHRv
IGFtZGdwdV9hbWRrZmRfdW5yZXNlcnZlX21lbV9saW1pdCBpbiBzdm1fbWlncmF0ZV9yYW1fdG9f
dnJhbSwgd2hpY2ggcHJldmVudHMgYW1kZ3B1X2FtZGtmZF9yZXNlcnZlX21lbV9saW1pdCBmcm9t
IGRldGVjdGluZyB0aGUgb3V0LW9mLW1lbW9yeSBjb25kaXRpb24uIEkgd2lsbCBzdWJtaXQgYW5v
dGhlciBwYXRjaCB0byByZW1vdmUgdGhlIGFtZGdwdV9hbWRrZmRfdW5yZXNlcnZlX21lbV9saW1p
dCBjYWxsIGluIHN2bV9taWdyYXRlX3JhbV90b192cmFtLg0KDQpFbWlseSBEZW5nDQpCZXN0IFdp
c2hlcw0KDQoNCg0KDQpFbWlseSBEZW5nDQpCZXN0IFdpc2hlcw0KDQoNCg0KDQogICAgICAtPm1t
YXBfcmVhZF9sb2NrKGRlYWRsb2NrIGhlcmUsIGJlY2F1c2UgYWxyZWFkeSBnZXQgbW1hcF93cml0
ZV9sb2NrKQ0KDQoNCg0KSG93IHRvIGZpeD8NCg0KRG93bmdyYWRlIHRoZSB3cml0ZSBsb2NrIHRv
IHJlYWQgbG9jay4NCg0KDQoNClNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRlbmdA
YW1kLmNvbT48bWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbT4NCg0KLS0tDQoNCmRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYyB8IDMgKystDQoNCjEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMNCg0KYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfc3ZtLmMNCg0KaW5kZXggYmQzZTIwZDk4MWUwLi5jOTA3ZTJkZTNkZGUgMTAwNjQ0DQoN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYw0KDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfc3ZtLmMNCg0KQEAgLTE4NDEsNiArMTg0MSw3IEBA
IHN0YXRpYyB2b2lkIHN2bV9yYW5nZV9yZXN0b3JlX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0DQoN
Cip3b3JrKQ0KDQogICAgICBtdXRleF9sb2NrKCZwcm9jZXNzX2luZm8tPmxvY2spOw0KDQogICAg
ICBzdm1fcmFuZ2VfbGlzdF9sb2NrX2FuZF9mbHVzaF93b3JrKHN2bXMsIG1tKTsNCg0KICAgICAg
bXV0ZXhfbG9jaygmc3Ztcy0+bG9jayk7DQoNCisgICAgICBtbWFwX3dyaXRlX2Rvd25ncmFkZSht
bSk7DQoNCg0KDQogICAgICBldmljdGVkX3JhbmdlcyA9IGF0b21pY19yZWFkKCZzdm1zLT5ldmlj
dGVkX3Jhbmdlcyk7DQoNCg0KDQpAQCAtMTg5MCw3ICsxODkxLDcgQEAgc3RhdGljIHZvaWQgc3Zt
X3JhbmdlX3Jlc3RvcmVfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QNCg0KKndvcmspDQoNCg0KDQpv
dXRfcmVzY2hlZHVsZToNCg0KICAgICAgbXV0ZXhfdW5sb2NrKCZzdm1zLT5sb2NrKTsNCg0KLSAg
ICAgIG1tYXBfd3JpdGVfdW5sb2NrKG1tKTsNCg0KKyAgICAgIG1tYXBfcmVhZF91bmxvY2sobW0p
Ow0KDQogICAgICBtdXRleF91bmxvY2soJnByb2Nlc3NfaW5mby0+bG9jayk7DQoNCg0KDQogICAg
ICAvKiBJZiB2YWxpZGF0aW9uIGZhaWxlZCwgcmVzY2hlZHVsZSBhbm90aGVyIGF0dGVtcHQgKi8N
Cg0KLS0NCg0KMi4zNC4xDQoNCg0K

--_000_CO6PR12MB54117113A866F8DC26466CAE8FFD2CO6PR12MB5411namp_
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
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6QXB0b3M7fQ0KQGZv
bnQtZmFjZQ0KCXtmb250LWZhbWlseTpDb25zb2xhczsNCglwYW5vc2UtMToyIDExIDYgOSAyIDIg
NCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQERlbmdYaWFuIjsNCglwYW5v
c2UtMToyIDEgNiAwIDMgMSAxIDEgMSAxO30NCi8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1z
b05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47DQoJZm9u
dC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQXB0b3MiLHNhbnMtc2VyaWY7fQ0KYTpsaW5r
LCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1
ZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnByZQ0KCXttc28tc3R5bGUtcHJpb3Jp
dHk6OTk7DQoJbXNvLXN0eWxlLWxpbms6IkhUTUwgUHJlZm9ybWF0dGVkIENoYXIiOw0KCW1hcmdp
bjowaW47DQoJZm9udC1zaXplOjEwLjBwdDsNCglmb250LWZhbWlseToiQ291cmllciBOZXciO30N
CnNwYW4uSFRNTFByZWZvcm1hdHRlZENoYXINCgl7bXNvLXN0eWxlLW5hbWU6IkhUTUwgUHJlZm9y
bWF0dGVkIENoYXIiOw0KCW1zby1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28tc3R5bGUtbGluazoi
SFRNTCBQcmVmb3JtYXR0ZWQiOw0KCWZvbnQtZmFtaWx5OkNvbnNvbGFzO30NCnNwYW4uRW1haWxT
dHlsZTIyDQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJB
cmlhbCIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJ
e21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7DQoJbXNvLWxp
Z2F0dXJlczpub25lO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsN
CgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtw
YWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0K
PG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwh
W2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9
ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlv
dXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0i
Ymx1ZSIgdmxpbms9InB1cnBsZSIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxwIHN0
eWxlPSJmb250LWZhbWlseTpDYWxpYnJpO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFy
Z2luOjVwdDtmb250LXN0eWxlOm5vcm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0
aW9uOm5vbmU7IiBhbGlnbj0iTGVmdCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIElu
dGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XTxicj4NCjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2IGNs
YXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fu
cy1zZXJpZiI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVy
Om5vbmU7Ym9yZGVyLWxlZnQ6c29saWQgYmx1ZSAxLjVwdDtwYWRkaW5nOjBpbiAwaW4gMGluIDQu
MHB0Ij4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNF
MUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYi
PiBZYW5nLCBQaGlsaXAgJmx0O1BoaWxpcC5ZYW5nQGFtZC5jb20mZ3Q7DQo8YnI+DQo8Yj5TZW50
OjwvYj4gVHVlc2RheSwgRmVicnVhcnkgMTEsIDIwMjUgNjo1NCBBTTxicj4NCjxiPlRvOjwvYj4g
RGVuZywgRW1pbHkgJmx0O0VtaWx5LkRlbmdAYW1kLmNvbSZndDs7IENoZW4sIFhpYW9nYW5nICZs
dDtYaWFvZ2FuZy5DaGVuQGFtZC5jb20mZ3Q7OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zzxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW1BBVENIXSBkcm0vYW1ka2ZkOiBGaXggdGhlIGRl
YWRsb2NrIGluIHN2bV9yYW5nZV9yZXN0b3JlX3dvcms8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8cD48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5P
biAyMDI1LTAyLTEwIDAyOjUxLCBEZW5nLCBFbWlseSB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbi10b3A6NS4wcHQ7bWFyZ2luLWJvdHRvbTo1
LjBwdCI+DQo8cCBzdHlsZT0ibWFyZ2luOjUuMHB0Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEw
LjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Ymx1
ZSI+W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25s
eV08bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBzdHlsZT0ibWFyZ2luOjUuMHB0Ij48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2Vy
aWY7Y29sb3I6Ymx1ZSI+W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0
cmlidXRpb24gT25seV08bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90Oyxz
YW5zLXNlcmlmIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlh
bCZxdW90OyxzYW5zLXNlcmlmIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8ZGl2IHN0
eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCBibHVlIDEuNXB0O3BhZGRpbmc6MGlu
IDBpbiAwaW4gNC4wcHQiPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10
b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFt
aWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDss
c2Fucy1zZXJpZiI+IENoZW4sIFhpYW9nYW5nDQo8YSBocmVmPSJtYWlsdG86WGlhb2dhbmcuQ2hl
bkBhbWQuY29tIj4mbHQ7WGlhb2dhbmcuQ2hlbkBhbWQuY29tJmd0OzwvYT4gPGJyPg0KPGI+U2Vu
dDo8L2I+IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjUgMTA6MTggQU08YnI+DQo8Yj5Ubzo8L2I+
IERlbmcsIEVtaWx5IDxhIGhyZWY9Im1haWx0bzpFbWlseS5EZW5nQGFtZC5jb20iPiZsdDtFbWls
eS5EZW5nQGFtZC5jb20mZ3Q7PC9hPjsNCjxhIGhyZWY9Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyI+YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8L2E+PGJyPg0KPGI+
U3ViamVjdDo8L2I+IFJlOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IEZpeCB0aGUgZGVhZGxvY2sgaW4g
c3ZtX3JhbmdlX3Jlc3RvcmVfd29yazwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwPiZuYnNw
OzxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk9uIDIvNy8yMDI1
IDk6MDIgUE0sIERlbmcsIEVtaWx5IHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8Ymxv
Y2txdW90ZSBzdHlsZT0ibWFyZ2luLXRvcDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxw
cmU+W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25s
eV08bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5b
QU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XTxv
OnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPlBpbmcu
Li4uLi4uPG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7PG86cD48L286cD48L3ByZT4NCjxw
cmU+RW1pbHkgRGVuZzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPkJlc3QgV2lzaGVzPG86cD48L286
cD48L3ByZT4NCjxwcmU+Jm5ic3A7PG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7PG86cD48
L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7PG86cD48L286cD48L3ByZT4NCjxibG9ja3F1b3RlIHN0
eWxlPSJtYXJnaW4tdG9wOjUuMHB0O21hcmdpbi1ib3R0b206NS4wcHQiPg0KPHByZT4tLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPkZyb206IEVtaWx5IERl
bmcgPGEgaHJlZj0ibWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbSI+Jmx0O0VtaWx5LkRlbmdAYW1k
LmNvbSZndDs8L2E+PG86cD48L286cD48L3ByZT4NCjxwcmU+U2VudDogRnJpZGF5LCBGZWJydWFy
eSA3LCAyMDI1IDY6MjggUE08bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5UbzogPGEgaHJlZj0ibWFp
bHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIj5hbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzwvYT48bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5DYzogRGVuZywgRW1pbHkgPGEgaHJl
Zj0ibWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbSI+Jmx0O0VtaWx5LkRlbmdAYW1kLmNvbSZndDs8
L2E+PG86cD48L286cD48L3ByZT4NCjxwcmU+U3ViamVjdDogW1BBVENIXSBkcm0vYW1ka2ZkOiBG
aXggdGhlIGRlYWRsb2NrIGluIHN2bV9yYW5nZV9yZXN0b3JlX3dvcms8bzpwPjwvbzpwPjwvcHJl
Pg0KPHByZT4mbmJzcDs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5JdCB3aWxsIGhpdCBkZWFkbG9j
ayBpbiBzdm1fcmFuZ2VfcmVzdG9yZV93b3JrIHJhbWRvbmx5LjxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPkRldGFpbCBhcyBiZWxvdzo8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4xLnN2bV9yYW5nZV9y
ZXN0b3JlX3dvcms8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsgLSZndDtzdm1fcmFuZ2VfbGlzdF9sb2NrX2FuZF9mbHVzaF93b3JrPG86cD48L286
cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0mZ3Q7bW1hcF93
cml0ZV9sb2NrPG86cD48L286cD48L3ByZT4NCjxwcmU+Mi5zdm1fcmFuZ2VfcmVzdG9yZV93b3Jr
PG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0m
Z3Q7c3ZtX3JhbmdlX3ZhbGlkYXRlX2FuZF9tYXA8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLSZndDthbWRncHVfdm1fdXBkYXRlX3JhbmdlPG86
cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0mZ3Q7
YW1kZ3B1X3ZtX3B0ZXNfdXBkYXRlPG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0mZ3Q7YW1kZ3B1X3ZtX3B0X2FsbG9jPG86cD48L286cD48L3By
ZT4NCjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0mZ3Q7c3ZtX3JhbmdlX2V2
aWN0X3N2bV9ib193b3JrZXI8bzpwPjwvbzpwPjwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPC9ibG9j
a3F1b3RlPg0KPHA+c3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXIgaXMgYSBmdW5jdGlvbiBy
dW5uaW5nIGJ5IGEga2VybmVsIHRhc2sgZnJvbSBkZWZhdWx0IHN5c3RlbV93cS4gSXQgaXMgbm90
IHRoZSB0YXNrIHRoYXQgcnVucyBzdm1fcmFuZ2VfcmVzdG9yZV93b3JrIHdoaWNoIGlzIGZyb20g
c3lzdGVtX2ZyZWV6YWJsZV93cS4gVGhlIHNlY29uZCB0YXNrIG1heSBuZWVkIHdhaXQgdGhlIGZp
cnN0IHRhc2sgdG8gcmVsZWFzZSBtbWFwX3dyaXRlX2xvY2ssIGJ1dA0KIHRoZXJlIGlzIG5vIGN5
Y2xlIGxvY2sgZGVwZW5kZW5jeS48bzpwPjwvbzpwPjwvcD4NCjxwPkNhbiB5b3UgZXhwbGFpbiBt
b3JlIGhvdyBkZWFkbG9jayBoYXBwZW5lZD8gSWYgYSBkZWFkbG9jayBleGlzdHMgYmV0d2VlbiB0
d28gdGFza3MgdGhlcmUgYXJlIHNob3VsZCBiZSBhdCBsZWFzdCB0d28gbG9ja3MgdXNlZCBieSBi
b3RoIHRhc2tzLjxvOnA+PC9vOnA+PC9wPg0KPHA+UmVnYXJkczxvOnA+PC9vOnA+PC9wPg0KPHAg
c3R5bGU9Im1hcmdpbi1sZWZ0OjExLjBwdCI+WGlhb2dhbmcgPG86cD48L286cD48L3A+DQo8cCBz
dHlsZT0ibWFyZ2luLWxlZnQ6NS41cHQiPkluIFN0ZXAgMiwgZHVyaW5nIHRoZSZuYnNwO2FtZGdw
dV92bV9wdF9hbGxvYyZuYnNwO3Byb2Nlc3MsIHRoZSBzeXN0ZW0gZW5jb3VudGVycyBpbnN1ZmZp
Y2llbnQgbWVtb3J5IGFuZCB0cmlnZ2VycyBhbiBldmljdGlvbi4gVGhpcyBpbml0aWF0ZXMgdGhl
Jm5ic3A7c3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXImbmJzcDt0YXNrLCBhbmQgd2FpdHMg
Zm9yIHRoZSZuYnNwO2V2aWN0aW9uX2ZlbmNlJm5ic3A7dG8gYmUgc2lnbmFsZWQuIEhvd2V2ZXIs
DQogdGhlJm5ic3A7c3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXImbmJzcDtjYW5ub3QgYWNx
dWlyZSB0aGUmbmJzcDttbWFwX3JlYWRfbG9jayhtbSksIHByZXZlbnRpbmcgaXQgZnJvbSBzaWdu
YWxpbmcgdGhlJm5ic3A7ZXZpY3Rpb25fZmVuY2UuIEFzIGEgcmVzdWx0LCZuYnNwO2FtZGdwdV92
bV9wdF9hbGxvYyZuYnNwO3JlbWFpbnMgaW5jb21wbGV0ZSBhbmQgY2Fubm90IHJlbGVhc2UgdGhl
Jm5ic3A7bW1hcF93cml0ZV9sb2NrKG1tKS4NCjxvOnA+PC9vOnA+PC9wPg0KPHAgc3R5bGU9Im1h
cmdpbi1sZWZ0OjUuNXB0Ij5XaGljaCBtZWFucyB0aGUmbmJzcDtzdm1fcmFuZ2VfcmVzdG9yZV93
b3JrJm5ic3A7dGFzayBob2xkcyB0aGUmbmJzcDttbWFwX3dyaXRlX2xvY2sobW0pJm5ic3A7YW5k
IGlzIHN0dWNrIHdhaXRpbmcgZm9yIHRoZSZuYnNwO2V2aWN0aW9uX2ZlbmNlJm5ic3A7dG8gYmUg
c2lnbmFsZWQgYnkmbmJzcDtzdm1fcmFuZ2VfZXZpY3Rfc3ZtX2JvX3dvcmtlci4gSG93ZXZlciwm
bmJzcDtzdm1fcmFuZ2VfZXZpY3Rfc3ZtX2JvX3dvcmtlciZuYnNwO2lzIGl0c2VsZiBibG9ja2Vk
LCB1bmFibGUNCiB0byBhY3F1aXJlIHRoZSZuYnNwO21tYXBfcmVhZF9sb2NrKG1tKS4gVGhpcyBj
cmVhdGVzIGEgZGVhZGxvY2suPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+
DQo8L2Jsb2NrcXVvdGU+DQo8cD5UaGUgZGVhZGxvY2sgc2l0dWF0aW9uIHNob3VsZCBub3QgaGFw
cGVuIGFzIHN2bV9yYW5nZV9yZXN0b3JlX3dvcmsgaXMgb25seSB1c2VkIGZvciB4bmFjayBvZmYg
Y2FzZSwgdGhlcmUgaXMgbm8gVlJBTSBvdmVyIGNvbW1pdG1lbnQgd2l0aCBLRkQgYW1kZ3B1X2Ft
ZGtmZF9yZXNlcnZlX21lbV9saW1pdC4gV2UgcmVzZXJ2ZWQgVlJBTSBFU1RJTUFURV9QVF9TSVpF
IGZvciBwYWdlIHRhYmxlIGFsbG9jYXRpb24gdG8gcHJldmVudCB0aGlzIHNpdHVhdGlvbi48bzpw
PjwvbzpwPjwvcD4NCjxwPlJlZ2FyZHMsPG86cD48L286cD48L3A+DQo8cD5QaGlsaXA8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYiPkhpIFBoaWxpcCw8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlm
Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgWW91J3JlIGNvcnJlY3QuIFVwb24gZnVydGhlciBp
bnZlc3RpZ2F0aW9uLCB0aGUgaXNzdWUgYXJpc2VzIGZyb20gdGhlIGFkZGl0aW9uYWwgY2FsbCB0
byZuYnNwO2FtZGdwdV9hbWRrZmRfdW5yZXNlcnZlX21lbV9saW1pdCZuYnNwO2luJm5ic3A7c3Zt
X21pZ3JhdGVfcmFtX3RvX3ZyYW0sIHdoaWNoIHByZXZlbnRzJm5ic3A7YW1kZ3B1X2FtZGtmZF9y
ZXNlcnZlX21lbV9saW1pdCZuYnNwO2Zyb20NCiBkZXRlY3RpbmcgdGhlIG91dC1vZi1tZW1vcnkg
Y29uZGl0aW9uLiBJIHdpbGwgc3VibWl0IGFub3RoZXIgcGF0Y2ggdG8gcmVtb3ZlIHRoZSZuYnNw
O2FtZGdwdV9hbWRrZmRfdW5yZXNlcnZlX21lbV9saW1pdCZuYnNwO2NhbGwgaW4mbmJzcDtzdm1f
bWlncmF0ZV9yYW1fdG9fdnJhbS48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtB
cmlhbCZxdW90OyxzYW5zLXNlcmlmIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDttc28tbGlnYXR1
cmVzOnN0YW5kYXJkY29udGV4dHVhbCI+RW1pbHkgRGVuZzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O21zby1s
aWdhdHVyZXM6c3RhbmRhcmRjb250ZXh0dWFsIj5CZXN0IFdpc2hlczxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7
Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+PG86cD4mbmJzcDs8L286
cD48L3NwYW4+PC9wPg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbi10b3A6NS4wcHQ7bWFyZ2lu
LWJvdHRvbTo1LjBwdCI+DQo8ZGl2Pg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2Jv
cmRlci1sZWZ0OnNvbGlkIGJsdWUgMS41cHQ7cGFkZGluZzowaW4gMGluIDBpbiA0LjBwdCI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZh
bWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmIj4mbmJzcDs8L3NwYW4+PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dDttc28tbGlnYXR1cmVzOnN0YW5kYXJkY29udGV4dHVhbCI+RW1pbHkgRGVuZzwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0O21zby1saWdhdHVyZXM6c3RhbmRhcmRjb250ZXh0dWFsIj5CZXN0IFdpc2hlczwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1z
ZXJpZiI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+Jm5i
c3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbi10b3A6
NS4wcHQ7bWFyZ2luLWJvdHRvbTo1LjBwdCI+DQo8YmxvY2txdW90ZSBzdHlsZT0ibWFyZ2luLXRv
cDo1LjBwdDttYXJnaW4tYm90dG9tOjUuMHB0Ij4NCjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IC0mZ3Q7bW1hcF9yZWFkX2xvY2soZGVhZGxvY2sgaGVyZSwgYmVjYXVzZSBhbHJl
YWR5IGdldCBtbWFwX3dyaXRlX2xvY2spPG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7PG86
cD48L286cD48L3ByZT4NCjxwcmU+SG93IHRvIGZpeD88bzpwPjwvbzpwPjwvcHJlPg0KPHByZT5E
b3duZ3JhZGUgdGhlIHdyaXRlIGxvY2sgdG8gcmVhZCBsb2NrLjxvOnA+PC9vOnA+PC9wcmU+DQo8
cHJlPiZuYnNwOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPlNpZ25lZC1vZmYtYnk6IEVtaWx5IERl
bmcgPGEgaHJlZj0ibWFpbHRvOkVtaWx5LkRlbmdAYW1kLmNvbSI+Jmx0O0VtaWx5LkRlbmdAYW1k
LmNvbSZndDs8L2E+PG86cD48L286cD48L3ByZT4NCjxwcmU+LS0tPG86cD48L286cD48L3ByZT4N
CjxwcmU+ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5jIHwgMyArKy08bzpwPjwv
bzpwPjwvcHJlPg0KPHByZT4xIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pPG86cD48L286cD48L3ByZT4NCjxwcmU+Jm5ic3A7PG86cD48L286cD48L3ByZT4NCjxw
cmU+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9zdm0uYzxvOnA+
PC9vOnA+PC9wcmU+DQo8cHJlPmIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5j
PG86cD48L286cD48L3ByZT4NCjxwcmU+aW5kZXggYmQzZTIwZDk4MWUwLi5jOTA3ZTJkZTNkZGUg
MTAwNjQ0PG86cD48L286cD48L3ByZT4NCjxwcmU+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3N2bS5jPG86cD48L286cD48L3ByZT4NCjxwcmU+KysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3N2bS5jPG86cD48L286cD48L3ByZT4NCjxwcmU+QEAgLTE4NDEs
NiArMTg0MSw3IEBAIHN0YXRpYyB2b2lkIHN2bV9yYW5nZV9yZXN0b3JlX3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0PG86cD48L286cD48L3ByZT4NCjxwcmU+KndvcmspPG86cD48L286cD48L3ByZT4N
CjxwcmU+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG11dGV4X2xvY2soJmFtcDtwcm9j
ZXNzX2luZm8tJmd0O2xvY2spOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBzdm1fcmFuZ2VfbGlzdF9sb2NrX2FuZF9mbHVzaF93b3JrKHN2bXMs
IG1tKTs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsgbXV0ZXhfbG9jaygmYW1wO3N2bXMtJmd0O2xvY2spOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJl
PisgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7bW1hcF93cml0ZV9kb3duZ3JhZGUobW0p
OzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBldmljdGVkX3JhbmdlcyA9IGF0b21pY19yZWFk
KCZhbXA7c3Ztcy0mZ3Q7ZXZpY3RlZF9yYW5nZXMpOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZu
YnNwOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPkBAIC0xODkwLDcgKzE4OTEsNyBAQCBzdGF0aWMg
dm9pZCBzdm1fcmFuZ2VfcmVzdG9yZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdDxvOnA+PC9vOnA+
PC9wcmU+DQo8cHJlPip3b3JrKTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOzxvOnA+PC9v
OnA+PC9wcmU+DQo8cHJlPm91dF9yZXNjaGVkdWxlOjxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBtdXRleF91bmxvY2soJmFtcDtzdm1zLSZndDts
b2NrKTs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4tJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IG1tYXBfd3JpdGVfdW5sb2NrKG1tKTs8bzpwPjwvbzpwPjwvcHJlPg0KPHByZT4rJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG1tYXBfcmVhZF91bmxvY2sobW0pOzxvOnA+PC9vOnA+
PC9wcmU+DQo8cHJlPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBtdXRleF91bmxvY2so
JmFtcDtwcm9jZXNzX2luZm8tJmd0O2xvY2spOzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNw
OzxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAv
KiBJZiB2YWxpZGF0aW9uIGZhaWxlZCwgcmVzY2hlZHVsZSBhbm90aGVyIGF0dGVtcHQgKi88bzpw
PjwvbzpwPjwvcHJlPg0KPHByZT4tLTxvOnA+PC9vOnA+PC9wcmU+DQo8cHJlPjIuMzQuMTxvOnA+
PC9vOnA+PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPiZuYnNwOzxvOnA+PC9vOnA+PC9wcmU+
DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_CO6PR12MB54117113A866F8DC26466CAE8FFD2CO6PR12MB5411namp_--
