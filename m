Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7E80F9B8
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Dec 2023 22:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4AB10E0BC;
	Tue, 12 Dec 2023 21:48:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2368E10E0BC
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Dec 2023 21:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBL2OQ6F/qxVQz/vAbsagMU+k1da3XZty5ih/FC+W1Nm8/GIliJVJLuZDgiDRcJAQgWp5X/v4TFv2NnjCuH9d7uLiWM3/aEHCsQ0hY398QQmKAXlhVpSDWYsW0Cxa9tSxd0TCCiVvRwt7Om+b3P/rYyAQZCZn9BVubEBWeDeILxKO/0D3VG+skv6thThqgVyJM5eFS8jpuYkarutR40gZPj8eNERSFXh2FhxD3xlcXCjrT/uBTRRy9Q6BMT2FkWGg0xOclsljy1vikaRyJMOwd0oLYNr3avDuobf6CWl3Za+FNKp5NmfxnEoflKuWxhrl/Zv3eAsDUAIi18FyCbx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0tqbu6+JftxHF/0mczmRetOCTv4PD2UUfYtJUW+iI0=;
 b=dfgOECl9/3RxCuUQ1Ryj+EVRtV0aicx966Dv/fCAs+Frd3qH/92qQbSbkPnQ50qTchGgju4MNIoS/b3jf8ybJWn2zzXVqYzNgGzQIx2jJYwFgxTwF2eH+raveCVa2569tZ/KD3gYB5jeJfoEthnfmRK94TI/pHiEskqXcvyxoknJo6jBrintL29PozR75rScSGQtBRHHvajvgX0M3ok9ZIe1Nj01NqlzkBCf/VWUyapTho2Mv8ttECta72WXk5UMKnP4BLaynckRfl2roM+xzuBeWDLJ5YGdH/lLk2L/k/x5AAvrR7sZgioPp17OpnXjv1/KCT/573vyIEdsGthvzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0tqbu6+JftxHF/0mczmRetOCTv4PD2UUfYtJUW+iI0=;
 b=qtd17VQ9Mrq5F6DuGA5zo51cmqCqh1JHxR+bxJT2kv3Ire5JZWNREDr273va+vtc4kwN/+xQZH1kaJrYT6gqI2dqyPqtM4jnnzs5xACf/9Mv7fYBi9a3dYDv2PZOEuWPV7Uz1qqaM563GouC4MdRiaiODL2Q0IVdfLT6wjIDJNg=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 21:48:07 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::26b:275e:95a8:c54a]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::26b:275e:95a8:c54a%3]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 21:48:07 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Huang, JinHuiEric"
 <JinHuiEric.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process management
Thread-Topic: [PATCH] drm/amdkfd: fix mes set shader debugger process
 management
Thread-Index: AQHaLHdMy6hjSboUMEi0ErCHNB+UVrCl7iUAgAA1WACAAAHBYIAACq+AgAAAWTA=
Date: Tue, 12 Dec 2023 21:48:07 +0000
Message-ID: <CY8PR12MB74359C2CC97BEEC4DF059B3C858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20231211211612.3109-1-Jonathan.Kim@amd.com>
 <c4fc2b14-07b1-4b27-b460-166dcb343d74@amd.com>
 <CH0PR12MB5372AA024278ED7F7F078EEFF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435E109E255C480398C0FE4858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB5372602539AA4398F2ED5822F48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB5372602539AA4398F2ED5822F48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1f974d48-b7bc-4742-955d-811359e16bc1;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-12-12T21:31:14Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|MW4PR12MB7165:EE_
x-ms-office365-filtering-correlation-id: 440dd19c-df83-4908-2546-08dbfb5c06f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SHEk3qa/AjJxeJVvbiP+SSXYzv+20c8CaXxufmShmGcNOf6v+8ig0+qM5wemougUfjV8Plz6y/sXuGj4bovDAloJexnbMC8Hw0LWnGZRczU59+LwRDbhRXHaGnm8TUW9GuiZktKbXD+UazOxx1w0giLGZchejUHQk+L5mtIH4qqXCG83DBKPR6ADpCCY3n8qWoKYcE0R9oLgziL90VZ6GGsZzjWaz6P7R1K9fYrrlb/cfaHdX6pNPEDuYfEVTjE6VPxapN/rsPF25/ZPKmS7QVYjsJbVtCnRHJjzToptsR0F82mKOTYxg0jcWMq6LpnyUfatNUZFFHqrNdVlD6OVLuffYHcJJqTJ4KuFrJjrCqbYdPJUIk2r0a8tddTrizDcvVORZa+IYLSaoct01fvz/pcSZKxp8WxNNhNmdCY3UG8oFOVSP1iRCjCwlanG1xS7TlPSkdGKNeiZGfv+BjYOxaN6FWApEkljSz7xCMaT3GNC+Z01qpBNrxSFclj8ZfQo25xVslc/rYZTJV+j5ke09snKqf2B+4fEHlBmk1milzBrift9Tyjfm4hB+3gLEvR/O8kg/gFbfpGK8YUaz4gftes2Zft3iWaAm3diEHuTdVu1g/vpWb30ntVqpAnjcspS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(8676002)(66556008)(9686003)(71200400001)(53546011)(5660300002)(83380400001)(52536014)(478600001)(2906002)(4001150100001)(41300700001)(8936002)(66946007)(76116006)(66476007)(316002)(54906003)(4326008)(7696005)(110136005)(66446008)(33656002)(122000001)(38070700009)(86362001)(38100700002)(64756008)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkw4ODM0RWJVSktTS3JrQkxHRFlxM21HTWRhR2haVjQ5dDRPLy9YUERWU2Vp?=
 =?utf-8?B?Ry9ZTHdKbkxHRDRQdVFIalFSQU0zdEpjdFBXK0ZtM0VyY2g4ei9kS29BbUpP?=
 =?utf-8?B?b2RzMDNjdmlKOWhRV1pWUkhTZXZpNHBhSHZrenBzbVY0a09TV2d2bXZmUEht?=
 =?utf-8?B?L3EzNFZ3eFY0S01xRXpCcWE4TnRLZDhldVNUVHVkelhka1lDYUNYQWl4bXJG?=
 =?utf-8?B?SnBIVTJkY3JSZGhpYXJCR3hJZkFUcDczWEswc2FQNzVNTUNMUFp5QlZmeE94?=
 =?utf-8?B?R3FYNXJDUmUvVDhvQzNSYWdSYUtWWmRrQkpuSXJBV3NvUXRDaE00eTlMZGR0?=
 =?utf-8?B?aGVNSnV1Z0JTNkxZS0RCV29JVkFyTjI4Q0JFYWlRMUVSVUhqTGF6Nm5VSmRv?=
 =?utf-8?B?aC9iZjl3bkhTWUxsb2QyWnZIZGdCMDlDZkxGZDI5UXp6R2psOG5xRTZkTGhF?=
 =?utf-8?B?cXF1N3QvZVp1WkNHQ1gxdVNBVGNlck5nTDF4Ly80RHRLQ1FUcXlvcVZ4Mi9w?=
 =?utf-8?B?UGw0c3gyejBpRnV3V1pzYzA4Unk5dDFkUXRYS3ZZeVJua2U3MFhTc2VMSGF0?=
 =?utf-8?B?M1EzMVdmMnd1bWNuNjRBMmIxUHBsNWFSd3JDajZPQWE0QjRhN0RaWHlPVlFh?=
 =?utf-8?B?YUlDaXVUblNoU0xqR2JYTE9kU0RVakgyanNrWFRRQm04c1NEYlRMaDZJV1Zs?=
 =?utf-8?B?Z1lmL2ZBSEIwYjJkUFpYWmYyMWJoN0lnUENLOUEvWUtUd3RkSHpoV0FRNHVp?=
 =?utf-8?B?Z0EwY3JGaWJRNFZoSVlOdWdMZGx1dk1lSWd1dVA3bUplV3Bja3MrdGY2OTJt?=
 =?utf-8?B?c3VnTkFuRmhiY0prejZXa0xSSnFORE85Y0pBai9oWVJjN0dBaUdTd1c3bmNB?=
 =?utf-8?B?NWJzZHVmK2hLVnFWWkdXMW1pTGJvQ29LTEdkUDluRXN2MDV0R2UvNkt5aHc1?=
 =?utf-8?B?ZUxKcVMvRTNsaGtwWUlRMlM5d2NSMDNzSit6TGk4MHlCTEx2YXlrOW96WlJC?=
 =?utf-8?B?TkZHMGk0WHEvbXg3ckIrNXZRTW1qOFA0RzBNcHEvdFpoK2J0dzVlN21Ob1d3?=
 =?utf-8?B?eWFyd3NEU3RudHNyTjdGMFNYU2J5NEVFVlhoMjgrRnJBS1R0MThtUGd1c3p0?=
 =?utf-8?B?WmNvcm4vSWU2bHlTakxpRGFQSktjTVRGUjVsTmlrSXB1OHErUlhzQUY5LzFj?=
 =?utf-8?B?azVyWFdWL0p4Y1J4UEVMMXNxU1ZBSllKYkRaanh6aGlJMWk1cXFIZW9hc0Z3?=
 =?utf-8?B?YlJoYUQvclFsNENvcEpwelNVMnlBWVo3OCt1TGg2RHNyOGxMMmZBK3ZUY01C?=
 =?utf-8?B?cDZNMWNlQnNXUktGYS9KeVpicHFwMGpQVGFwVU1LK2RqY2Zid1I3UFV4SUEx?=
 =?utf-8?B?UWFyaU1URTZWMGVSU2xtcFB5bWFEcnNhNnU1cVB6NndIM0dmVWNJQzNJcitX?=
 =?utf-8?B?ejcza09LQ0k0UEpFSVg0L01vQnRHV1VVTytXSnZubDIzT01DbzVDRExnZTRq?=
 =?utf-8?B?dmt4UmJhdkQwNnlHRENEWkwvRE9zcGsvcXdkTE8wNDdHbGZpUXkwbVZILzlB?=
 =?utf-8?B?SUhrSlFnY1hJWTdIYlJXbjFJSGw3OXYzQzZLNjcyVUZudDJSLzZzNEZtbmt4?=
 =?utf-8?B?akVvTWh6MDkrWTdqT25kTktURnBUQUZMR0lOYnNWVFhNU05mZHNSNEdrSDh3?=
 =?utf-8?B?QjY0cXRoZ1p4TmJWelhSLzZmZTgydkNtWmVFdzV3T2dFSUZYdExmMVVtQ1pJ?=
 =?utf-8?B?WUpReE9YVGpXdVFWOUk0Y0xqSXI0d1A5NWt2OEJCeXNTNVJhRStCdXIwd2o5?=
 =?utf-8?B?VW1WWGpzczZJV3VkQ0RyRkQ4UkFiSFV6MVh5aHh3SUtkNWRhYVl5OUxVcXlG?=
 =?utf-8?B?RlJxaEpFQWdWbjhmWWt0MFdqTHR0eU9VbkF2SStpYmt6SEcvS1VhbGlPK3RQ?=
 =?utf-8?B?NjdUL1gxdmIxN3pVQjkwTkJjd1pxV3lDOGszckgxTzlWMGMyK1B4NHRWcmdK?=
 =?utf-8?B?V3hxa3YxZGR4ZFNPaVdlNk5GVWJ6NkZsZ0s1WW9RcjdlSUtLWVQxYzJ5ejhs?=
 =?utf-8?B?akFmblhXNm5qOWMvQlRlckNOdGovblZ5UmE2akdPYWYwSWd4ZnN4ckdMSkFr?=
 =?utf-8?Q?84EQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440dd19c-df83-4908-2546-08dbfb5c06f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 21:48:07.4836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +cCaV+gadAUI0U4jUjahsConNFMBGzDjVAUf9eI10TDPqXzt+8Ow6AC0MLhGC7r9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165
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
Cc: "Wong, Alice" <Shiwei.Wong@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaXUsIFNo
YW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDEy
LCAyMDIzIDQ6NDUgUE0NCj4gVG86IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29t
PjsgSHVhbmcsIEppbkh1aUVyaWMNCj4gPEppbkh1aUVyaWMuSHVhbmdAYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXb25nLCBBbGljZSA8U2hpd2VpLldvbmdA
YW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeA0KPiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IEth
c2l2aXN3YW5hdGhhbiwgSGFyaXNoDQo+IDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+
DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IGZpeCBtZXMgc2V0IHNoYWRlciBk
ZWJ1Z2dlciBwcm9jZXNzDQo+IG1hbmFnZW1lbnQNCj4NCj4gW1B1YmxpY10NCj4NCj4gU2hvdWxk
bid0IHRoZSBkcml2ZXIgc2lkZSAgcmVtb3ZlIGFsbCB0aGUgcmVtYWluaW5nICBxdWV1ZXMgZm9y
IHRoZSBwcm9jZXNzDQo+IGR1cmluZyAgcHJvY2VzcyB0ZXJtaW5hdGlvbiA/ICBJZiBhbGwgdGhl
ICBxdWV1ZXMgYmVlbiByZW1vdmVkIGZvciB0aGUNCj4gcHJvY2VzcyAsICBNRVMgc2hvdWxkIHB1
cmdlIHRoZSAgcHJvY2VzcyBjb250ZXh0IGF1dG9tYXRpY2FsbHkgLCBvdGhlcndpc2UNCj4gaXQn
cyBidWcgaW5zaWRlIE1FUyAuDQoNClRoYXQncyBvbmx5IGlmIHRoZXJlIHdlcmUgcXVldWVzIGFk
ZGVkIHRvIGJlZ2luIHdpdGguDQoNCkpvbg0KDQo+DQo+IFJlZ2FyZA0KPiBTc2hhb3l1bi5saXUN
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2ltLCBKb25hdGhhbiA8
Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDEyLCAyMDIz
IDQ6MzMgUE0NCj4gVG86IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1kLmNvbT47IEh1YW5n
LCBKaW5IdWlFcmljDQo+IDxKaW5IdWlFcmljLkh1YW5nQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogV29uZywgQWxpY2UgPFNoaXdlaS5Xb25nQGFtZC5jb20+
OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLYXNpdmlzd2Fu
YXRoYW4sIEhhcmlzaA0KPiA8SGFyaXNoLkthc2l2aXN3YW5hdGhhbkBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIXSBkcm0vYW1ka2ZkOiBmaXggbWVzIHNldCBzaGFkZXIgZGVidWdnZXIg
cHJvY2Vzcw0KPiBtYW5hZ2VtZW50DQo+DQo+IFtQdWJsaWNdDQo+DQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBMaXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5j
b20+DQo+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTIsIDIwMjMgNDowMCBQTQ0KPiA+IFRv
OiBIdWFuZywgSmluSHVpRXJpYyA8SmluSHVpRXJpYy5IdWFuZ0BhbWQuY29tPjsgS2ltLCBKb25h
dGhhbg0KPiA+IDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gQ2M6IFdvbmcsIEFsaWNlIDxTaGl3ZWkuV29uZ0BhbWQuY29tPjsgS3VlaGxp
bmcsIEZlbGl4DQo+ID4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4s
IEhhcmlzaA0KPiA+IDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+DQo+ID4gU3ViamVj
dDogUkU6IFtQQVRDSF0gZHJtL2FtZGtmZDogZml4IG1lcyBzZXQgc2hhZGVyIGRlYnVnZ2VyIHBy
b2Nlc3MNCj4gPiBtYW5hZ2VtZW50DQo+ID4NCj4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0g
R2VuZXJhbF0NCj4gPg0KPiA+IERvZXMgdGhpcyByZXF1aXJlcyB0aGUgIG5ldyBNRVMgRlcgZm9y
IHRoaXMgcHJvY2Vzc19jdHhfZmx1c2gNCj4gPiByZXF1aXJlbWVudCA/ICBDYW4gZHJpdmVyIHNp
ZGUgYWRkIGxvZ2ljIHRvIGd1YXJhbnR5IHdoZW4gIGNhbGwNCj4gPiBTRVRfU0hBREVSX0RFQlVH
R0VSLCB0aGUgcHJvY2VzcyBhZGRyZXNzICBpcyBhbHdheXMgdmFsaWQgPw0KPg0KPiBDYWxsIHRv
IGZsdXNoIG9uIG9sZCBmdyBpcyBhIE5PUCBzbyBpdCdzIGhhcm1sZXNzIGluIHRoYXQgY2FzZS4N
Cj4gRnVsbCBzb2x1dGlvbiB3aWxsIHN0aWxsIHJlcXVpcmUgYSBuZXcgTUVTIHZlcnNpb24gYXMg
dGhpcyBpcyBhIHdvcmthcm91bmQgb24NCj4gY29ybmVyIGNhc2VzIGFuZCBub3QgYSBuZXcgZmVh
dHVyZSBpLmUuIHdlIGNhbid0IHN0b3AgUk9DbSBmcm9tIHJ1bm5pbmcgb24NCj4gb2xkIGZ3Lg0K
PiBUaGUgcHJvY2VzcyBhZGRyZXNzIGlzIGFsd2F5cyB2YWxpZCBmcm9tIHRoZSBkcml2ZXIgc2lk
ZS4gIEl0J3MgdGhlIE1FUyBzaWRlIG9mDQo+IHRoaW5ncyB0aGF0IGdldHMgc3RhbGUgYXMgbWVu
dGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbiAocGFzc2VkIHZhbHVlIHRvIE1FUw0KPiBpcyByZXVz
ZWQgd2l0aCBuZXcgQk8gYnV0IE1FUyBkb2Vzbid0IHJlZnJlc2gpLg0KPiBpLmUuIE1FUyBhdXRv
IHJlZnJlc2hlcyBpdCdzIHByb2Nlc3MgbGlzdCBhc3N1bWluZyBwcm9jZXNzIHF1ZXVlcyB3ZXJl
IGFsbA0KPiBkcmFpbmVkIGJ1dCBkcml2ZXIgY2FuJ3QgZ3VhcmFudGVlIHRoYXQgU0VUX1NIQURF
Ul9ERUJVR0dFUiAod2hpY2gNCj4gYWRkcyB0byBNRVMncyBwcm9jZXNzIGxpc3QpIHdpbGwgZ2V0
IGNhbGxlZCBhZnRlciBxdWV1ZXMgZ2V0IGFkZGVkIChpbiBmYWN0IGl0J3MNCj4gYSByZXF1aXJl
bWVudHMgdGhhdCBpdCBjYW4gYmUgY2FsbGVkIGF0IGFueSB0aW1lKS4NCj4gV2UgY2FuIGF0dGVt
cHQgdG8gZGVmZXIgY2FsbHMgdGhlc2UgY2FsbHMgaW4gdGhlIEtGRCwgY29uc2lkZXJpbmcgYWxs
IGNhc2VzLg0KPiBCdXQgdGhhdCB3b3VsZCBiZSBhIGxhcmdlIHNoaWZ0IGluIGRlYnVnZ2VyL3J1
bnRpbWVfZW5hYmxlL0tGRCBjb2RlLA0KPiB3aGljaCBpcyBhbHJlYWR5IGNvbXBsaWNhdGVkIGFu
ZCBjb3VsZCBnZXQgYnVnZ3kgcGx1cyBpdCB3b3VsZCBub3QgYmUNCj4gaW50dWl0aXZlIGF0IGFs
bCBhcyB0byB3aHkgd2UncmUgZG9pbmcgdGhpcy4NCj4gSSB0aGluayBhIHNpbmdsZSBmbGFnIHNl
dCB0byBmbHVzaCBNRVMgb24gcHJvY2VzcyB0ZXJtaW5hdGlvbiBpcyBhIHNpbXBsZXINCj4gY29t
cHJvbWlzZSB0aGF0IHNob3dzIHRoZSBsaW1pdGF0aW9uIGluIGEgbW9yZSBvYnZpb3VzIHdheS4N
Cj4NCj4gVGhhbmtzLA0KPg0KPiBKb24NCj4NCj4NCj4gPg0KPiA+IFJlZ2FyZHMNCj4gPiBTaGFv
eXVuLmxpdQ0KPiA+DQo+ID4NCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZg0KPiA+IEVyaWMgSHVhbmcNCj4gPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMiwg
MjAyMyAxMjo0OSBQTQ0KPiA+IFRvOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNv
bT47IGFtZC0NCj4gPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IFdvbmcsIEFs
aWNlIDxTaGl3ZWkuV29uZ0BhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4DQo+ID4gPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaA0KPiA+IDxIYXJpc2guS2Fz
aXZpc3dhbmF0aGFuQGFtZC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGtm
ZDogZml4IG1lcyBzZXQgc2hhZGVyIGRlYnVnZ2VyIHByb2Nlc3MNCj4gPiBtYW5hZ2VtZW50DQo+
ID4NCj4gPg0KPiA+IE9uIDIwMjMtMTItMTEgMTY6MTYsIEpvbmF0aGFuIEtpbSB3cm90ZToNCj4g
PiA+IE1FUyBwcm92aWRlcyB0aGUgZHJpdmVyIGEgY2FsbCB0byBleHBsaWNpdGx5IGZsdXNoIHN0
YWxlIHByb2Nlc3MNCj4gPiA+IG1lbW9yeSB3aXRoaW4gdGhlIE1FUyB0byBhdm9pZCBhIHJhY2Ug
Y29uZGl0aW9uIHRoYXQgcmVzdWx0cyBpbiBhDQo+ID4gPiBmYXRhbCBtZW1vcnkgdmlvbGF0aW9u
Lg0KPiA+ID4NCj4gPiA+IFdoZW4gU0VUX1NIQURFUl9ERUJVR0dFUiBpcyBjYWxsZWQsIHRoZSBk
cml2ZXIgcGFzc2VzIGEgbWVtb3J5DQo+ID4gYWRkcmVzcw0KPiA+ID4gdGhhdCByZXByZXNlbnRz
IGEgcHJvY2VzcyBjb250ZXh0IGFkZHJlc3MgTUVTIHVzZXMgdG8ga2VlcCB0cmFjayBvZg0KPiA+
ID4gZnV0dXJlIHBlci1wcm9jZXNzIGNhbGxzLg0KPiA+ID4NCj4gPiA+IE5vcm1hbGx5LCBNRVMg
d2lsbCBwdXJnZSBpdHMgcHJvY2VzcyBjb250ZXh0IGxpc3Qgd2hlbiB0aGUgbGFzdA0KPiA+ID4g
cXVldWUgaGFzIGJlZW4gcmVtb3ZlZC4gIFRoZSBkcml2ZXIsIGhvd2V2ZXIsIGNhbiBjYWxsDQo+
ID4gPiBTRVRfU0hBREVSX0RFQlVHR0VSIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBhIHF1ZXVlIGhh
cyBiZWVuIGFkZGVkDQo+IG9yIG5vdC4NCj4gPiA+DQo+ID4gPiBJZiBTRVRfU0hBREVSX0RFQlVH
R0VSIGhhcyBiZWVuIGNhbGxlZCB3aXRoIG5vIHF1ZXVlcyBhcyB0aGUgbGFzdA0KPiA+ID4gY2Fs
bCBwcmlvciB0byBwcm9jZXNzIHRlcm1pbmF0aW9uLCB0aGUgcGFzc2VkIHByb2Nlc3MgY29udGV4
dA0KPiA+ID4gYWRkcmVzcyB3aWxsIHN0aWxsIHJlc2lkZSB3aXRoaW4gTUVTLg0KPiA+ID4NCj4g
PiA+IE9uIGEgbmV3IHByb2Nlc3MgY2FsbCB0byBTRVRfU0hBREVSX0RFQlVHR0VSLCB0aGUgZHJp
dmVyIG1heSBlbmQNCj4gdXANCj4gPiA+IHBhc3NpbmcgYW4gaWRlbnRpY2FsIHByb2Nlc3MgY29u
dGV4dCBhZGRyZXNzIHZhbHVlIChiYXNlZCBvbg0KPiA+ID4gcGVyLXByb2Nlc3MgZ3B1IG1lbW9y
eSBhZGRyZXNzKSB0byBNRVMgYnV0IGlzIG5vdyBwb2ludGluZyB0byBhIG5ldw0KPiA+ID4gYWxs
b2NhdGVkIGJ1ZmZlciBvYmplY3QgZHVyaW5nIEtGRCBwcm9jZXNzIGNyZWF0aW9uLiAgU2luY2Ug
dGhlIE1FUw0KPiA+ID4gaXMgdW5hd2FyZSBvZiB0aGlzLCBhY2Nlc3Mgb2YgdGhlIHBhc3NlZCBh
ZGRyZXNzIHBvaW50cyB0byB0aGUgc3RhbGUNCj4gPiA+IG9iamVjdCB3aXRoaW4gTUVTIGFuZCB0
cmlnZ2VycyBhIGZhdGFsIG1lbW9yeSB2aW9sYXRpb24uDQo+ID4gPg0KPiA+ID4gVGhlIHNvbHV0
aW9uIGlzIGZvciBLRkQgdG8gZXhwbGljaXRseSBmbHVzaCB0aGUgcHJvY2VzcyBjb250ZXh0DQo+
ID4gPiBhZGRyZXNzIGZyb20gTUVTIG9uIHByb2Nlc3MgdGVybWluYXRpb24uDQo+ID4gPg0KPiA+
ID4gTm90ZSB0aGF0IHRoZSBmbHVzaCBjYWxsIGFuZCB0aGUgTUVTIGRlYnVnZ2VyIGNhbGxzIHVz
ZSB0aGUgc2FtZSBNRVMNCj4gPiA+IGludGVyZmFjZSBidXQgYXJlIHNlcGFyYXRlZCBhcyBLRkQg
Y2FsbHMgdG8gYXZvaWQgY29uZmxpY3Rpbmcgd2l0aA0KPiA+ID4gZWFjaCBvdGhlci4NCj4gPiA+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBLaW0gPGpvbmF0aGFuLmtpbUBhbWQuY29t
Pg0KPiA+ID4gVGVzdGVkLWJ5OiBBbGljZSBXb25nIDxzaGl3ZWkud29uZ0BhbWQuY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBFcmljIEh1YW5nIDxqaW5odWllcmljLmh1YW5nQGFtZC5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5jICAg
ICAgIHwgMzENCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaCAgICAgICB8IDEwICsrKy0tLQ0KPiA+ID4gICAuLi4v
YW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMgICAgfCAgMSArDQo+ID4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9tZXNfdjExX2FwaV9kZWYuaCB8ICAzICstDQo+
ID4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X21lcy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMu
Yw0KPiA+ID4gaW5kZXggZTU0NGI4MjNhYmY2Li5lOThkZTIzMjUwZGMgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMNCj4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuYw0KPiA+ID4gQEAgLTkxNiw2
ICs5MTYsMTEgQEAgaW50IGFtZGdwdV9tZXNfc2V0X3NoYWRlcl9kZWJ1Z2dlcihzdHJ1Y3QNCj4g
PiBhbWRncHVfZGV2aWNlICphZGV2LA0KPiA+ID4gICAgICAgb3BfaW5wdXQub3AgPSBNRVNfTUlT
Q19PUF9TRVRfU0hBREVSX0RFQlVHR0VSOw0KPiA+ID4gICAgICAgb3BfaW5wdXQuc2V0X3NoYWRl
cl9kZWJ1Z2dlci5wcm9jZXNzX2NvbnRleHRfYWRkciA9DQo+ID4gcHJvY2Vzc19jb250ZXh0X2Fk
ZHI7DQo+ID4gPiAgICAgICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLmZsYWdzLnUzMmFs
bCA9IGZsYWdzOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgLyogdXNlIGFtZGdwdSBtZXNfZmx1c2hf
c2hhZGVyX2RlYnVnZ2VyIGluc3RlYWQgKi8NCj4gPiA+ICsgICAgIGlmIChvcF9pbnB1dC5zZXRf
c2hhZGVyX2RlYnVnZ2VyLmZsYWdzLnByb2Nlc3NfY3R4X2ZsdXNoKQ0KPiA+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICsNCj4gPiA+ICAgICAgIG9wX2lucHV0LnNldF9z
aGFkZXJfZGVidWdnZXIuc3BpX2dkYmdfcGVyX3ZtaWRfY250bCA9DQo+ID4gc3BpX2dkYmdfcGVy
X3ZtaWRfY250bDsNCj4gPiA+ICAgICAgIG1lbWNweShvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVn
Z2VyLnRjcF93YXRjaF9jbnRsLA0KPiA+IHRjcF93YXRjaF9jbnRsLA0KPiA+ID4NCj4gPiA+IHNp
emVvZihvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLnRjcF93YXRjaF9jbnRsKSk7DQo+ID4g
PiBAQCAtOTM1LDYgKzk0MCwzMiBAQCBpbnQgYW1kZ3B1X21lc19zZXRfc2hhZGVyX2RlYnVnZ2Vy
KHN0cnVjdA0KPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiAgICAgICByZXR1cm4gcjsN
Cj4gPiA+ICAgfQ0KPiA+ID4NCj4gPiA+ICtpbnQgYW1kZ3B1X21lc19mbHVzaF9zaGFkZXJfZGVi
dWdnZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHByb2Nlc3NfY29udGV4dF9hZGRyKSB7DQo+ID4g
PiArICAgICBzdHJ1Y3QgbWVzX21pc2Nfb3BfaW5wdXQgb3BfaW5wdXQgPSB7MH07DQo+ID4gPiAr
ICAgICBpbnQgcjsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGlmICghYWRldi0+bWVzLmZ1bmNzLT5t
aXNjX29wKSB7DQo+ID4gPiArICAgICAgICAgICAgIERSTV9FUlJPUigibWVzIGZsdXNoIHNoYWRl
ciBkZWJ1Z2dlciBpcyBub3Qgc3VwcG9ydGVkIVxuIik7DQo+ID4gPiArICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ID4gKyAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gKyAgICAgb3BfaW5w
dXQub3AgPSBNRVNfTUlTQ19PUF9TRVRfU0hBREVSX0RFQlVHR0VSOw0KPiA+ID4gKyAgICAgb3Bf
aW5wdXQuc2V0X3NoYWRlcl9kZWJ1Z2dlci5wcm9jZXNzX2NvbnRleHRfYWRkciA9DQo+ID4gcHJv
Y2Vzc19jb250ZXh0X2FkZHI7DQo+ID4gPiArICAgICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVn
Z2VyLmZsYWdzLnByb2Nlc3NfY3R4X2ZsdXNoID0gdHJ1ZTsNCj4gPiA+ICsNCj4gPiA+ICsgICAg
IGFtZGdwdV9tZXNfbG9jaygmYWRldi0+bWVzKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIHIgPSBh
ZGV2LT5tZXMuZnVuY3MtPm1pc2Nfb3AoJmFkZXYtPm1lcywgJm9wX2lucHV0KTsNCj4gPiA+ICsg
ICAgIGlmIChyKQ0KPiA+ID4gKyAgICAgICAgICAgICBEUk1fRVJST1IoImZhaWxlZCB0byBzZXRf
c2hhZGVyX2RlYnVnZ2VyXG4iKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIGFtZGdwdV9tZXNfdW5s
b2NrKCZhZGV2LT5tZXMpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgcmV0dXJuIHI7DQo+ID4gPiAr
fQ0KPiA+ID4gKw0KPiA+ID4gICBzdGF0aWMgdm9pZA0KPiA+ID4gICBhbWRncHVfbWVzX3Jpbmdf
dG9fcXVldWVfcHJvcHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgZGlmZiAtLWdp
dA0KPiA+ID4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmgNCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ID4gPiBpbmRleCA4
OTRiOWIxMzMwMDAuLjdkNGY5M2ZlYTkzNyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ID4gPiBAQCAtMjk2LDkgKzI5NiwxMCBAQCBzdHJ1
Y3QgbWVzX21pc2Nfb3BfaW5wdXQgew0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2
NF90IHByb2Nlc3NfY29udGV4dF9hZGRyOw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHVu
aW9uIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB7DQo+ID4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpbmdsZV9t
ZW1vcCA6IDE7DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQ2NF90IHNpbmdsZV9hbHVfb3AgOiAxOw0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50NjRfdCByZXNlcnZlZDogMzA7DQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9tZW1vcCA6IDE7DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9h
bHVfb3AgOiAxOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
aW50MzJfdCByZXNlcnZlZDogMjk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IHByb2Nlc3NfY3R4X2ZsdXNoOiAxOw0KPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IHUzMmFsbDsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICB9IGZsYWdz
Ow0KPiA+ID4gQEAgLTM3NCw3ICszNzUsOCBAQCBpbnQgYW1kZ3B1X21lc19zZXRfc2hhZGVyX2Rl
YnVnZ2VyKHN0cnVjdA0KPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqdGNwX3dhdGNoX2NudGwsDQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBmbGFncywNCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgdHJhcF9lbik7DQo+ID4gPiAtDQo+ID4g
PiAraW50IGFtZGdwdV9tZXNfZmx1c2hfc2hhZGVyX2RlYnVnZ2VyKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3Qg
cHJvY2Vzc19jb250ZXh0X2FkZHIpOw0KPiA+ID4gICBpbnQgYW1kZ3B1X21lc19hZGRfcmluZyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGdhbmdfaWQsDQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgaW50IHF1ZXVlX3R5cGUsIGludCBpZHgsDQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGFtZGdwdV9tZXNfY3R4X2RhdGEgKmN0eF9kYXRhLCBkaWZmDQo+ID4g
PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21h
bmFnZXIuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19x
dWV1ZV9tYW5hZ2VyLmMNCj4gPiA+IGluZGV4IDc3ZjQ5MzI2MmUwNS4uOGU1NWU3OGZjZTRlIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3Nf
cXVldWVfbWFuYWdlci5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gPiA+IEBAIC04Nyw2ICs4Nyw3IEBAIHZvaWQg
a2ZkX3Byb2Nlc3NfZGVxdWV1ZV9mcm9tX2RldmljZShzdHJ1Y3QNCj4gPiBrZmRfcHJvY2Vzc19k
ZXZpY2UgKnBkZCkNCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ID4NCj4gPiA+ICAg
ICAgIGRldi0+ZHFtLT5vcHMucHJvY2Vzc190ZXJtaW5hdGlvbihkZXYtPmRxbSwgJnBkZC0+cXBk
KTsNCj4gPiA+ICsgICAgIGFtZGdwdV9tZXNfZmx1c2hfc2hhZGVyX2RlYnVnZ2VyKGRldi0+YWRl
diwgcGRkLQ0KPiA+ID5wcm9jX2N0eF9ncHVfYWRkcik7DQo+ID4gPiAgICAgICBwZGQtPmFscmVh
ZHlfZGVxdWV1ZWQgPSB0cnVlOw0KPiA+ID4gICB9DQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9tZXNfdjExX2FwaV9kZWYuaA0KPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiA+IGluZGV4
IDFmYmZkMWFhOTg3ZS4uZWM1YjlhYjY3YzVlIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9pbmNsdWRlL21lc192MTFfYXBpX2RlZi5oDQo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiA+IEBAIC01NzIsNyAr
NTcyLDggQEAgc3RydWN0IFNFVF9TSEFERVJfREVCVUdHRVIgew0KPiA+ID4gICAgICAgICAgICAg
ICBzdHJ1Y3Qgew0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9t
ZW1vcCA6IDE7ICAvKiBTUV9ERUJVRy5zaW5nbGVfbWVtb3ANCj4gKi8NCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICB1aW50MzJfdCBzaW5nbGVfYWx1X29wIDogMTsgLyogU1FfREVCVUcuc2lu
Z2xlX2FsdV9vcCAqLw0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHJlc2Vy
dmVkIDogMzA7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcmVzZXJ2ZWQg
OiAyOTsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBwcm9jZXNzX2N0eF9m
bHVzaCA6IDE7DQo+ID4gPiAgICAgICAgICAgICAgIH07DQo+ID4gPiAgICAgICAgICAgICAgIHVp
bnQzMl90IHUzMmFsbDsNCj4gPiA+ICAgICAgIH0gZmxhZ3M7DQo+ID4NCj4NCj4NCg0K
