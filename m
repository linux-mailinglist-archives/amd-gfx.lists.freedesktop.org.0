Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D125545A25
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jun 2022 04:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68F510E3B2;
	Fri, 10 Jun 2022 02:35:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E9C10E3B2
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jun 2022 02:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdO1YB+ecrSJWObvkEB8G8XDU7u4gxVfTN+bMF+u97vfpdf2+CuLgdFwXWUNg3XFbnKcpH2lvUtwKk58xV7+kTDWG6apbBMTm+ZcF3H1oisHtWBiv68HmyGdOdEspcCdP5wTglnrfLkFwQ1EpMM8xIMIFtxKNXcZfavb3E6NlgvTcgX18bMu5zHU3DbDj1Vy3u8f0s9zvIfFqF07i5ZG4AA7oVn8CwG7ejmGYGgYlDIwj47/FI+f1LumI1OaON518alL5OvIZPmGTeR+KdCLjDm1j93uh2kxYfAVADV9sFCWBxZJl378ZR57pF0GJN8iQTgPLQCDF94vo/RTwUwqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCgmKWPErc3rg9GecDigk/KO2h/GPeceR+bcmwn40NY=;
 b=D8sZO8JL5eNNPnnVwbHII8REo/qgOrfn9DyE2hSSVKFJa5ktrcuBel0sbD3PP2qJJcd+LITxy68xHpPWWN81oygp3TqY51KonIeHrqhnoTE1J/4A0zEHKltk4DHc47TF/Qy8BIBynElhU+0xwlU40rYxfDcm/QWZNJ5yFme7o/E9wfIR3WttZPmhcNkKQlQD+BVtYzkp59zngbMvp3alOFfwfFiV4wjoofTUTjsdULtyA+U5DIyMn1KfCQlkeRNmU6KwUG12UZGAUHoIORwJNnvEok1/yyWzT01ShHcgkQ+TSEd0MTkwbBy2yIlGjYIQk3hhooBNHbW79cJlTxO5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCgmKWPErc3rg9GecDigk/KO2h/GPeceR+bcmwn40NY=;
 b=46jfXbiejsVYJxOg+b/xkWb9F6zNVGYDAyMRyZDB01MYXXatDrI3Wwm4vS4ziDhVl08QpR4LSH3MUt8Jv0P7fQ8S8De/c409PkwFZH8ef2fWLSnWRCcO5eTHm5ZNEpjszXH9fngICSMcov0MUw8xRUIU4mWoSA+a4uWnfWZM1cQ=
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by BN6PR12MB1489.namprd12.prod.outlook.com (2603:10b6:405:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 02:35:12 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::58d8:1b61:8bdb:2824]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::58d8:1b61:8bdb:2824%4]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 02:35:12 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Fix error handling in
 amdgpu_amdkfd_gpuvm_free_memory_of_gpu
Thread-Topic: [PATCH] drm/amdgpu: Fix error handling in
 amdgpu_amdkfd_gpuvm_free_memory_of_gpu
Thread-Index: AQHYfCTR4Saj9bkNGEKjhLH3J7wrPa1HiRYAgABjsnA=
Date: Fri, 10 Jun 2022 02:35:12 +0000
Message-ID: <SN1PR12MB257580B62569CF28D084DC9BE3A69@SN1PR12MB2575.namprd12.prod.outlook.com>
References: <20220609171727.3581424-1-Ramesh.Errabolu@amd.com>
 <0f800182-ca4c-f093-3295-53e4a3188eb9@amd.com>
In-Reply-To: <0f800182-ca4c-f093-3295-53e4a3188eb9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-10T02:35:08Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=746ef0f3-d846-45c2-bf54-f89118424a1e;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-10T02:35:08Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: f33e614d-7b18-4b51-adef-b1a26c7b056a
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f5978a9-f0a1-4cd4-fed9-08da4a89d870
x-ms-traffictypediagnostic: BN6PR12MB1489:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1489874CF64EB743AC18D349E3A69@BN6PR12MB1489.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t4BJuVrFBe4kNpA8WZaOA6/YUf98yoyspXLVAt8ViEMPKsVC4Kv+DJ03Tkc8DBmfxGLYjyiaXu476hRJjL4vxSIhYLJN2YY+1QWNRxvSmQtDx6UyNdgmd9cQPhvTxyPsYW2fXzIwbNFUrBcTmcctDR7A2yd3RCniNNfOw2WW/qy8v7f/F3ocCVX0ULkqaXj+jrDNLh4dsIPkzGrXJVe1RgRanETUBDoyPjYtH/S/UA64w4qNbgcCM8RxQyj8OZ0UA2Sk2Sw8tzASTNJHciziMfbOVaQIIMQlN7cCc/myLe/Dq+Uuha1sm2wWuyZATNQr/WE79QcauMnOIA1AjOWZVgV8dUVWKcm1PhxGqqGECcNAiKSfrCeiUoIf0Tj5lRIzdDen+/0Kwf2cnWU0KWbWezoEndskXHcnwA+IMXs7R2SF8UHCuz0Q69MVnnnKWwu0XUdBy6V27aXrVtisZGwRwjinwX3JCemjLEZOyynDQSO5o6n5ohnIQMd2sXp0PQKGBsxR9KDFaWDVsnO6mNM+nxg642tufC5PnK40yfb/Fv+vm6kbBk6PakK5P8j/Ws3PrliJrycm6MJQHt0hqkSYdtoYlHsxIEfZ2Gd5GiWd21T0OtCXduxW6lIBGZNWRp3b7j3YwtWz8/EmW1x1g6YtjfH5xBu1/9AlGzey+m7O3N4gVL/VFBYXft1kuBXqiFua53BMUVQJzPvd1VTvmZ75DNgvjaKMPV3YDzUxg11fnNbW/GJskXpItsTanRFvrHF1yALm5IlrKZBKf98W4G1mAmKGF0wUnb9YW0V1O8EsP9mQLTo6vhhmkz6CVVjT0qQA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2575.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(52536014)(86362001)(53546011)(26005)(8936002)(9686003)(5660300002)(508600001)(71200400001)(2906002)(33656002)(966005)(7696005)(6506007)(38100700002)(66446008)(66946007)(8676002)(83380400001)(66476007)(64756008)(110136005)(66556008)(122000001)(316002)(186003)(55016003)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2dBM0Z5azhNREEwcVIyY0hac0Y5MmNZRDV2VE95YXpCNTNHUTRlcnF3NzND?=
 =?utf-8?B?cXE3MVRZYlpHVXF2UXVhNy8rYmZEbXA4N29lWStKR0hCVFVHSFgwT2p6djAw?=
 =?utf-8?B?SzVqUkJ6UTBmSHQ3Y0ZXcXJheWNTc1BkaWVnWTBDRzQ0UWJ0RU5WdUh3Y0FR?=
 =?utf-8?B?RFE1VU5JSVhFWWFmaDFrdUNFV0JxSmF4SXRRbmx1UHFtWExYLzhPSUVDd1ly?=
 =?utf-8?B?SDRKcUlpWU9IRG52ck1kdXdVaFZjSm5RTkNUMlM4c3JaeE5PR2tJOExXRWpt?=
 =?utf-8?B?UXB1YVowcDBETWJrV3JpUU9mZWQvclE2RzFCS2NNVmp0M09sSDFrbTcrV2pD?=
 =?utf-8?B?OTJrL25UK3M3Z3V2b0o5L1N4cWNFMlBjelBZbndnNzFzNlNYaHRhNi9EbVE2?=
 =?utf-8?B?a1R2cGFOVm4ybUxocWZTUHBUcjJQZCtXeDJtRU1MMnV2QmU3ZXR3K0dZb1Qr?=
 =?utf-8?B?YmJrQUZHenl2QUYrTXFlTDV1bFZtSDk5QlYwbmRrSWo5NGZvTWVZS1pkNXlH?=
 =?utf-8?B?SklPY2xVSCswSURySFlHQTRSVmVpeVlVYzFWNnZYRDFIaFlHVHpoM3pqNXBv?=
 =?utf-8?B?ODNLR2E4cVZDcHkwNmw5bGhkbGNEbTg0d25wTCsxbUNzblpTZXMxRC9qamc0?=
 =?utf-8?B?WUJHWUw4WWFycUdMYXFQK3htajN2dzIrRndobnlremZwcXZmUUJPeGtwNVRH?=
 =?utf-8?B?dTdtL1A1enpBM1czSEhJaVNtc1VTN0hKVHJya0oyUkhlQWovZ3BvSzlhME0y?=
 =?utf-8?B?by9KSXdhRHM1cDBmZXp6UTd6eFZUTnBTN3J2YUplYkE2bFlEcEd6Y2RqUUpP?=
 =?utf-8?B?YWVWRFlrSGxDYjExQnFMMlVzbk0yWDZYSHFDSldOUjNUemtuRmxteGlVZ2t5?=
 =?utf-8?B?NHpQWElXRUZlSkZsRlIxN2FNZldlK3IwV1lQZEF6aHF4VUJBOTJuZFFNQmRj?=
 =?utf-8?B?aXlQajN1NGJ1K2VYcGlNcWdKTFcwN0JvTmhDT0xNQm1reHJRRVZJdnRWb0Rt?=
 =?utf-8?B?alZOVEdSMnlTbitxbnhPL3dlUXQybHFoblJXL2xHZWxFWlo4T203QzVRa0ZE?=
 =?utf-8?B?UHA0ck5TQXYrMjhJbjNib1JsdXFzcXk4d2taMlQxcHVWYmFVNGpsZVBhbXlJ?=
 =?utf-8?B?L3oyK0JpQ21BUmxMWkJyd3NBOXlOdzdZQThmK3cwS3YvMmd1NHJuQjBtV1hE?=
 =?utf-8?B?ZmpuY3ROejY0NlowRU0reURaZzRHNXdrOVV2Ym1OM2h1T1ZzdnJiVjFzZkVP?=
 =?utf-8?B?c3doMzhtOGNjOGxRUVJSZTBRRldobll1MEdrbFhBZnljVW52My95R3U2UEp3?=
 =?utf-8?B?blB1K2JNa0NpOUtkRGppZG5WUWJ5NExLYXNHQkFYQTJhd2ZDM2FyUFdpTVBy?=
 =?utf-8?B?YWpETFNuTFA2YUE1L3RUZVNFSlNDdzNvcERNd3NpQWQzYkFtV0pmUVdUZ3BT?=
 =?utf-8?B?UUhCNkluZ2toaWxyZVdLYnRoTkJHaGNNVnhyTWkyU0VHckFLSjloYUhSNzdJ?=
 =?utf-8?B?MHFhUi9LK01IOVNsblU4am9zeURwMVNWTjlDRFpXZ0NLUk5IUklpRkxYNm91?=
 =?utf-8?B?eWFRNXkyOWd4QVM1ZjJxb1JyeTVaOUVtOVBUUExiNmdoaEFzbUYyY3Q5Skls?=
 =?utf-8?B?NHNpakxYck1lWTdGQ3pkenFzalAwWWVFc2VIYW5oa29ldzlsenRHK1VyaDNl?=
 =?utf-8?B?cDhXZVlPSVYwZUs1V3h1dDNJVWlWK0V0RzZUa28xNlVsSjBOMVdCTFprRngv?=
 =?utf-8?B?Y3h2dURJNW1RcU01amxJQlAzeUM3STM0K0pkK1Y1S3JMMXQ2dTNZUDJxU2d2?=
 =?utf-8?B?T1Z4WUJPQXlWZm56WDZSVnpVOUF6M1lvNGlFTXo5Mkg5U0VxNkhpUUo5N3pU?=
 =?utf-8?B?ZlBwSnhURzJVczgwZWFheFozOUpjQjNGS0JyN1dEUUZIUFpMK2hsTGpBNmxL?=
 =?utf-8?B?Qjk5TnhjSS9PRlJyaXIwWW1xY0V0WGJBb2ZRWmdZem0zUU95U1lEd1BTVElP?=
 =?utf-8?B?WS9TUng3ZGZDNmFoVnVZMUFsaWlXK0J3VGRVM2Q0SG5TN3Y4NHVOYWg0RDM5?=
 =?utf-8?B?VjlyWkpmREREMnMvT1hEcldJKzJPVUV1R3RkNkFxbU9YQVV0RVhpVFBoZCtS?=
 =?utf-8?B?SURBemhzNG85S0dkeTlnNlpzL2tEMjJRR21haDd0My9JU1FqZ3dUd3ovWjl3?=
 =?utf-8?B?Y2VZaWc2M3UyVjFRWWErZnRFMVByMElKcDZkS2k4MWpDK0MxNFRqOWFyY2Yz?=
 =?utf-8?B?R2hNdXh2UzFNanE4NDFCTEVWanNYK24wSEV2dlhoOVBudnppNWh1aTZtcUhx?=
 =?utf-8?Q?pMIPRs3oVE7c+5aQCb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5978a9-f0a1-4cd4-fed9-08da4a89d870
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 02:35:12.8449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mJmhGVTPClrH8cLco+GCbpR5T/HI2KVQfHh7yaGVUphNswo2Eg28YFL7FzH38IWkDbKuErIHb4AObQ3w8L2Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1489
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rcyBmb3IgdGhlIGNsYXJp
ZmljYXRpb24gaS5lLiB1c2Ugb2YgaWRlbXBvdGVudC4gV2lsbCB1cGRhdGUgdGhlIGNvbW1lbnRz
IHBlciByZXZpZXcuDQoNClJlZ2FyZHMsDQpSYW1lc2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gDQpT
ZW50OiBGcmlkYXksIEp1bmUgMTAsIDIwMjIgMjowNyBBTQ0KVG86IEVycmFib2x1LCBSYW1lc2gg
PFJhbWVzaC5FcnJhYm9sdUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
ClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBlcnJvciBoYW5kbGluZyBpbiBh
bWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVfbWVtb3J5X29mX2dwdQ0KDQpBbSAyMDIyLTA2LTA5IHVt
IDEzOjE3IHNjaHJpZWIgUmFtZXNoIEVycmFib2x1Og0KPiBGb2xsb3dpbmcgZXJyb3IgY29uZGl0
aW9ucyBhcmUgZml4ZWQ6DQo+ICAgICAgRW5zdXJlIGNhbGxzIHRvIGRlbGV0ZSBhIGxpc3QgZWxl
bWVudCBhcmUgc2FmZQ0KPiAgICAgIFVucGluIE1NSU8gYW5kIERPT1JCRUxMIEJPcyBvbmx5IGFm
dGVyIG1hcCBjb3VudCBnb2VzIHRvIHplcm8NCj4gICAgICBQcmludCBhIHdhcm5pbmcgbWVzc2Fn
ZSBpZiB1bnJlc2VydmluZyBWTXMgZW5jb3VudGVycyBhbiBlcnJvcg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBSYW1lc2ggRXJyYWJvbHUgPFJhbWVzaC5FcnJhYm9sdUBhbWQuY29tPg0KPiAtLS0NCj4g
ICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCAzOCArKysr
KysrKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPiBpbmRleCBhMWRlOTAwYmE2NzcuLjc4YjNlZmVjYzJm
OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZF9ncHV2bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYw0KPiBAQCAtMTAxMywxNCArMTAxMywxNCBAQCBzdGF0aWMgdm9pZCBhZGRfa2dk
X21lbV90b19rZmRfYm9fbGlzdChzdHJ1Y3Qga2dkX21lbSAqbWVtLA0KPiAgIAltdXRleF91bmxv
Y2soJnByb2Nlc3NfaW5mby0+bG9jayk7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIHZvaWQgcmVt
b3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlzdChzdHJ1Y3Qga2dkX21lbSAqbWVtLA0KPiArc3Rh
dGljIHZvaWQgcmVtb3ZlX2tnZF9tZW1fZnJvbV92YWxpZGF0ZV9saXN0KHN0cnVjdCBrZ2RfbWVt
ICptZW0sDQo+ICAgCQlzdHJ1Y3QgYW1ka2ZkX3Byb2Nlc3NfaW5mbyAqcHJvY2Vzc19pbmZvKQ0K
PiAgIHsNCj4gICAJc3RydWN0IHR0bV92YWxpZGF0ZV9idWZmZXIgKmJvX2xpc3RfZW50cnk7DQo+
ICAgDQo+ICAgCWJvX2xpc3RfZW50cnkgPSAmbWVtLT52YWxpZGF0ZV9saXN0Ow0KPiAgIAltdXRl
eF9sb2NrKCZwcm9jZXNzX2luZm8tPmxvY2spOw0KPiAtCWxpc3RfZGVsKCZib19saXN0X2VudHJ5
LT5oZWFkKTsNCj4gKwlsaXN0X2RlbF9pbml0KCZib19saXN0X2VudHJ5LT5oZWFkKTsNCj4gICAJ
bXV0ZXhfdW5sb2NrKCZwcm9jZXNzX2luZm8tPmxvY2spOw0KPiAgIH0NCj4gICANCj4gQEAgLTE3
OTYsNyArMTc5Niw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21lbW9yeV9vZl9n
cHUoDQo+ICAgDQo+ICAgYWxsb2NhdGVfaW5pdF91c2VyX3BhZ2VzX2ZhaWxlZDoNCj4gICBlcnJf
cGluX2JvOg0KPiAtCXJlbW92ZV9rZ2RfbWVtX2Zyb21fa2ZkX2JvX2xpc3QoKm1lbSwgYXZtLT5w
cm9jZXNzX2luZm8pOw0KPiArCXJlbW92ZV9rZ2RfbWVtX2Zyb21fdmFsaWRhdGVfbGlzdCgqbWVt
LCBhdm0tPnByb2Nlc3NfaW5mbyk7DQo+ICAgCWRybV92bWFfbm9kZV9yZXZva2UoJmdvYmotPnZt
YV9ub2RlLCBkcm1fcHJpdik7DQo+ICAgZXJyX25vZGVfYWxsb3c6DQo+ICAgCS8qIERvbid0IHVu
cmVzZXJ2ZSBzeXN0ZW0gbWVtIGxpbWl0IHR3aWNlICovIEBAIC0xODI1LDIwICsxODI1LDEyIA0K
PiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoDQo+ICAgCXVu
c2lnbmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5iYXNlLnNpemU7DQo+ICAgCXN0cnVj
dCBrZmRfbWVtX2F0dGFjaG1lbnQgKmVudHJ5LCAqdG1wOw0KPiAgIAlzdHJ1Y3QgYm9fdm1fcmVz
ZXJ2YXRpb25fY29udGV4dCBjdHg7DQo+IC0Jc3RydWN0IHR0bV92YWxpZGF0ZV9idWZmZXIgKmJv
X2xpc3RfZW50cnk7DQo+ICAgCXVuc2lnbmVkIGludCBtYXBwZWRfdG9fZ3B1X21lbW9yeTsNCj4g
ICAJaW50IHJldDsNCj4gICAJYm9vbCBpc19pbXBvcnRlZCA9IGZhbHNlOw0KPiAgIA0KPiAgIAlt
dXRleF9sb2NrKCZtZW0tPmxvY2spOw0KPiAgIA0KPiAtCS8qIFVucGluIE1NSU8vRE9PUkJFTEwg
Qk8ncyB0aGF0IHdlcmUgcGlubmVkIGR1cmluZyBhbGxvY2F0aW9uICovDQo+IC0JaWYgKG1lbS0+
YWxsb2NfZmxhZ3MgJg0KPiAtCSAgICAoS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfRE9PUkJFTEwg
fA0KPiAtCSAgICAgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfTU1JT19SRU1BUCkpIHsNCj4gLQkJ
YW1kZ3B1X2FtZGtmZF9ncHV2bV91bnBpbl9ibyhtZW0tPmJvKTsNCj4gLQl9DQo+IC0NCj4gICAJ
bWFwcGVkX3RvX2dwdV9tZW1vcnkgPSBtZW0tPm1hcHBlZF90b19ncHVfbWVtb3J5Ow0KPiAgIAlp
c19pbXBvcnRlZCA9IG1lbS0+aXNfaW1wb3J0ZWQ7DQo+ICAgCW11dGV4X3VubG9jaygmbWVtLT5s
b2NrKTsNCj4gQEAgLTE4NTIsMTEgKzE4NDQsMTAgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1f
ZnJlZV9tZW1vcnlfb2ZfZ3B1KA0KPiAgIAkJcmV0dXJuIC1FQlVTWTsNCj4gICAJfQ0KPiAgIA0K
PiAtCS8qIE1ha2Ugc3VyZSByZXN0b3JlIHdvcmtlcnMgZG9uJ3QgYWNjZXNzIHRoZSBCTyBhbnkg
bW9yZSAqLw0KPiAtCWJvX2xpc3RfZW50cnkgPSAmbWVtLT52YWxpZGF0ZV9saXN0Ow0KPiAtCW11
dGV4X2xvY2soJnByb2Nlc3NfaW5mby0+bG9jayk7DQo+IC0JbGlzdF9kZWwoJmJvX2xpc3RfZW50
cnktPmhlYWQpOw0KPiAtCW11dGV4X3VubG9jaygmcHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gKwkv
KiBNYWtlIHN1cmUgcmVzdG9yZSB3b3JrZXJzIGRvbid0IGFjY2VzcyB0aGUgQk8gYW55IG1vcmUN
Cj4gKwkgKiBFbnN1cmUgcmVtb3ZhbCBvZiBCTyBmcm9tIHZhbGlkYXRlIGxpc3QgaXMgcmVlbnRy
YW50IHNhZmUNCg0KVGhlIGNvbW1lbnQgYWJvdXQgYmVpbmcgcmVlbnRyYW50IHNhZmUgYmVsb25n
cyBpbiByZW1vdmVfa2dkX21lbV9mcm9tX3ZhbGlkYXRlX2xpc3QuIFRoYXQgc2FpZCwgInJlZW50
cmFudCBzYWZlIiBpcyBub3QgdGhlIGNvcnJlY3QgdGVybSBoZXJlLiBTZWUgaHR0cHM6Ly9lbi53
aWtpcGVkaWEub3JnL3dpa2kvUmVlbnRyYW5jeV8oY29tcHV0aW5nKS4gSXQgcmVmZXJzIHRvIGZ1
bmN0aW9ucyB0aGF0IGNhbiBydW4gbXVsdGlwbGUgdGltZXMgY29uY3VycmVudGx5LCBvciBiZSBp
bnRlcnJ1cHRlZCBpbiB0aGUgbWlkZGxlLiBOZWl0aGVyIG9mIHRob3NlIGFyZSBhcHBsaWNhYmxl
IGhlcmUuDQoNClRoZSBjb3JyZWN0IHRlcm0gaGVyZSBpcyAiaWRlbXBvdGVudCIuIFNlZSBodHRw
czovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9JZGVtcG90ZW5jZS4gSXQgcmVxdWlyZXMgdGhhdCB0
aGUgZnVuY3Rpb24gY2FuIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBzZXF1ZW50aWFsbHkgd2l0
aG91dCBjaGFuZ2luZyB0aGUgcmVzdWx0cyBiZXlvbmQgdGhlIGZpcnN0IGNhbGwuDQoNCldpdGgg
dGhhdCBmaXhlZCwgdGhlIHBhdGNoIGlzDQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KDQo+ICsJICovDQo+ICsJcmVtb3ZlX2tnZF9tZW1f
ZnJvbV92YWxpZGF0ZV9saXN0KG1lbSwgcHJvY2Vzc19pbmZvKTsNCj4gICANCj4gICAJLyogTm8g
bW9yZSBNTVUgbm90aWZpZXJzICovDQo+ICAgCWFtZGdwdV9tbl91bnJlZ2lzdGVyKG1lbS0+Ym8p
Ow0KPiBAQCAtMTg3OCw3ICsxODY5LDE4IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVf
bWVtb3J5X29mX2dwdSgNCj4gICAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGVudHJ5LCB0bXAs
ICZtZW0tPmF0dGFjaG1lbnRzLCBsaXN0KQ0KPiAgIAkJa2ZkX21lbV9kZXRhY2goZW50cnkpOw0K
PiAgIA0KPiArCS8qIFJldHVybiBzdWNjZXNzIGV2ZW4gaW4gY2FzZSBvZiBlcnJvciAqLw0KPiAg
IAlyZXQgPSB1bnJlc2VydmVfYm9fYW5kX3ZtcygmY3R4LCBmYWxzZSwgZmFsc2UpOw0KPiArCWlm
ICh1bmxpa2VseShyZXQpKSB7DQo+ICsJCVdBUk5fT05DRShyZXQsICJFcnJvciBpbiB1bnJlc2Vy
dmluZyBCTyBhbmQgYXNzb2NpYXRlZCBWTXMiKTsNCj4gKwkJcmV0ID0gMDsNCj4gKwl9DQo+ICsN
Cj4gKwkvKiBVbnBpbiBNTUlPL0RPT1JCRUxMIEJPJ3MgdGhhdCB3ZXJlIHBpbm5lZCBkdXJpbmcg
YWxsb2NhdGlvbiAqLw0KPiArCWlmIChtZW0tPmFsbG9jX2ZsYWdzICYNCj4gKwkgICAgKEtGRF9J
T0NfQUxMT0NfTUVNX0ZMQUdTX0RPT1JCRUxMIHwNCj4gKwkgICAgIEtGRF9JT0NfQUxMT0NfTUVN
X0ZMQUdTX01NSU9fUkVNQVApKQ0KPiArCQlhbWRncHVfYW1ka2ZkX2dwdXZtX3VucGluX2JvKG1l
bS0+Ym8pOw0KPiAgIA0KPiAgIAkvKiBGcmVlIHRoZSBzeW5jIG9iamVjdCAqLw0KPiAgIAlhbWRn
cHVfc3luY19mcmVlKCZtZW0tPnN5bmMpOw0KPiBAQCAtMjgxNCw3ICsyODE2LDcgQEAgaW50IGFt
ZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHZvaWQgKmluZm8sIHZvaWQgKmd3cywgc3Ry
dWN0IGtnZF9tZW0gKiptZW0NCj4gICBib19yZXNlcnZhdGlvbl9mYWlsdXJlOg0KPiAgIAltdXRl
eF91bmxvY2soJigqbWVtKS0+cHJvY2Vzc19pbmZvLT5sb2NrKTsNCj4gICAJYW1kZ3B1X3N5bmNf
ZnJlZSgmKCptZW0pLT5zeW5jKTsNCj4gLQlyZW1vdmVfa2dkX21lbV9mcm9tX2tmZF9ib19saXN0
KCptZW0sIHByb2Nlc3NfaW5mbyk7DQo+ICsJcmVtb3ZlX2tnZF9tZW1fZnJvbV92YWxpZGF0ZV9s
aXN0KCptZW0sIHByb2Nlc3NfaW5mbyk7DQo+ICAgCWFtZGdwdV9ib191bnJlZigmZ3dzX2JvKTsN
Cj4gICAJbXV0ZXhfZGVzdHJveSgmKCptZW0pLT5sb2NrKTsNCj4gICAJa2ZyZWUoKm1lbSk7DQo+
IEBAIC0yODMyLDcgKzI4MzQsNyBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9yZW1vdmVfZ3dzX2Zyb21f
cHJvY2Vzcyh2b2lkICppbmZvLCB2b2lkICptZW0pDQo+ICAgCS8qIFJlbW92ZSBCTyBmcm9tIHBy
b2Nlc3MncyB2YWxpZGF0ZSBsaXN0IHNvIHJlc3RvcmUgd29ya2VyIHdvbid0IHRvdWNoDQo+ICAg
CSAqIGl0IGFueW1vcmUNCj4gICAJICovDQo+IC0JcmVtb3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9f
bGlzdChrZ2RfbWVtLCBwcm9jZXNzX2luZm8pOw0KPiArCXJlbW92ZV9rZ2RfbWVtX2Zyb21fdmFs
aWRhdGVfbGlzdChrZ2RfbWVtLCBwcm9jZXNzX2luZm8pOw0KPiAgIA0KPiAgIAlyZXQgPSBhbWRn
cHVfYm9fcmVzZXJ2ZShnd3NfYm8sIGZhbHNlKTsNCj4gICAJaWYgKHVubGlrZWx5KHJldCkpIHsN
Cg==
