Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7B706E48
	for <lists+amd-gfx@lfdr.de>; Wed, 17 May 2023 18:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A5910E1E9;
	Wed, 17 May 2023 16:37:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1F110E1E9
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 May 2023 16:37:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHGJFKxBk+JnoN6k1PCe2XmsMiRoDzS/pAe6+7m/2QyQOCceyhUpV8EzuJpSc9xw2OFb5MTZ8gpUTVo3i6Hn4GNw4dwxb3Txs1ZPE7DSaFoFEk+Z05rY45K0wEPVWkh7BVAlDgvEZuFx1hPHc3h1G5Yu/5Ur04h+XvG1XU+9Kmfbgk+rUbAnPNSU1qVTeTLhO1U3gwDZyjayLa32qV44NuJEIqy52fuIA9RpSRgMi9UenCwlP2u28FNLtNGXM2k5A+vgBVJ3HMeUlMNBXbfMNlFjka40aZxwIGs3HPBLvFVHH9uB9sxE7frYyxuICh0PcC8+/koLOu5YRFSPGflj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOsbdb8iyTndj82CrzNOu3AtSaSKPW/yghv3xapL3e4=;
 b=iZd0OG2n940IlZvemydLKmTPJ8IBBaEnF2DbUHVfR5twHRsEziq6uYCtrmTXT8VCLnlvac2FjS7PX8kaffZxS94ugd1kaBmdew1E6o0igO4nlCM8Damlikv41SWmexd7B7bcviAbm7ri8Yxvywsc+NQ/Cv9VrQTjC9z/MX6qowiJ9igWoTA2XIYr6O+DSQUno0yekMtLZj+5EhZKzvQTGCQhZGUXihnVMJ6HaXetXqG3vfvY+qLQW9ZJeqrKoY8DBjUrsNU/kMQnLB+VqAvCk2vvieR3qmHiHvQk0rFWTN1hFH2nYJLFOg43JBKXQjCDOxxI7xIxbbNOp7CEBjC/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOsbdb8iyTndj82CrzNOu3AtSaSKPW/yghv3xapL3e4=;
 b=uNoPf2KRCap3I/+Nu4fWNi0WfMz2B1+wJa1UVpiIPVfbaSwVTA9tRPGbRW4Se3vU9g2tQGBZ9KvlMAxVAntK9j5EjuppnRB9Nvz0ZS+O5rXOBY9ofHPMg0EYSV0VmBZ8GZccmpChCdBXyCrKVweA1Na4NW47IkumHXMLhdm8Fq0=
Received: from BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 16:37:28 +0000
Received: from BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::7ca6:a548:58f8:e0c0]) by BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::7ca6:a548:58f8:e0c0%2]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 16:37:28 +0000
From: "Joshi, Mukul" <Mukul.Joshi@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc9: fix 64 bit division in partition code
Thread-Topic: [PATCH] drm/amdgpu/gmc9: fix 64 bit division in partition code
Thread-Index: AQHZiMxXtH7gJFmuCkGH+9K0bma2I69eoan2gAAF5gCAAAJT5w==
Date: Wed, 17 May 2023 16:37:28 +0000
Message-ID: <BL3PR12MB6425D86DDF6DCA0475051544EE7E9@BL3PR12MB6425.namprd12.prod.outlook.com>
References: <20230517143130.3016720-1-alexander.deucher@amd.com>
 <BL3PR12MB64255F59A97B4E656F9CE387EE7E9@BL3PR12MB6425.namprd12.prod.outlook.com>
 <CADnq5_PUqo6cPFA7ZMN=rMqDmy44YE8Ho55n_od=+uhh3APD_A@mail.gmail.com>
In-Reply-To: <CADnq5_PUqo6cPFA7ZMN=rMqDmy44YE8Ho55n_od=+uhh3APD_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-17T16:37:27.543Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6425:EE_|BL0PR12MB4916:EE_
x-ms-office365-filtering-correlation-id: 7aae228a-aa83-4838-dbb8-08db56f500aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZFCEyCqbISFV0X/Gx/AlJHIaEVkzaYXirp6agqW/joHGT7ItIL3T3ymBjEvucrjus6G5vPnsBzPFTDwg3NbQ1vFmmCvkWOqLxqS54/JNymv98XgnbblfG+6xNtx5PjDZwym59SULECXRRYPQGREntG8ANsqlYEQFbfZJhL3w0tVJWwA12QPgfAu3B3Zh8DkkLabOrXHhkyeMGlTKHrKJb2nsxF5Lf8sy1GsopJVwzpcRKDIo9fw7hx4E2NGMWGtPcwx6FlxWqmvpPEq/RVkFHXki1zccOPdofoqVtJPsQ8Pud6e/cKZUadF3W8cICnLHHDAxGH59UAoLjm5rBmfGhTAFy+X4bpfxJigFrtx6HNJWlefAEJIwAFOOsxlOxs1AKDKI02Kx4KoljfEkED8SWwp+rkl/j18EgK4HccTYE4wuwLPuxRMAP7ziIpfBbDUioca7U1anArIUEOyTov/VkwSWf52+hp1RyFo+kVryZpsUF2HhLAX+seiIPA269RuMgkXrV6ip2Pt4iNLVeUMv4XkvznBgnw/hJ+5YoOeG/o89b15+fjXbfq7v4iFJgR5q2IMz45xmpoOh/JUymdBbUfkQISukxqUc1MczOL4NpyrsnNEr4zW/1sTHnonA+x4d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6425.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199021)(66446008)(4326008)(54906003)(66476007)(6916009)(66556008)(91956017)(66946007)(478600001)(64756008)(76116006)(7696005)(2906002)(8676002)(33656002)(71200400001)(8936002)(316002)(55016003)(52536014)(5660300002)(26005)(122000001)(41300700001)(86362001)(38070700005)(38100700002)(83380400001)(186003)(6506007)(9686003)(53546011)(19627405001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkhxYXQySitCVEFOdUlhM1ppYUtNWE42SStjOXZzWXhIYkxzUW5tblVSQTBi?=
 =?utf-8?B?UlViK1lCLzVoSERxbjNxSmdCaEFhVG9hRXFFTEZ0TjBpVlIwL0ZQTlJvNnJS?=
 =?utf-8?B?ZFVvV3hvaWhXTmMrakhaS280ZHFtQm1mdDZ1UWhFMUtTSnJoM2YwMWJRWC9G?=
 =?utf-8?B?Q2RXakVadm1ZN0JFWkNwL290MEFpTDdTVFVuSUZEVU9TS1Z1N0JxRFJKeCtV?=
 =?utf-8?B?TEpjbUJrS3FoWTZKL3U1dDVqVGduZzljSEkxZ2M4Um0zeUliaC9VcXRkUlli?=
 =?utf-8?B?b291OHVUN2N4RTFUM2xuYndkV2FsZzlIbmNXaVZHN1ZwdDR3VzFDcHU4NlB1?=
 =?utf-8?B?NGE2NnZsaXRvVDZJTzc5SVJLTHlRNUdmNC9Fd05FeWVEVlFuQW1Sckd6RFhD?=
 =?utf-8?B?bDM0MmJRLzNoZzVSZm5PY20vT05jblhrcnpNQVBNbWsrbFRvejhaWmhrVWFt?=
 =?utf-8?B?OWIyclJRN0ZuVE55bkRYZXVzSnFnVU1xODZBdXhGcmhVckhzcjAvRDlIbngy?=
 =?utf-8?B?dVJFQUxIVzFZNmkrOVJDdStLdDd0MnI0L2V1ODdHR1VGSzJKdG0waDZXZHFw?=
 =?utf-8?B?eXVxNGlIb1RKN0xPL1lNY1I1ZU9Valk4aGxHZTBERm5yUVg1R0E3MmJ3b3l5?=
 =?utf-8?B?dWNOQzBKekZiVjY1LzIwQm8zNnVmT2cxNHl5R1RQY0NRUzlCWEVxalNXRlpF?=
 =?utf-8?B?YzZtWFpUdzI3azNkS0RDeDBzRWFTd2RQU3NBN1krQnNDN2hkOG9veXNaK090?=
 =?utf-8?B?cldBWGtkeUxGa0pIL0VaYllwdXhsQ0pKcnVaOGFlRmpCQjZCZjBOTVhoeUtF?=
 =?utf-8?B?UEVhVDZBa0FGNG9VZy9XWHF6Yll4ZWErcU9QTlFHSDdmU2szYnVCMzhaci9X?=
 =?utf-8?B?aVY0NWt5Q0ViNXExT21zdEJTdlFwc0t5QU1URjc5QnNNblJIYWdQSjJtVUxr?=
 =?utf-8?B?V3B4NGZvdkhyb3NFcU1nR1V1VzRxbG9FdkFqRGthdVJFbWRhUzY4VWRwN1NG?=
 =?utf-8?B?aG5ZemZpM0tleURiOE41MVo1a2NBYkVpQ2h0RXF1K3lTVVVZc3RLd2ZWUU1K?=
 =?utf-8?B?NDJtTzJVVCt4bTFyQXE2Q1RsMWxHVUhBaEhBM29IT0JOYTBOank2V1p1NHJR?=
 =?utf-8?B?NTJHejdHcUs0RThYYkhFb2xIQ0IxRGxBRlVSQ2JWRTgwZTlJVzhXSG1HUEM2?=
 =?utf-8?B?OFh3VkkrUDFiak1DUmx6NzVpZU9peHR1MjdqNWt3Z3ZaNzhlYWRkL2JtTWFw?=
 =?utf-8?B?SUJtckp2TUFuWWh2UGNrcG9wT2NPaHNmd2dxZC8xTzhEcm03UUluOU0yeldX?=
 =?utf-8?B?YnRWS0w1RmxlWkdHZlhJakU1RzBCSzlRb3NvQTlYWWQ5aE43UFp1N0UwUTdF?=
 =?utf-8?B?UElwZEJlVkRONm5yYjF1TEd4NDRQTG9hWGRMWVJManZKMU9VTlBjb3dOY0tL?=
 =?utf-8?B?VE1yK1p5UGR4WVVxZHRSZnpLc1NQN01rOFZSY2ZkbENMOHRBcTlIN0drYlo0?=
 =?utf-8?B?dDVTam9DWDVwVkJWWHBVTFFUQjN2bEVRM2ZBbzVJYWdwUTdKMlhkVW92dTAr?=
 =?utf-8?B?d2dQeWpnNFEzOEhVRHVreHo1YWpzL0d5SmZwS3ErbGxETDZuN1IzWXQ1dDAz?=
 =?utf-8?B?RzlEMXF0S2RvZjZXRTdjUkp5c0RLNWc1ekFITnJjWi9LbXI0UytiL05aVHlm?=
 =?utf-8?B?SXFNeW9PckZqMk92M0RpSGJpOUV3L3VxNWFmVStRaGtVZUtHd2QxcnZrRW5R?=
 =?utf-8?B?STE2Nk5lRE8yRFhhYStQY1ByTVF2R3IvSTNReFV5KzFTNkh3eldNd3R1dCtk?=
 =?utf-8?B?MnczbVEzQVMrVDRyOEFMSkQ4SURJWkRWTkppY21FbUNaZDJ0ekhBY3k5TGdE?=
 =?utf-8?B?ckJ4TGNrN3lyNjJqSVRpK1h4YTU1cGkvdzNxcFViYUhpYTBpMlF6d1NyNUV2?=
 =?utf-8?B?eUtGUkNEMGR3ZGVMdTd1N29oVCtObDZNNUpwU3ZaMjhRT1ZnYUp4cklKSDFB?=
 =?utf-8?B?dVNjbDhnNitrUTVkSHZwSVMxazU5Qms0NlF1aS9EZGZHNHRNRjJYKzBOMDM2?=
 =?utf-8?B?K21wZDBxcytVcDJxUUtKN2RiUE11a0N2RzRmZ0F2VlBIRVBROFVwS2pSd1dh?=
 =?utf-8?Q?+m6s=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL3PR12MB6425D86DDF6DCA0475051544EE7E9BL3PR12MB6425namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6425.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aae228a-aa83-4838-dbb8-08db56f500aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 16:37:28.1065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iF+1by6zByYS1HmDeAEhZMdKRAGdjBi5tO3qtpHdnoZP/F+YLp5U0WER5GjRUQyuADrtzroOkzH5Gjh5mQ+Dbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_BL3PR12MB6425D86DDF6DCA0475051544EE7E9BL3PR12MB6425namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClJldmlld2VkLWJ5OiBNdWt1bCBK
b3NoaSA8bXVrdWwuam9zaGlAYW1kLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NClNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDE3LCAyMDIzIDEyOjI4IFBNDQpUbzogSm9zaGksIE11a3VsIDxNdWt1bC5K
b3NoaUBhbWQuY29tPg0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJA
YW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz47IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHUvZ21jOTogZml4IDY0IGJpdCBkaXZpc2lvbiBpbiBw
YXJ0aXRpb24gY29kZQ0KDQpDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFu
IEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2ht
ZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQoNCg0KT24gV2VkLCBNYXkgMTcs
IDIwMjMgYXQgMTI6MjbigK9QTSBKb3NoaSwgTXVrdWwgPE11a3VsLkpvc2hpQGFtZC5jb20+IHdy
b3RlOg0KPg0KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4NCj4NCj4gSGkg
QWxleCwNCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gb24gYmVoYWxmIG9m
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBNYXkgMTcsIDIwMjMgMTA6MzEgQU0NCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gQ2M6IERldWNoZXIsIEFs
ZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IENoZW4sIEd1Y2h1biA8R3VjaHVu
LkNoZW5AYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L2dtYzk6IGZpeCA2
NCBiaXQgZGl2aXNpb24gaW4gcGFydGl0aW9uIGNvZGUNCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNz
YWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlv
biB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5n
Lg0KPg0KPg0KPiBSZXdvcmsgbG9naWMgb3IgdXNlIGRvX2RpdigpIHRvIGF2b2lkIHByb2JsZW1z
IG9uIDMyIGJpdC4NCj4NCj4gdjI6IGFkZCBhIG1pc3NpbmcgY2FzZSBmb3IgWENQIG1hY3JvDQo+
DQo+IEFja2VkLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4gKHYxKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jIHwgMTQg
KysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmQuaCB8ICA5ICsrKystLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jICAgIHwgIDUgKysrKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMgICAgICB8IDExICsrKysrKy0tLS0tDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDI4IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZC5jDQo+IGluZGV4IDczOWViN2MwZDEzMy4uZmVkNTQ1Y2RkMWRlIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+IEBA
IC03OTQsMyArNzk0LDE3IEBAIHZvaWQgYW1kZ3B1X2FtZGtmZF91bmxvY2tfa2ZkKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KPiAgew0KPiAgICAgICAgIGtnZDJrZmRfdW5sb2NrX2tmZCgp
Ow0KPiAgfQ0KPiArDQo+ICsNCj4gK3U2NCBhbWRncHVfYW1ka2ZkX3hjcF9tZW1vcnlfc2l6ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHhjcF9pZCkNCj4gK3sNCj4gKyAgICAgICB1
NjQgdG1wOw0KPiArDQo+ICsgICAgICAgaWYgKGFkZXYtPmdtYy5udW1fbWVtX3BhcnRpdGlvbnMg
JiYgeGNwX2lkID49IDApIHsNCj4gKyAgICAgICAgICAgICAgIHRtcCA9IGFkZXYtPmdtYy5tZW1f
cGFydGl0aW9uc1tLRkRfWENQX01FTV9JRChhZGV2LCB4Y3BfaWQpXS5zaXplOw0KPiArICAgICAg
ICAgICAgICAgZG9fZGl2KHRtcCwgYWRldi0+eGNwX21nci0+bnVtX3hjcF9wZXJfbWVtX3BhcnRp
dGlvbik7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gdG1wOw0KPiArICAgICAgIH0gZWxzZSB7
DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gYWRldi0+Z21jLnJlYWxfdnJhbV9zaXplOw0KPiAr
ICAgICAgIH0NCj4gK30NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmQuaA0KPiBpbmRleCBiZTQzZDcxYmE3ZWYuLjk0Y2M0NTY3NjFlNSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KPiBAQCAtMzMzLDE1ICszMzMs
MTQgQEAgaW50IGFtZGdwdV9hbWRrZmRfcmVzZXJ2ZV9tZW1fbGltaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQo+ICB2b2lkIGFtZGdwdV9hbWRrZmRfdW5yZXNlcnZlX21lbV9saW1pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNp
emUsIHUzMiBhbGxvY19mbGFnLCBpbnQ4X3QgeGNwX2lkKTsNCj4NCj4gK3U2NCBhbWRncHVfYW1k
a2ZkX3hjcF9tZW1vcnlfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHhjcF9p
ZCk7DQo+ICsNCj4gICNkZWZpbmUgS0ZEX1hDUF9NRU1fSUQoYWRldiwgeGNwX2lkKSBcDQo+ICAg
ICAgICAgICAgICAgICAoKGFkZXYpLT54Y3BfbWdyICYmICh4Y3BfaWQpID49IDAgP1wNCj4gICAg
ICAgICAgICAgICAgIChhZGV2KS0+eGNwX21nci0+eGNwWyh4Y3BfaWQpXS5tZW1faWQgOiAtMSkN
Cj4NCj4gLSNkZWZpbmUgS0ZEX1hDUF9NRU1PUllfU0laRShhZGV2LCB4Y3BfaWQpXA0KPiAtICAg
ICAgICAgICAgICAgKChhZGV2KS0+Z21jLm51bV9tZW1fcGFydGl0aW9ucyAmJiAoeGNwX2lkKSA+
PSAwID9cDQo+IC0gICAgICAgICAgICAgICAoYWRldiktPmdtYy5tZW1fcGFydGl0aW9uc1tLRkRf
WENQX01FTV9JRCgoYWRldiksICh4Y3BfaWQpKV0uc2l6ZSAvXA0KPiAtICAgICAgICAgICAgICAg
KGFkZXYpLT54Y3BfbWdyLT5udW1feGNwX3Blcl9tZW1fcGFydGl0aW9uIDpcDQo+IC0gICAgICAg
ICAgICAgICAoYWRldiktPmdtYy5yZWFsX3ZyYW1fc2l6ZSkNCj4gKyNkZWZpbmUgS0ZEX1hDUF9N
RU1PUllfU0laRShhZGV2LCB4Y3BfaWQpIGFtZGdwdV9hbWRrZmRfeGNwX21lbW9yeV9zaXplKChh
ZGV2KSwgKHhjcF9pZCkpDQo+ICsNCj4NCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19IU0FfQU1E
KQ0KPiAgdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX2luaXRfbWVtX2xpbWl0cyh2b2lkKTsNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBpbmRleCBhZDY2NGVmNjQw
ZmYuLjM0NzI0Yjc3MWFjZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYw0KPiBAQCAtODE4LDExICs4MTgsMTQgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3R0bV9n
YXJ0X2JpbmRfZ2Z4OV9tcWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgICAgICAg
c3RydWN0IGFtZGdwdV90dG1fdHQgKmd0dCA9ICh2b2lkICopdHRtOw0KPiAgICAgICAgIHVpbnQ2
NF90IHRvdGFsX3BhZ2VzID0gdHRtLT5udW1fcGFnZXM7DQo+ICAgICAgICAgaW50IG51bV94Y2Mg
PSBtYXgoMVUsIGFkZXYtPmdmeC5udW1feGNjX3Blcl94Y3ApOw0KPiAtICAgICAgIHVpbnQ2NF90
IHBhZ2VfaWR4LCBwYWdlc19wZXJfeGNjID0gdG90YWxfcGFnZXMgLyBudW1feGNjOw0KPiArICAg
ICAgIHVpbnQ2NF90IHBhZ2VfaWR4LCBwYWdlc19wZXJfeGNjOw0KPiAgICAgICAgIGludCBpOw0K
PiAgICAgICAgIHVpbnQ2NF90IGN0cmxfZmxhZ3MgPSAoZmxhZ3MgJiB+QU1ER1BVX1BURV9NVFlQ
RV9WRzEwX01BU0spIHwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgQU1ER1BVX1BURV9NVFlQ
RV9WRzEwKEFNREdQVV9NVFlQRV9OQyk7DQo+DQo+ICsgICAgICAgcGFnZXNfcGVyX3hjYyA9IHRv
dGFsX3BhZ2VzOw0KPiArICAgICAgIGRvX2RpdihwYWdlc19wZXJfeGNjLCBudW1feGNjKTsNCj4g
Kw0KPiAgICAgICAgIGZvciAoaSA9IDAsIHBhZ2VfaWR4ID0gMDsgaSA8IG51bV94Y2M7IGkrKywg
cGFnZV9pZHggKz0gcGFnZXNfcGVyX3hjYykgew0KPiAgICAgICAgICAgICAgICAgLyogTVFEIHBh
Z2U6IHVzZSBkZWZhdWx0IGZsYWdzICovDQo+ICAgICAgICAgICAgICAgICBhbWRncHVfZ2FydF9i
aW5kKGFkZXYsDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBpbmRleCA5
MzhjOGRiYTkwNTcuLmQ1NTllN2JjMGYwOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jDQo+IEBAIC0xOTE5LDkgKzE5MTksMTAgQEAgZ21jX3Y5XzBfaW5pdF9hY3Bp
X21lbV9yYW5nZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgICAgICAgYWRldi0+
Z21jLm51bV9tZW1fcGFydGl0aW9ucyA9IG51bV9yYW5nZXM7DQo+DQo+ICAgICAgICAgLyogSWYg
dGhlcmUgaXMgb25seSBwYXJ0aXRpb24sIGRvbid0IHVzZSBlbnRpcmUgc2l6ZSAqLw0KPiAtICAg
ICAgIGlmIChhZGV2LT5nbWMubnVtX21lbV9wYXJ0aXRpb25zID09IDEpDQo+IC0gICAgICAgICAg
ICAgICBtZW1fcmFuZ2VzWzBdLnNpemUgPQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICAobWVt
X3Jhbmdlc1swXS5zaXplICogKG1lbV9ncm91cHMgLSAxKSAvIG1lbV9ncm91cHMpOw0KPiArICAg
ICAgIGlmIChhZGV2LT5nbWMubnVtX21lbV9wYXJ0aXRpb25zID09IDEpIHsNCj4gKyAgICAgICAg
ICAgICAgIG1lbV9yYW5nZXNbMF0uc2l6ZSA9IG1lbV9yYW5nZXNbMF0uc2l6ZSAqIChtZW1fZ3Jv
dXBzIC0gMSk7DQo+ICsgICAgICAgICAgICAgICBkb19kaXYobWVtX3Jhbmdlc1swXS5zaXplLCBt
ZW1fZ3JvdXBzKTsNCj4gKyAgICAgICB9DQo+ICB9DQo+DQo+ICBzdGF0aWMgdm9pZA0KPiBAQCAt
MTk1Myw4ICsxOTU0LDggQEAgZ21jX3Y5XzBfaW5pdF9zd19tZW1fcmFuZ2VzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LA0KPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAgfQ0K
Pg0KPiAtICAgICAgIHNpemUgPSAoYWRldi0+Z21jLnJlYWxfdnJhbV9zaXplID4+IEFNREdQVV9H
UFVfUEFHRV9TSElGVCkgLw0KPiAtICAgICAgICAgICAgICBhZGV2LT5nbWMubnVtX21lbV9wYXJ0
aXRpb25zOw0KPiArICAgICAgIHNpemUgPSBhZGV2LT5nbWMucmVhbF92cmFtX3NpemUgPj4gQU1E
R1BVX0dQVV9QQUdFX1NISUZUOw0KPiArICAgICAgIHNpemUgLz0gYWRldi0+Z21jLm51bV9tZW1f
cGFydGl0aW9uczsNCj4NCj4gRGlkIHlvdSBtaXNzIHVzaW5nIHRoZSBkb19kaXYoKSBoZXJlPw0K
DQpJdCdzIG5vdCBuZWVkZWQgaGVyZS4gIHNpemUgaXMgMzIgYml0cyBJSVJDLg0KDQpBbGV4DQoN
Cj4NCj4gVGhhbmtzLA0KPiBNdWt1bA0KPg0KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBhZGV2
LT5nbWMubnVtX21lbV9wYXJ0aXRpb25zOyArK2kpIHsNCj4gICAgICAgICAgICAgICAgIG1lbV9y
YW5nZXNbaV0ucmFuZ2UuZnBmbiA9IHN0YXJ0X2FkZHI7DQo+IC0tDQo+IDIuNDAuMQ0KPg0K

--_000_BL3PR12MB6425D86DDF6DCA0475051544EE7E9BL3PR12MB6425namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpBcmlh
bDtmb250LXNpemU6MTBwdDtjb2xvcjojMDAwMEZGO21hcmdpbjo1cHQ7IiBhbGlnbj0iTGVmdCI+
DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF08YnI+DQo8L3A+DQo8YnI+DQo8ZGl2
Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiIGNsYXNzPSJl
bGVtZW50VG9Qcm9vZiBDb250ZW50UGFzdGVkMCI+DQpSZXZpZXdlZC1ieTogTXVrdWwgSm9zaGkg
Jmx0O211a3VsLmpvc2hpQGFtZC5jb20mZ3Q7PGJyPg0KPC9kaXY+DQo8ZGl2IGlkPSJhcHBlbmRv
bnNlbmQiPjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0aDo5OCUi
IHRhYmluZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQg
ZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0i
IzAwMDAwMCI+PGI+RnJvbTo8L2I+IEFsZXggRGV1Y2hlciAmbHQ7YWxleGRldWNoZXJAZ21haWwu
Y29tJmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiBXZWRuZXNkYXksIE1heSAxNywgMjAyMyAxMjoyOCBQ
TTxicj4NCjxiPlRvOjwvYj4gSm9zaGksIE11a3VsICZsdDtNdWt1bC5Kb3NoaUBhbWQuY29tJmd0
Ozxicj4NCjxiPkNjOjwvYj4gRGV1Y2hlciwgQWxleGFuZGVyICZsdDtBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tJmd0OzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgJmx0O2FtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0OzsgQ2hlbiwgR3VjaHVuICZsdDtHdWNodW4uQ2hlbkBh
bWQuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1L2dt
Yzk6IGZpeCA2NCBiaXQgZGl2aXNpb24gaW4gcGFydGl0aW9uIGNvZGU8L2ZvbnQ+DQo8ZGl2PiZu
YnNwOzwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9
IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0
Ij5DYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJj
ZS4gVXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcg
bGlua3MsIG9yIHJlc3BvbmRpbmcuPGJyPg0KPGJyPg0KPGJyPg0KT24gV2VkLCBNYXkgMTcsIDIw
MjMgYXQgMTI6MjbigK9QTSBKb3NoaSwgTXVrdWwgJmx0O011a3VsLkpvc2hpQGFtZC5jb20mZ3Q7
IHdyb3RlOjxicj4NCiZndDs8YnI+DQomZ3Q7IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5l
cmFsXTxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBIaSBBbGV4LDxicj4NCiZndDs8YnI+
DQomZ3Q7IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPg0KJmd0OyBGcm9tOiBh
bWQtZ2Z4ICZsdDthbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0OyBvbiBi
ZWhhbGYgb2YgQWxleCBEZXVjaGVyICZsdDthbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tJmd0Ozxi
cj4NCiZndDsgU2VudDogV2VkbmVzZGF5LCBNYXkgMTcsIDIwMjMgMTA6MzEgQU08YnI+DQomZ3Q7
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAmbHQ7YW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcmZ3Q7PGJyPg0KJmd0OyBDYzogRGV1Y2hlciwgQWxleGFuZGVyICZsdDtBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tJmd0OzsgQ2hlbiwgR3VjaHVuICZsdDtHdWNodW4uQ2hlbkBh
bWQuY29tJmd0Ozxicj4NCiZndDsgU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L2dtYzk6IGZp
eCA2NCBiaXQgZGl2aXNpb24gaW4gcGFydGl0aW9uIGNvZGU8YnI+DQomZ3Q7PGJyPg0KJmd0OyBD
YXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4g
VXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlu
a3MsIG9yIHJlc3BvbmRpbmcuPGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IFJld29yayBs
b2dpYyBvciB1c2UgZG9fZGl2KCkgdG8gYXZvaWQgcHJvYmxlbXMgb24gMzIgYml0Ljxicj4NCiZn
dDs8YnI+DQomZ3Q7IHYyOiBhZGQgYSBtaXNzaW5nIGNhc2UgZm9yIFhDUCBtYWNybzxicj4NCiZn
dDs8YnI+DQomZ3Q7IEFja2VkLWJ5OiBHdWNodW4gQ2hlbiAmbHQ7Z3VjaHVuLmNoZW5AYW1kLmNv
bSZndDsgKHYxKTxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyICZsdDthbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tJmd0Ozxicj4NCiZndDsgLS0tPGJyPg0KJmd0OyZuYnNwOyBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAxNCArKysrKysrKysr
KysrKzxicj4NCiZndDsmbmJzcDsgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5oIHwmbmJzcDsgOSArKysrLS0tLS08YnI+DQomZ3Q7Jm5ic3A7IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyZuYnNwOyZuYnNwOyZuYnNwOyB8Jm5ic3A7IDUgKysr
Ky08YnI+DQomZ3Q7Jm5ic3A7IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfCAxMSArKysrKystLS0tLTxicj4NCiZndDsm
bmJzcDsgNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSk8
YnI+DQomZ3Q7PGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ft
ZGtmZC5jPGJyPg0KJmd0OyBpbmRleCA3MzllYjdjMGQxMzMuLmZlZDU0NWNkZDFkZSAxMDA2NDQ8
YnI+DQomZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQu
Yzxicj4NCiZndDsgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZC5jPGJyPg0KJmd0OyBAQCAtNzk0LDMgKzc5NCwxNyBAQCB2b2lkIGFtZGdwdV9hbWRrZmRfdW5s
b2NrX2tmZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik8YnI+DQomZ3Q7Jm5ic3A7IHs8YnI+
DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGtn
ZDJrZmRfdW5sb2NrX2tmZCgpOzxicj4NCiZndDsmbmJzcDsgfTxicj4NCiZndDsgKzxicj4NCiZn
dDsgKzxicj4NCiZndDsgK3U2NCBhbWRncHVfYW1ka2ZkX3hjcF9tZW1vcnlfc2l6ZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHhjcF9pZCk8YnI+DQomZ3Q7ICt7PGJyPg0KJmd0OyAr
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHU2NCB0bXA7PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGlmIChhZGV2
LSZndDtnbWMubnVtX21lbV9wYXJ0aXRpb25zICZhbXA7JmFtcDsgeGNwX2lkICZndDs9IDApIHs8
YnI+DQomZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdG1wID0gYWRldi0mZ3Q7Z21j
Lm1lbV9wYXJ0aXRpb25zW0tGRF9YQ1BfTUVNX0lEKGFkZXYsIHhjcF9pZCldLnNpemU7PGJyPg0K
Jmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGRvX2Rpdih0bXAsIGFkZXYtJmd0O3hj
cF9tZ3ItJmd0O251bV94Y3BfcGVyX21lbV9wYXJ0aXRpb24pOzxicj4NCiZndDsgKyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gdG1wOzxicj4NCiZndDsgKyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9IGVsc2Ugezxicj4NCiZndDsgKyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyByZXR1cm4gYWRldi0mZ3Q7Z21jLnJlYWxfdnJhbV9zaXplOzxicj4NCiZn
dDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0KJmd0OyArfTxi
cj4NCiZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaDxicj4N
CiZndDsgaW5kZXggYmU0M2Q3MWJhN2VmLi45NGNjNDU2NzYxZTUgMTAwNjQ0PGJyPg0KJmd0OyAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmg8YnI+DQomZ3Q7
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaDxicj4NCiZn
dDsgQEAgLTMzMywxNSArMzMzLDE0IEBAIGludCBhbWRncHVfYW1ka2ZkX3Jlc2VydmVfbWVtX2xp
bWl0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LDxicj4NCiZndDsmbmJzcDsgdm9pZCBhbWRn
cHVfYW1ka2ZkX3VucmVzZXJ2ZV9tZW1fbGltaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB1aW50NjRf
dCBzaXplLCB1MzIgYWxsb2NfZmxhZywgaW50OF90IHhjcF9pZCk7PGJyPg0KJmd0Ozxicj4NCiZn
dDsgK3U2NCBhbWRncHVfYW1ka2ZkX3hjcF9tZW1vcnlfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgaW50IHhjcF9pZCk7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyZuYnNwOyAjZGVmaW5l
IEtGRF9YQ1BfTUVNX0lEKGFkZXYsIHhjcF9pZCkgXDxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKChhZGV2KS0mZ3Q7eGNwX21nciAmYW1wOyZhbXA7ICh4
Y3BfaWQpICZndDs9IDAgP1w8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IChhZGV2KS0mZ3Q7eGNwX21nci0mZ3Q7eGNwWyh4Y3BfaWQpXS5tZW1faWQgOiAt
MSk8YnI+DQomZ3Q7PGJyPg0KJmd0OyAtI2RlZmluZSBLRkRfWENQX01FTU9SWV9TSVpFKGFkZXYs
IHhjcF9pZClcPGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICgoYWRldikt
Jmd0O2dtYy5udW1fbWVtX3BhcnRpdGlvbnMgJmFtcDsmYW1wOyAoeGNwX2lkKSAmZ3Q7PSAwID9c
PGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IChhZGV2KS0mZ3Q7Z21jLm1l
bV9wYXJ0aXRpb25zW0tGRF9YQ1BfTUVNX0lEKChhZGV2KSwgKHhjcF9pZCkpXS5zaXplIC9cPGJy
Pg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IChhZGV2KS0mZ3Q7eGNwX21nci0m
Z3Q7bnVtX3hjcF9wZXJfbWVtX3BhcnRpdGlvbiA6XDxicj4NCiZndDsgLSZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyAoYWRldiktJmd0O2dtYy5yZWFsX3ZyYW1fc2l6ZSk8YnI+DQomZ3Q7ICsj
ZGVmaW5lIEtGRF9YQ1BfTUVNT1JZX1NJWkUoYWRldiwgeGNwX2lkKSBhbWRncHVfYW1ka2ZkX3hj
cF9tZW1vcnlfc2l6ZSgoYWRldiksICh4Y3BfaWQpKTxicj4NCiZndDsgKzxicj4NCiZndDs8YnI+
DQomZ3Q7Jm5ic3A7ICNpZiBJU19FTkFCTEVEKENPTkZJR19IU0FfQU1EKTxicj4NCiZndDsmbmJz
cDsgdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX2luaXRfbWVtX2xpbWl0cyh2b2lkKTs8YnI+DQom
Z3Q7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmM8YnI+DQomZ3Q7IGluZGV4
IGFkNjY0ZWY2NDBmZi4uMzQ3MjRiNzcxYWNlIDEwMDY0NDxicj4NCiZndDsgLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jPGJyPg0KJmd0OyArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmM8YnI+DQomZ3Q7IEBAIC04MTgsMTEgKzgx
OCwxNCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdHRtX2dhcnRfYmluZF9nZng5X21xZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiw8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBhbWRncHVfdHRtX3R0ICpndHQgPSAodm9pZCAq
KXR0bTs8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IHVpbnQ2NF90IHRvdGFsX3BhZ2VzID0gdHRtLSZndDtudW1fcGFnZXM7PGJyPg0KJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBpbnQgbnVt
X3hjYyA9IG1heCgxVSwgYWRldi0mZ3Q7Z2Z4Lm51bV94Y2NfcGVyX3hjcCk7PGJyPg0KJmd0OyAt
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHVpbnQ2NF90IHBhZ2VfaWR4LCBw
YWdlc19wZXJfeGNjID0gdG90YWxfcGFnZXMgLyBudW1feGNjOzxicj4NCiZndDsgKyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB1aW50NjRfdCBwYWdlX2lkeCwgcGFnZXNfcGVy
X3hjYzs8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IGludCBpOzxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgdWludDY0X3QgY3RybF9mbGFncyA9IChmbGFncyAmYW1wOyB+QU1ER1BV
X1BURV9NVFlQRV9WRzEwX01BU0spIHw8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IEFNREdQVV9QVEVfTVRZUEVfVkcxMChBTURHUFVfTVRZUEVfTkMpOzxicj4NCiZndDs8
YnI+DQomZ3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcGFnZXNfcGVy
X3hjYyA9IHRvdGFsX3BhZ2VzOzxicj4NCiZndDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBkb19kaXYocGFnZXNfcGVyX3hjYywgbnVtX3hjYyk7PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBm
b3IgKGkgPSAwLCBwYWdlX2lkeCA9IDA7IGkgJmx0OyBudW1feGNjOyBpKyssIHBhZ2VfaWR4ICs9
IHBhZ2VzX3Blcl94Y2MpIHs8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IC8qIE1RRCBwYWdlOiB1c2UgZGVmYXVsdCBmbGFncyAqLzxicj4NCiZndDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYW1kZ3B1X2dhcnRfYmluZChhZGV2
LDxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jPGJyPg0KJmd0OyBp
bmRleCA5MzhjOGRiYTkwNTcuLmQ1NTllN2JjMGYwOSAxMDA2NDQ8YnI+DQomZ3Q7IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmM8YnI+DQomZ3Q7ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmM8YnI+DQomZ3Q7IEBAIC0xOTE5LDkgKzE5
MTksMTAgQEAgZ21jX3Y5XzBfaW5pdF9hY3BpX21lbV9yYW5nZXMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsPGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBhZGV2LSZndDtnbWMubnVtX21lbV9wYXJ0aXRpb25zID0gbnVtX3Jhbmdlczs8
YnI+DQomZ3Q7PGJyPg0KJmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyAvKiBJZiB0aGVyZSBpcyBvbmx5IHBhcnRpdGlvbiwgZG9uJ3QgdXNlIGVudGly
ZSBzaXplICovPGJyPg0KJmd0OyAtJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IGlmIChhZGV2LSZndDtnbWMubnVtX21lbV9wYXJ0aXRpb25zID09IDEpPGJyPg0KJmd0OyAtJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IG1lbV9yYW5nZXNbMF0uc2l6ZSA9PGJyPg0KJmd0OyAt
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IChtZW1fcmFuZ2VzWzBdLnNpemUgKiAobWVtX2dyb3VwcyAtIDEp
IC8gbWVtX2dyb3Vwcyk7PGJyPg0KJmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IGlmIChhZGV2LSZndDtnbWMubnVtX21lbV9wYXJ0aXRpb25zID09IDEpIHs8YnI+DQom
Z3Q7ICsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgbWVtX3Jhbmdlc1swXS5zaXplID0gbWVt
X3Jhbmdlc1swXS5zaXplICogKG1lbV9ncm91cHMgLSAxKTs8YnI+DQomZ3Q7ICsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgZG9fZGl2KG1lbV9yYW5nZXNbMF0uc2l6ZSwgbWVtX2dyb3Vwcyk7
PGJyPg0KJmd0OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IH08YnI+DQom
Z3Q7Jm5ic3A7IH08YnI+DQomZ3Q7PGJyPg0KJmd0OyZuYnNwOyBzdGF0aWMgdm9pZDxicj4NCiZn
dDsgQEAgLTE5NTMsOCArMTk1NCw4IEBAIGdtY192OV8wX2luaXRfc3dfbWVtX3JhbmdlcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiw8YnI+DQomZ3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGJyZWFrOzxicj4NCiZndDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgfTxicj4NCiZndDs8YnI+DQomZ3Q7IC0mbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc2l6ZSA9IChhZGV2LSZndDtnbWMucmVhbF92cmFt
X3NpemUgJmd0OyZndDsgQU1ER1BVX0dQVV9QQUdFX1NISUZUKSAvPGJyPg0KJmd0OyAtJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGFkZXYtJmd0O2dtYy5udW1fbWVtX3BhcnRpdGlvbnM7PGJyPg0KJmd0
OyArJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHNpemUgPSBhZGV2LSZndDtn
bWMucmVhbF92cmFtX3NpemUgJmd0OyZndDsgQU1ER1BVX0dQVV9QQUdFX1NISUZUOzxicj4NCiZn
dDsgKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzaXplIC89IGFkZXYtJmd0
O2dtYy5udW1fbWVtX3BhcnRpdGlvbnM7PGJyPg0KJmd0Ozxicj4NCiZndDsgRGlkIHlvdSBtaXNz
IHVzaW5nIHRoZSBkb19kaXYoKSBoZXJlPzxicj4NCjxicj4NCkl0J3Mgbm90IG5lZWRlZCBoZXJl
LiZuYnNwOyBzaXplIGlzIDMyIGJpdHMgSUlSQy48YnI+DQo8YnI+DQpBbGV4PGJyPg0KPGJyPg0K
Jmd0Ozxicj4NCiZndDsgVGhhbmtzLDxicj4NCiZndDsgTXVrdWw8YnI+DQomZ3Q7PGJyPg0KJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBmb3IgKGkg
PSAwOyBpICZsdDsgYWRldi0mZ3Q7Z21jLm51bV9tZW1fcGFydGl0aW9uczsgKytpKSB7PGJyPg0K
Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBtZW1fcmFuZ2VzW2ld
LnJhbmdlLmZwZm4gPSBzdGFydF9hZGRyOzxicj4NCiZndDsgLS08YnI+DQomZ3Q7IDIuNDAuMTxi
cj4NCiZndDs8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_BL3PR12MB6425D86DDF6DCA0475051544EE7E9BL3PR12MB6425namp_--
