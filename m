Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF054FED58
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Apr 2022 05:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35A510FB72;
	Wed, 13 Apr 2022 03:07:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7C110FB72
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Apr 2022 03:07:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMpAQz7kpZrtRnvvsCPQB2MWBsak3HHGpwPFyXGW3ItQ8+UmIX/Pmnj9bk624G92VN2a00xVesgHy255Pkn9T27tGaoCvDYynzur62wR1aQ6qumHmjPMw2wMnR72X6JZEl4KnSO0Y+tqBE0CFap4hc1a653LkbTcshP0GXZ5SdH089eylf406mLE+EqC72uQaF+LCv7BTM1rhd20+nNdKaNvzNvKU37WsEK3T65UTV/Zz1atSN83G3ovN1qvZMugusL/6pQlRXCSD9MRnq9g2Sw7m4r53V+jRMlh+xZOhL0eurgKB0D3DuMIZw6QNWkOVT/29rPNcBmiSp6kUssi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9Os/sLNmAofUN30YM6t/dwB/nLWK2h2WuAezdQkAyU=;
 b=HXtBFfmT8qjmzBhoOO3F4crlTH8HjgMYl6LA6TFQQQB/NZBkGzc/gw/j9aDCcyU7fiJ6Z8aE2gUcka1MFBTpeNOKz7+Xrlj93oPpWuguZfY9ni3QiC8StrucMsiDX9M9jTwPQsWoFZ5eaVKEO1kt1OiVzbB7lOU63Rpt6j3mRgybX0vbn98kOdjM2g3x1giMWj33JvxsrhJRZ8RtPopirZt0cXNyZesC8wFqnVBvoufd/kvmgaebXCNNuY3EkOKq9NJSolZZfpsVy5zIpZMsfB5rcvUe+FDyfcb8RwVCqWiANwSWM8lzlY8bWqTjPN+hSgACUUU7oTLgA46XAN9Lxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9Os/sLNmAofUN30YM6t/dwB/nLWK2h2WuAezdQkAyU=;
 b=wYcjxrluzos9AbDLwdVs0tifa+4Bg1gC4C1S4UGrun1n3hYmS+UJ2e1Rdsw5S4x/1aCyv9ai9I3bXtX0iPTFsveY/M0hZWwrxeID7RlvwQ/qPsE8z7ds9dx2q9e/4khLYph+bfPb71V9CIqeNyOMEttyGeJVQh2c5hzropmUtxI=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 SN6PR12MB4622.namprd12.prod.outlook.com (2603:10b6:805:e2::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 03:07:08 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3888:87bd:3e3a:e353]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::3888:87bd:3e3a:e353%4]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 03:07:08 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBvbmUgdXNlLWFmdGVy?=
 =?utf-8?Q?-free_of_VM?=
Thread-Topic: [PATCH] drm/amdgpu: Fix one use-after-free of VM
Thread-Index: AQHYTmVfgaQlLJirgkifYfsmOPgGKazsMB+AgAD4iGg=
Date: Wed, 13 Apr 2022 03:07:08 +0000
Message-ID: <DM4PR12MB5165048F72922FDF9211ADA087EC9@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20220412120322.28169-1-xinhui.pan@amd.com>
 <299dca93-dc4d-8b1a-6de7-bfab8ebc8c19@amd.com>
In-Reply-To: <299dca93-dc4d-8b1a-6de7-bfab8ebc8c19@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-13T03:07:06.571Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: a6744fef-13c8-c652-7b70-5a2f1486b135
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54dc4e02-1e6e-4daf-9690-08da1cfab279
x-ms-traffictypediagnostic: SN6PR12MB4622:EE_
x-microsoft-antispam-prvs: <SN6PR12MB46227AC366457EA30AD47F9287EC9@SN6PR12MB4622.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mU3XnjkB+nn+hfKCgBceBk/ketK8JJ2UenwBZKOiLQAOSI4n/JoRyMJLcpjWve7MaRmp5YdhtsdpxMT18O9fDHIfVT5uwqlMn4YHYg5apPv/B5i4CU6RfyhM+M85fQPCTzpJHghOMdwjYmCvXwYlKuMtnOTFYsnAdSwqjdlNOy1S0yLSLEu0e6gSgqsqhVle47HyVqK69RXh7dq0hTBaqr4bTqdgXal+0SflZ4QWvoHmf0rCMnLcV1dtDipFKlob8MEwfVmtjo5g1ryJ7du58/vT8ohoS1VzIOKMRs2snkMFTnzHbcQ57dSdkmbYd7MkyZ2xuX4EbvpcXTSlXRlAG5iuisc+aZw/11aK42FkxOnTI3FF4DfpO1pBMyEmAdmczXHbRjnjpM0Zio6kK65lwHpj4nDf8X+8h7Z8ugZotsSDt2FcJzU9nFJgVkMokb4AtBCaQMwrRwyqjfBSJbw/wysEfk74Lcg24EcPvzO3P/48x6tcce8XhvLs+o5WnWw4qAKRja2n1NrVqebvSN4tQwIdLNg38ohZkFrqWxL3Kc58pjUZ51txwcgAuxf1vjs2o/m6cMFfvwi8LCt6nT6CY6ZJtUTE71q7pPVN/O8yfioRrVA4kLqEdBpUaQV4ZNtR0XZd+UVjo0UY5aF3CuIHOdNRonWj2IeORZelkzDUFqspFOwvGT5PJEU5Y43SxRn4WCvOitlmLW6cqJpoKocfBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(316002)(26005)(66446008)(91956017)(38100700002)(4326008)(76116006)(8936002)(33656002)(55016003)(224303003)(508600001)(110136005)(71200400001)(86362001)(186003)(64756008)(66556008)(66476007)(66946007)(83380400001)(9686003)(7696005)(6506007)(38070700005)(2906002)(52536014)(5660300002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDRpOTQxSU95dzJvNUpCN1o1UlVjU21nZG1oOWNIRTFqZTBkd0NaYTU2UkVR?=
 =?utf-8?B?TlhOSlRaaXI3cjI5UHNRTXcyek43akZ0MmZsSTlhNFpZeGVCUUlIN3hDY0Fw?=
 =?utf-8?B?OWQxaDJGOHNYSjFpZ1VYbytVK00vdy92ZSt3b3BmMGJpc2MvNFhMQzJ5Z0Ez?=
 =?utf-8?B?RkNaM0svZ1laYVBlZU9LT2dMSzUweWc0TnZEelo3RlZoZ3JjMURBUjlTc2xz?=
 =?utf-8?B?SnJ2REEraDFKSldIRVZQRzF0TEF2KzEvVmhTelA2WTNiNjE0d3dYdDNZaWVz?=
 =?utf-8?B?SURSTDlOL2swZjRRS0RmK0g1dHRMTittd0tqNGVxNWhzT0xUTkNkcklDK252?=
 =?utf-8?B?NUUwaWxQck1jMktyY3d3Q3pkZjNuK0lYT2svOStOSlgwYnRQZXV0Uy8wL21v?=
 =?utf-8?B?dG9YUmpYVHVPRGtIL0tpNlcyR1hvUmFSZVdHSHJNSjZBNTNkOTFtbkM3THFz?=
 =?utf-8?B?eSs3MFVWZTdpSmtaWmRJS2xnb3hXdnc1TDV1MEpieWNCRzU5ZmMzRjNoTUVh?=
 =?utf-8?B?Wk9namlWWUR0ZUk0VytJMXBrUTlFejRXK0NtT3JCRWlzb0gwUUhBVkpxRFJ2?=
 =?utf-8?B?ZXZNK0VVMDRvbFJGeTNNN3lqbmVlNUxaQ2sreG8wdUt0Q3dqL2tnUXIxd3oy?=
 =?utf-8?B?ODBYaUxjMjhITDQ0L0tLUmVmQi9teVo5ZWg5dEhmNXpVSlNEV2xZVGczM1BF?=
 =?utf-8?B?UVk5WnlZKys4VG5MekRSRVV3REJITmI0MkI3U29QeEJTWUFPQnRRSE5kTW1a?=
 =?utf-8?B?allrcE5vZDVSZkVvb0xkZEF4LzZQZlJuekV2dVdzQlhWS1Fmc0lCakd1eDZ2?=
 =?utf-8?B?aTJ0WngvWWlSQUY5RkVjUkQzMmc3M2xLZnlRbzZBbXJrTGtlTWNhZ0dMUWlN?=
 =?utf-8?B?c2JRZHdFMkVPeHV6Q1VKREtBMGN0ZGJIeUtkSVdTeTBUVnA0ci9uWU5wQkdR?=
 =?utf-8?B?ZnhRcjlLZjFJRkNTa2RlWEY0K3VQcjJEUlJPUjdwRkdHZWxXU29OQUMrQjhD?=
 =?utf-8?B?OUk0ZG4vdE0zMXhtVkt5bEhjSU02clYwc1ZVZUwwOE5WY3Z2VGFNTXhLMFRQ?=
 =?utf-8?B?V2dwR0JOYmV1Zzd1VWcxUC9GZWNLczd6SWlxcE9tWHBWVjZ6QVVFa0MyTDdv?=
 =?utf-8?B?NGNadXgrK0tWTXlZRytlNk9LK0pGR3FtTFNxME9mQ2VENHcrTlpaQmRlYlpX?=
 =?utf-8?B?cXFzRDJmcTRiRTZlQnU3RXZlVmFveG1WM21IRmttYmZqdUg2RHZ4ZTExU0VX?=
 =?utf-8?B?dFZ3N1BPaGYybkQvOXdZQzVqZHJCYW1FRHB6TkdEem5nVnFDWTk5ak1JY3JC?=
 =?utf-8?B?ZGZDblR6cjJyZHpQZVNJQ0RjNTRzRFlxb1BOdHJFUVJHbVVoTmhCZlQrbWwx?=
 =?utf-8?B?QXZTbmJseDMrcEZKWDRZT0M3V0JkbHlTSkpDK242eDJKMVBnZGJkbTh4RmdH?=
 =?utf-8?B?WnB1Y003bEVUaC9LdHRYTlFHMk9HWWNPZDk4aFNCYUdvYWRrcERhV2xpUDFO?=
 =?utf-8?B?cXIzN0Q3Wi9rajFjQVFlVExnbkoyeGhaSC8zYkdBYmxVcXd4Y0tSNjZLTk54?=
 =?utf-8?B?RGl0clRJbjhlb0I1Um9vNnV5SmZOSUg2Vm5XSFdLajlhazFDNVdyc1VDOTV5?=
 =?utf-8?B?RjZKb1JZVm1rVThBdUNrenJWdXRXSmJ3eFplb2RpTWtveTZiR2s3Y3h4OUFy?=
 =?utf-8?B?VTR3dE42RkFyQUhsQURVRHY1SlJLaHVkbCtjd3RsV3IzMkM5cDlDUVFtV3By?=
 =?utf-8?B?ZjFabmFiTTlIOUFFSEFoZXhJUDJCWEh0bGZHZTBSMnRlOVFENHREcEo1VWp5?=
 =?utf-8?B?S2Y5aGZnRXdKWHd1enovS29VK1QzRVpORDJZS004aXJ6M1hVb3VFU25UR2Q3?=
 =?utf-8?B?aFpGYUdQeDFBREVIUEZWZDJNVVA5dlprOXNiMkZ0TUYxcWNCU25rOEVnbWZO?=
 =?utf-8?B?Nk5lNVZQcWlpd0xLQkk5RzRTL011RTR3aVR6QTR6YVluR1JGTGJFWHU3ajhS?=
 =?utf-8?B?RkZxZHN6TGI3TnUyWFYxSVZ4eWVxSzN2THh5cWdlOE5TcytFejNjNWp3TVJZ?=
 =?utf-8?B?MFQzci9HRm5lL1NtSE9tUGJjbm9Vd0NSRyt4UVJIZ3J6ZGE3bUp4N3BxRC8v?=
 =?utf-8?B?MzlodTh3QzVrL054bTZab3Z1NHJUN01WT291VEZhY3NKc3FGajcwYnl1Ti9y?=
 =?utf-8?B?ZHB5MzNhUlJjMHEwREZlV2J3cWJuQ3NBclgyKzR0cmVzenBCMW1xNlBITDQz?=
 =?utf-8?B?N1NKVWZEbUlGNGpkVW1WQUc3M3N1YXhTelFLcTJRNi9oUWc5SVdFMVNLSjM1?=
 =?utf-8?Q?0fl32/VJ0gUO2v/BCk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dc4e02-1e6e-4daf-9690-08da1cfab279
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 03:07:08.6653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCpYmBZR2TQOaMuK7FtEZZIS9/jjzT+nl6k/OfuE3el85dq+X6y13WI8E58vV9y0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4622
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0Kd2UgbWFrZSBzb21ldGhpbmcgbGlrZSBkbWFfZmVu
Y2VfcmVsZWFzZSBkb2VzLg0KDQpAQCAtNzgzLDExICs3ODMsMTUgQEAgZG1hX2ZlbmNlX2RlZmF1
bHRfd2FpdChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgYm9vbCBpbnRyLCBzaWduZWQgbG9uZyB0
aW1lb3V0KQ0KICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KICAgICAgICBzaWduZWQgbG9u
ZyByZXQgPSB0aW1lb3V0ID8gdGltZW91dCA6IDE7DQoNCi0gICAgICAgaWYgKHRlc3RfYml0KERN
QV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmZlbmNlLT5mbGFncykpDQorICAgICAgIGlmICh0
ZXN0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+ZmxhZ3MpICYmDQor
ICAgICAgICAgICBsaXN0X2VtcHR5KCZmZW5jZS0+Y2JfbGlzdCkpDQogICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsNCg0KICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZShmZW5jZS0+bG9jaywgZmxh
Z3MpOw0KDQorICAgICAgIGlmICh0ZXN0X2JpdChETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQs
ICZmZW5jZS0+ZmxhZ3MpKQ0KKyAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KKw0KICAgICAgICBp
ZiAoaW50ciAmJiBzaWduYWxfcGVuZGluZyhjdXJyZW50KSkgew0KICAgICAgICAgICAgICAgIHJl
dCA9IC1FUkVTVEFSVFNZUzsNCiAgICAgICAgICAgICAgICBnb3RvIG91dDsNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCuWPkeS7tuS6ujogS29lbmlnLCBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCuWPkemAgeaXtumXtDogMjAyMuW5tDTmnIgx
MuaXpSAyMDoxMQ0K5pS25Lu25Lq6OiBQYW4sIFhpbmh1aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IERhbmllbCBWZXR0ZXINCuaKhOmAgTogRGV1Y2hlciwgQWxleGFuZGVyDQrkuLvp
opg6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IEZpeCBvbmUgdXNlLWFmdGVyLWZyZWUgb2YgVk0N
Cg0KQW0gMTIuMDQuMjIgdW0gMTQ6MDMgc2NocmllYiB4aW5odWkgcGFuOg0KPiBWTSBtaWdodCBh
bHJlYWR5IGJlIGZyZWVkIHdoZW4gYW1kZ3B1X3ZtX3RsYl9zZXFfY2IoKSBpcyBjYWxsZWQuDQo+
IFdlIHNlZSB0aGUgY2FsbHRyYWNlIGJlbG93Lg0KPg0KPiBGaXggaXQgYnkga2VlcGluZyB0aGUg
bGFzdCBmbHVzaCBmZW5jZSBhcm91bmQgYW5kIHdhaXQgZm9yIGl0IHRvIHNpZ25hbA0KPg0KPiBC
VUcga21hbGxvYy00ayAoTm90IHRhaW50ZWQpOiBQb2lzb24gb3ZlcndyaXR0ZW4NCj4NCj4gMHhm
ZmZmOWM4ODYzMDQxNGU4LTB4ZmZmZjljODg2MzA0MTRlOCBAb2Zmc2V0PTUzNTIuIEZpcnN0IGJ5
dGUgMHg2Yw0KPiBpbnN0ZWFkIG9mIDB4NmIgQWxsb2NhdGVkIGluIGFtZGdwdV9kcml2ZXJfb3Bl
bl9rbXMrMHg5ZC8weDM2MCBbYW1kZ3B1XQ0KPiBhZ2U9NDQgY3B1PTAgcGlkPTIzNDMNCj4gICBf
X3NsYWJfYWxsb2MuaXNyYS4wKzB4NGYvMHg5MA0KPiAgIGttZW1fY2FjaGVfYWxsb2NfdHJhY2Ur
MHg2YjgvMHg3YTANCj4gICBhbWRncHVfZHJpdmVyX29wZW5fa21zKzB4OWQvMHgzNjAgW2FtZGdw
dV0NCj4gICBkcm1fZmlsZV9hbGxvYysweDIyMi8weDNlMCBbZHJtXQ0KPiAgIGRybV9vcGVuKzB4
MTFkLzB4NDEwIFtkcm1dDQo+ICAgZHJtX3N0dWJfb3BlbisweGRjLzB4MjMwIFtkcm1dDQo+ICAg
Y2hyZGV2X29wZW4rMHhhNS8weDFlMA0KPiAgIGRvX2RlbnRyeV9vcGVuKzB4MTZjLzB4M2MwDQo+
ICAgdmZzX29wZW4rMHgyZC8weDMwDQo+ICAgcGF0aF9vcGVuYXQrMHg3MGEvMHhhOTANCj4gICBk
b19maWxwX29wZW4rMHhiMi8weDEyMA0KPiAgIGRvX3N5c19vcGVuYXQyKzB4MjQ1LzB4MzMwDQo+
ICAgZG9fc3lzX29wZW4rMHg0Ni8weDgwDQo+ICAgX194NjRfc3lzX29wZW5hdCsweDIwLzB4MzAN
Cj4gICBkb19zeXNjYWxsXzY0KzB4MzgvMHhjMA0KPiAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJf
aHdmcmFtZSsweDQ0LzB4YWUNCj4gRnJlZWQgaW4gYW1kZ3B1X2RyaXZlcl9wb3N0Y2xvc2Vfa21z
KzB4M2U5LzB4NTUwIFthbWRncHVdIGFnZT0yMiBjcHU9MQ0KPiBwaWQ9MjQ4NQ0KPiAgIGtmcmVl
KzB4NGEyLzB4NTgwDQo+ICAgYW1kZ3B1X2RyaXZlcl9wb3N0Y2xvc2Vfa21zKzB4M2U5LzB4NTUw
IFthbWRncHVdDQo+ICAgZHJtX2ZpbGVfZnJlZSsweDI0ZS8weDNjMCBbZHJtXQ0KPiAgIGRybV9j
bG9zZV9oZWxwZXIuaXNyYS4wKzB4OTAvMHhiMCBbZHJtXQ0KPiAgIGRybV9yZWxlYXNlKzB4OTcv
MHgxYTAgW2RybV0NCj4gICBfX2ZwdXQrMHhiNi8weDI4MA0KPiAgIF9fX19mcHV0KzB4ZS8weDEw
DQo+ICAgdGFza193b3JrX3J1bisweDY0LzB4YjANCj4gICBkb19leGl0KzB4NDA2LzB4Y2YwDQo+
ICAgZG9fZ3JvdXBfZXhpdCsweDUwLzB4YzANCj4gICBfX3g2NF9zeXNfZXhpdF9ncm91cCsweDE4
LzB4MjANCj4gICBkb19zeXNjYWxsXzY0KzB4MzgvMHhjMA0KPiAgIGVudHJ5X1NZU0NBTExfNjRf
YWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YWUNCj4NCj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IHhpbmh1aSBw
YW4gPHhpbmh1aS5wYW5AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmMgfCAyMiArKysrKysrKysrKysrKysrKysrLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggfCAgMSArDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiBpbmRleCA2NDVjZTI4Mjc3YzIuLmUyNDg2ZTk1Y2E2
OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4gQEAgLTkz
Miw5ICs5MzIsMTIgQEAgaW50IGFtZGdwdV92bV91cGRhdGVfcmFuZ2Uoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLA0KPg0KPiAgICAgICBpZiAoZmx1c2hf
dGxiIHx8IHBhcmFtcy50YWJsZV9mcmVlZCkgew0KPiAgICAgICAgICAgICAgIHRsYl9jYi0+dm0g
PSB2bTsNCj4gLSAgICAgICAgICAgICBpZiAoIWZlbmNlIHx8ICEqZmVuY2UgfHwNCj4gLSAgICAg
ICAgICAgICAgICAgZG1hX2ZlbmNlX2FkZF9jYWxsYmFjaygqZmVuY2UsICZ0bGJfY2ItPmNiLA0K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV92bV90bGJf
c2VxX2NiKSkNCj4gKyAgICAgICAgICAgICBpZiAoZmVuY2UgJiYgKmZlbmNlICYmDQo+ICsgICAg
ICAgICAgICAgICAgICFkbWFfZmVuY2VfYWRkX2NhbGxiYWNrKCpmZW5jZSwgJnRsYl9jYi0+Y2Is
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X3ZtX3Rs
Yl9zZXFfY2IpKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICBkbWFfZmVuY2VfcHV0KHZtLT5s
YXN0X2RlbGF5ZWRfdGxiX2ZsdXNoKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgIHZtLT5sYXN0
X2RlbGF5ZWRfdGxiX2ZsdXNoID0gZG1hX2ZlbmNlX2dldCgqZmVuY2UpOw0KPiArICAgICAgICAg
ICAgIH0gZWxzZQ0KPiAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X3ZtX3RsYl9zZXFfY2Io
TlVMTCwgJnRsYl9jYi0+Y2IpOw0KPiAgICAgICAgICAgICAgIHRsYl9jYiA9IE5VTEw7DQo+ICAg
ICAgIH0NCj4gQEAgLTIyNTgsNiArMjI2MSwxOSBAQCB2b2lkIGFtZGdwdV92bV9maW5pKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkNCj4gICAgICAgZG1h
X2ZlbmNlX3dhaXQodm0tPmxhc3RfdW5sb2NrZWQsIGZhbHNlKTsNCj4gICAgICAgZG1hX2ZlbmNl
X3B1dCh2bS0+bGFzdF91bmxvY2tlZCk7DQo+DQo+ICsgICAgIGlmICh2bS0+bGFzdF9kZWxheWVk
X3RsYl9mbHVzaCkgew0KDQpZb3UgY2FuIGluaXRpYWxpemUgbGFzdF9kZWxheWVkX3RsYl9mbHVz
aCgpIHdpdGggdGhlIGR1bW15IGZlbmNlLCBzZWUNCmhvdyBsYXN0X3VubG9ja2VkIHdvcmtzLg0K
DQo+ICsgICAgICAgICAgICAgLyogV2FpdCB1bnRpbCBmZW5jZSBpcyBzaWduYWxlZC4NCj4gKyAg
ICAgICAgICAgICAgKiBCdXQgbXVzdCBkb3VibGUgY2hlY2sgdG8gbWFrZSBzdXJlIGZlbmNlIGNi
IGlzIGNhbGxlZC4NCj4gKyAgICAgICAgICAgICAgKiBBcyBkbWFfZmVuY2VfZGVmYXVsdF93YWl0
IGNoZWNrcyBETUFfRkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQgd2l0aG91dA0KPiArICAgICAgICAg
ICAgICAqIGhvbGRpbmcgZmVuY2UgbG9jayh0aGUgZmlyc3QgdGVzdF9iaXQpLg0KPiArICAgICAg
ICAgICAgICAqIFNvIGNhbGwgZG1hX2ZlbmNlX2dldF9zdGF0dXMgd2hpY2ggd2lsbCBob2xkIHRo
ZSBmZW5jZSBsb2NrLg0KPiArICAgICAgICAgICAgICAqIFRoZW4gd2UgY2FuIG1ha2Ugc3VyZSBm
ZW5jZSBjYiBoYXMgYmVlbiBjYWxsZWQuDQo+ICsgICAgICAgICAgICAgICovDQoNClVmZiwgdGhh
dCBpcyBhIHJlYWxseSBnb29kIHBvaW50IGFuZCBtb3N0IGxpa2VseSBhIGJ1ZyBpbiBkbWFfZmVu
Y2Vfd2FpdCgpLg0KDQpJJ20gcHJldHR5IHN1cmUgdGhhdCBhIGNvdXBsZSBvZiBvdGhlciBjYWxs
ZXJzIHJlbHkgb24gdGhhdCBhcyB3ZWxsLg0KDQpEYW5pZWwgd2hhdCdzIHlvdSBvcGluaW9uIGFi
b3V0IHRoYXQ/DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPiArICAgICAgICAgICAgICh2b2lk
KWRtYV9mZW5jZV93YWl0KHZtLT5sYXN0X2RlbGF5ZWRfdGxiX2ZsdXNoLCBmYWxzZSk7DQo+ICsg
ICAgICAgICAgICAgKHZvaWQpZG1hX2ZlbmNlX2dldF9zdGF0dXModm0tPmxhc3RfZGVsYXllZF90
bGJfZmx1c2gpOw0KPiArICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQodm0tPmxhc3RfZGVsYXll
ZF90bGJfZmx1c2gpOw0KPiArICAgICB9DQo+ICsNCj4gICAgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKG1hcHBpbmcsIHRtcCwgJnZtLT5mcmVlZCwgbGlzdCkgew0KPiAgICAgICAgICAgICAg
IGlmIChtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfUFJUICYmIHBydF9maW5pX25lZWRlZCkg
ew0KPiAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X3ZtX3BydF9maW5pKGFkZXYsIHZtKTsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgNCj4gaW5kZXggMWE4MTRmYmZm
ZmY4Li5jMWE0OGY1YzEwMTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5oDQo+IEBAIC0yODYsNiArMjg2LDcgQEAgc3RydWN0IGFtZGdwdV92bSB7DQo+DQo+ICAg
ICAgIC8qIExhc3QgZmluaXNoZWQgZGVsYXllZCB1cGRhdGUgKi8NCj4gICAgICAgYXRvbWljNjRf
dCAgICAgICAgICAgICAgdGxiX3NlcTsNCj4gKyAgICAgc3RydWN0IGRtYV9mZW5jZSAgICAgICAg
Kmxhc3RfZGVsYXllZF90bGJfZmx1c2g7DQo+DQo+ICAgICAgIC8qIExhc3QgdW5sb2NrZWQgc3Vi
bWlzc2lvbiB0byB0aGUgc2NoZWR1bGVyIGVudGl0aWVzICovDQo+ICAgICAgIHN0cnVjdCBkbWFf
ZmVuY2UgICAgICAgICpsYXN0X3VubG9ja2VkOw0KDQo=
