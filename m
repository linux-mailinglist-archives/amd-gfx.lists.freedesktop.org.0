Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21BF78864F
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Aug 2023 13:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDF10E650;
	Fri, 25 Aug 2023 11:48:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2730E10E650
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Aug 2023 11:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnDuC5DmHRlY0ksF8TuwtpX9uPTr9FDmLtQRYcb2jHD/n6qA1Wk9v1JDm4V18Dx943ICDXqc097+MENSSLPTZdcfzg5y4I04JLaQbTVh/nWBmIF+sKVk9oYlC5oDRHZOx3EUhuOuuxWOV+x3uQn0kRhLXMUDJMWgVsWvsoEF/XGbGVBSvHtqMmwG35WVM8LHBAsF/RZohwWCVs/+QMH1hQSZLAtovpvDJgNOAW6qDgqH9ur3p7/hck3a/FnX4ItgBDfZEuMZWfk0deC8M8/ETTsXVeizWSziJHphfhSOSPiszHqpAKIqyBw37OaePSR76Z9xf8lDH/flUJ2XNb1JKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lF+GuBml5ExAcOGvHc//GnHnZ/Lip3QxGWUOGwddQTE=;
 b=GaA98JuBa4JG1d6e0NWyEIzO0Jw6BjJfDu6t7vkUlBEaKv86e+fgDZAI4uP3WfRBPjxVQt6qKDeGKHa3vZtwUXL6pCyXuYYUlJKcPa/Z+gRtK9ssw6vaZ7TjNpfy9K91ZwSSSh9GXc0n/TiE9NYSpEwlTYY0lh1wKfyZqaTLYe4vKBwn85qJwZmSPsEX/y7Gg2bH7QTjxrpPQSRcIMyJymNPQy3B3Ok7BZKMoM/icaSJG9hOpvifJIGNt7LOaIlI/cKh0Jk5QoHRdR8EsxTkzEWKK4QIa7PKRAtEpuL5XtxlhPUe4LkxKY7tRnf3OzeKmjvGVB9krUNIrGPYAbR2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lF+GuBml5ExAcOGvHc//GnHnZ/Lip3QxGWUOGwddQTE=;
 b=u8BJvYUycx5UpE0ppCc5v/XbWGsc8j1smKX3PxRALMC6IXBtIAc7syekL04wFXSFOludsqdDIX5l4+cCfFVNQbCsBK/pwBEIdbrTGCVT6lJIewc0n9ZR3mX82ViARho/gbZsieTu+igVqEKfd+f6KhIQwPLobVehWSRbSG1I0OQ=
Received: from CY5PR12MB6081.namprd12.prod.outlook.com (2603:10b6:930:2b::15)
 by MW4PR12MB7287.namprd12.prod.outlook.com (2603:10b6:303:22c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 11:48:11 +0000
Received: from CY5PR12MB6081.namprd12.prod.outlook.com
 ([fe80::73b9:287c:a30c:214d]) by CY5PR12MB6081.namprd12.prod.outlook.com
 ([fe80::73b9:287c:a30c:214d%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 11:48:11 +0000
From: "Kamal, Asad" <Asad.Kamal@amd.com>
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Add only valid firmware version nodes
Thread-Topic: [PATCH] drm/amdgpu: Add only valid firmware version nodes
Thread-Index: AQHZ1zayDWi9vMdfFEiMiB+FHv56ua/63LuAgAAFDnA=
Date: Fri, 25 Aug 2023 11:48:11 +0000
Message-ID: <CY5PR12MB6081716B558806A53D516B1E8EE3A@CY5PR12MB6081.namprd12.prod.outlook.com>
References: <20230825092743.842810-1-lijo.lazar@amd.com>
 <PH7PR12MB599777D2C8261704BCD1C55082E3A@PH7PR12MB5997.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB599777D2C8261704BCD1C55082E3A@PH7PR12MB5997.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-25T11:14:38.7462149Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6081:EE_|MW4PR12MB7287:EE_
x-ms-office365-filtering-correlation-id: 583121de-de85-496b-ceee-08dba561285c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wAJVl4QsiNRqeYjtEAzKpAJ7En9DcfaKLIVngaeK94Z1uBaLKwyf1g+UOKZMVIj+LK+1Tg20bLRXH4Xo9Lha9lTxzXbVRF9Gw/BQLm6kcdKowhU3VTnn/FRIZVOf/8ZNKMImm6+2tkg3ChHedyv5NpzKZFcIIf806gfb7IziZl9V4oJK18M3kxfaus57B/P8bbBB7GWlWcSVBgNiqneP6vbysPoYaHJuBX8Rs6HXgadrSMILlp9lofB6qM5B5d9Zk4QfUMIrLKCxTGWf5q+bphT8D1DwAgJc3DJAiU/pBp6zit2YMpXUHi4hjQ0KZm/Kbq1UZ8tc//HnszlM5vpv4SM1NwhBFUsH18wv5eKh10nZUj9JT6xjaECBxZAQfPzTCRWxjTLZKdl7DXEm/i8ImkKrd6AjstJ/bes64uPYBvhTO2EqF4wfQnx5iX1emREyhG6/h3rC8QM0MBp9u9QT4eW6tIeBiIBNAQJAJCHT4kic2uT+dOBRat01FfDfi2yfS1kpBUQbum2mkwACbOpuBJAWEQP6nQU3W191JVk5WJmH2jviYn+3c50JnKUv8mEsyuJFOHR3XG1ngF0qKehFa0jCDcYXhD2QpsUxcWuS8nzoDWeVVqiRiY/CjLVaLXJC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6081.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(83380400001)(9686003)(26005)(478600001)(55016003)(5660300002)(52536014)(2906002)(8936002)(4326008)(8676002)(38100700002)(38070700005)(122000001)(6636002)(66476007)(66556008)(110136005)(66946007)(76116006)(86362001)(71200400001)(64756008)(41300700001)(7696005)(54906003)(6506007)(53546011)(33656002)(66446008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG40dG9JUWNtUzJFVnlKZHk0dFJoRWFNTlAxSGsvd000M0U0VFJSUmdrNmpH?=
 =?utf-8?B?d0JMM3ZOZzAxaDc0bTBYeThmdmR0TmZtV0RwWTZ1ZGFSTWtjWFpvWjcrZ3VJ?=
 =?utf-8?B?N3lYR3AzdlpUQm5KR2NZWHhzUVU2bzJ1QUx1QVNQZkR4VXR4Q3BUaU1YTURO?=
 =?utf-8?B?ak5SaHhlQzFsSVNEaXBTaGFSaVZnVTZmdnp1Z1F0UTJ1TFdUSHpWbm95UUsy?=
 =?utf-8?B?eFJxWWxwZVR1UHFhbUtSNjhad082ODhwdHpVQmtoc094ZGZoTk1KL0k1eUlk?=
 =?utf-8?B?NUdWc2VmMGQ4QXJpNSs1NW02bzArSm9RZk1BRGdtTnNaQU12Q0dLNTlnSnl6?=
 =?utf-8?B?RkdKQzFEK1lKK1JmSlVsZndraC9WaXZIZWtCbmgreHRmSVBRbmZpZXRSckw5?=
 =?utf-8?B?VW9BM04wbzFVejJSZmxFSXRUV2MxSFg1WmpCbm9SY3lPdlFHKzVJU0xzbm5x?=
 =?utf-8?B?bDV1WlJHclE1N0k5R2VkcGRsSjRsR1BWQTVyWmxvN1BiakFaMG5yTjUzUmM2?=
 =?utf-8?B?djhrWHVlN3hGL2lRZisycWNVTmNIejNKMm5ueHh3TEhFWUxwcmVhUWp5Q0Jv?=
 =?utf-8?B?c0pqWGVuRDVzSCtZRHl2Kzh6SE9iMkN0WFdyWnEyY0hPKy9UN280OGdvUWhB?=
 =?utf-8?B?aFEyMEFOL0lERmk2cW9kT1lXbTJUK3luOUk1TjZ6Ylh1VWtiN0lkSUNpOEVT?=
 =?utf-8?B?Sml4UGlrRDV6V1B3NXNJMXRlU1IwTUx2bVNqYzAvUFRWK0F1MDhad3V2VUhC?=
 =?utf-8?B?bmp0YjNPZi94R0dMeGZXUG5RRDVSWGVGN21PVjkxdU1CbmxYZStYbFE4MXp3?=
 =?utf-8?B?QURrQmVVMVkvek9TVWx3bytXbDNBVFBTL1hMVmNsSjZQSzZpbDVxaFQzTGFV?=
 =?utf-8?B?NDFqQ29XYy9nT3B5bE44ZzFvZ2FRbXpqOXMrdUNtSFp5VjFYdDVpbUZGZWhq?=
 =?utf-8?B?U0VibkZoRDBhdytPQlpVVDdTRmN0Z0lvbE53d3pTSzliZ0d1RTdWanlYa2NQ?=
 =?utf-8?B?ZjBLRll4TXlJNStTVFVaMWV4SW5wdzBKK2VuVVV1NkViTEk0VmJyd2trTmN1?=
 =?utf-8?B?MFNpRC9PUGJOV1hMZGhwN0Y0UjNIV21DWnBqcVViNncxVGpDd0h5VEx3bjlG?=
 =?utf-8?B?MTc0SFJoNksybzQreWtOaURGRktkallqRGJuZ25POE9pV21BYkpQbE8vcjFx?=
 =?utf-8?B?YklWS0Q5K29rSkFUaTd4OGVyZWFVWlc1M3kzU0N6K0oya0RqOVpJa2NKc3JK?=
 =?utf-8?B?MWJyazZMSnRsUGFOY25Wdk5hZTJXRWFHcjQwZ1dqVVhBS2w3MnY4aWJyaUlQ?=
 =?utf-8?B?TkpEV0hwU2RTMzBVWUFoUHVQWDNiSFBwclErZTk4eDVwdzlnQzdVb1V6Q1Yv?=
 =?utf-8?B?c2lTVzlyMTl1WUhuRmVPZmg3RlhrU1BubnMvT2NMRzJveWwrQzFsczN3RWxB?=
 =?utf-8?B?OVFTOFRqcXdPNFd5KzdDcFhoTEFDc1VCcXp6RGtiTlpZaGRmWHlGV0hwaFd5?=
 =?utf-8?B?RlFCeW9GMFk4cTE3VnFuamxVR2JiQ2VQZmRQV0pwOHFFNU9qWnRkUDdEblVu?=
 =?utf-8?B?NlVsbDhLVkp6TURUN2krdG0xaHBjNkdsa25VY3pqMjA3ODh1YUJhbFFaS2p3?=
 =?utf-8?B?Qy9Tc0Y1T1MxMCtod1JMTDhiTzI0QlZySlBqbk4reXVCZmdjMnorTFVPRmlR?=
 =?utf-8?B?MTdwZXFGSks4c2tBZzZwejIvdzF1eVNxWFI3YXJVMGp3eDZsMS8ya0IvdHlZ?=
 =?utf-8?B?OEtTa25yWmk2cmljdlQyb1grZmNQUEZhOUF3bk5LcVpnd281VzU2Q2NEbWsv?=
 =?utf-8?B?bStPeXpCUWtmTnhqSnhvSW50WXFINkU1TWw1UE8zWFNtaUl2V0RlYjRIQUdR?=
 =?utf-8?B?ZEdTeDhIZHJxa1c5bG5UdHM5c0k3SWU0MlAyUkFYdVY1MHZ2Zm8yOXovdWdK?=
 =?utf-8?B?QnBjNG90YmFiU2p5Ulp6ZTBDTUtQOERSc0xzQ0JKQ09rTHdkTUJMZmx3dHRa?=
 =?utf-8?B?VzdOd1IvKy9qRVJOcmpjY0lUenFQUWVvdFhPdlRRR0xma3E5dVE2YXhoUUFF?=
 =?utf-8?B?azBGNXFaRldUeWczWDZraHB2d29PamEwVDcwb1RSUEZjZjdJMWVRUktTR2ZO?=
 =?utf-8?Q?QT1k=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CY5PR12MB6081716B558806A53D516B1E8EE3ACY5PR12MB6081namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6081.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583121de-de85-496b-ceee-08dba561285c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 11:48:11.0590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waXQXHuIfJXF+v99EcSITEZdFU0O93gToGp5Wq4cI9+ZpTegh+wkDRjFbxQI4Vwp4hYWCQ1zpgFqfjOrBa0faw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7287
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_CY5PR12MB6081716B558806A53D516B1E8EE3ACY5PR12MB6081namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClJldmlld2VkLWJ5OiBBc2FkIEth
bWFsIGFzYWQua2FtYWxAYW1kLmNvbTxtYWlsdG86YXNhZC5rYW1hbEBhbWQuY29tPg0KDQpUaGFu
a3MgJiBSZWdhcmRzDQpBc2FkDQoNCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBXYW5nLCBZYW5nKEtldmluKQ0KU2VudDog
RnJpZGF5LCBBdWd1c3QgMjUsIDIwMjMgNDo0NiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29tPg0KQ2M6IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBB
ZGQgb25seSB2YWxpZCBmaXJtd2FyZSB2ZXJzaW9uIG5vZGVzDQoNCg0KW0FNRCBPZmZpY2lhbCBV
c2UgT25seSAtIEdlbmVyYWxdDQoNCg0KW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxd
DQoNClJldmlld2VkLWJ5OiBZYW5nIFdhbmcgPGtldmlueWFuZy53YW5nQGFtZC5jb208bWFpbHRv
OmtldmlueWFuZy53YW5nQGFtZC5jb20+Pg0KDQpCZXN0IFJlZ2FyZHMsDQpLZXZpbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCuWPkeS7tuS6ujogYW1kLWdmeCA8YW1kLWdmeC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4+IOS7o+ihqCBMaWpvIExhemFyIDxsaWpvLmxhemFyQGFtZC5jb208
bWFpbHRvOmxpam8ubGF6YXJAYW1kLmNvbT4+DQrlj5HpgIHml7bpl7Q6IOaYn+acn+S6lCwg5YWr
5pyIIDI1LCAyMDIzIDE3OjI5DQrmlLbku7bkuro6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPG1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gPGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPG1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4+DQrm
ioTpgIE6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbTxtYWls
dG86QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5a
aGFuZ0BhbWQuY29tPG1haWx0bzpIYXdraW5nLlpoYW5nQGFtZC5jb20+Pg0K5Li76aKYOiBbUEFU
Q0hdIGRybS9hbWRncHU6IEFkZCBvbmx5IHZhbGlkIGZpcm13YXJlIHZlcnNpb24gbm9kZXMNCg0K
U2hvdyBvbmx5IGZpcm13YXJlIHZlcnNpb24gYXR0cmlidXRlcyB0aGF0IGhhdmUgdmFsaWQgdmVy
c2lvbi4gSGlkZQ0Kb3RoZXJzLg0KDQpTaWduZWQtb2ZmLWJ5OiBMaWpvIExhemFyIDxsaWpvLmxh
emFyQGFtZC5jb208bWFpbHRvOmxpam8ubGF6YXJAYW1kLmNvbT4+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDMzICsrKysrKysrKysrKysrKysrKysr
LS0tDQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jDQppbmRleCA4YmVlZmMw
NDVlMTQuLmIwYjM3YzA1NmMzNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV91Y29kZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdWNvZGUuYw0KQEAgLTY2OSwxNSArNjY5LDI1IEBAIGNvbnN0IGNoYXIgKmFtZGdwdV91Y29k
ZV9uYW1lKGVudW0gQU1ER1BVX1VDT0RFX0lEIHVjb2RlX2lkKQ0KICAgICAgICAgfQ0KIH0NCg0K
K3N0YXRpYyBpbmxpbmUgaW50IGFtZGdwdV91Y29kZV9pc192YWxpZCh1aW50MzJfdCBmd192ZXJz
aW9uKQ0KK3sNCisgICAgICAgaWYgKCFmd192ZXJzaW9uKQ0KKyAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KKw0KKyAgICAgICByZXR1cm4gMDsNCit9DQorDQogI2RlZmluZSBGV19WRVJT
SU9OX0FUVFIobmFtZSwgbW9kZSwgZmllbGQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KIHN0YXRpYyBzc2l6ZV90IHNob3dfIyNuYW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmF0dHIsICAgICAgICAgXA0KLSAgICAgICAgICAgICAgICAgICAgICAg
ICBjaGFyICpidWYpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFy
ICpidWYpICAgICBcDQogeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KICAgICAgICAgc3RydWN0IGRybV9kZXZp
Y2UgKmRkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsgICAgICAgICAgICAgICAgIFwNCiAgICAg
ICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGRldik7ICAgICAg
ICAgICAgICAgICBcDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KLSAgICAgICByZXR1cm4gc3lzZnNfZW1p
dChidWYsICIweCUwOHhcbiIsIGFkZXYtPmZpZWxkKTsgICAgICAgIFwNCisgICAgICAgaWYgKCFi
dWYpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCisgICAgICAgICAgICAgICByZXR1cm4gYW1kZ3B1X3Vjb2RlX2lzX3ZhbGlkKGFkZXYtPmZp
ZWxkKTsgICAgICAgICAgICAgIFwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCisgICAgICAgcmV0dXJuIHN5
c2ZzX2VtaXQoYnVmLCAiMHglMDh4XG4iLCBhZGV2LT5maWVsZCk7ICAgICAgICAgICAgICAgIFwN
CiB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQogc3RhdGljIERFVklDRV9BVFRSKG5hbWUsIG1vZGUsIHNob3df
IyNuYW1lLCBOVUxMKQ0KDQpAQCAtNzIyLDkgKzczMiwyNCBAQCBzdGF0aWMgc3RydWN0IGF0dHJp
YnV0ZSAqZndfYXR0cnNbXSA9IHsNCiAgICAgICAgIE5VTEwNCiB9Ow0KDQorI2RlZmluZSB0b19k
ZXZfYXR0cih4KSBjb250YWluZXJfb2YoeCwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUsIGF0dHIp
DQorDQorc3RhdGljIHVtb2RlX3QgYW1kZ3B1X3Vjb2RlX3N5c192aXNpYmxlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBhdHRyaWJ1dGUgKmF0dHIsIGludCBpZHgpDQorew0KKyAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqZGV2X2F0dHIgPSB0b19kZXZfYXR0cihhdHRyKTsNCisgICAgICAgc3RydWN0IGRl
dmljZSAqZGV2ID0ga29ial90b19kZXYoa29iaik7DQorDQorICAgICAgIGlmIChkZXZfYXR0ci0+
c2hvdyhkZXYsIGRldl9hdHRyLCBOVUxMKSA9PSAtRUlOVkFMKQ0KKyAgICAgICAgICAgICAgIHJl
dHVybiAwOw0KKw0KKyAgICAgICByZXR1cm4gYXR0ci0+bW9kZTsNCit9DQorDQogc3RhdGljIGNv
bnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgZndfYXR0cl9ncm91cCA9IHsNCiAgICAgICAgIC5u
YW1lID0gImZ3X3ZlcnNpb24iLA0KLSAgICAgICAuYXR0cnMgPSBmd19hdHRycw0KKyAgICAgICAu
YXR0cnMgPSBmd19hdHRycywNCisgICAgICAgLmlzX3Zpc2libGUgPSBhbWRncHVfdWNvZGVfc3lz
X3Zpc2libGUNCiB9Ow0KDQogaW50IGFtZGdwdV91Y29kZV9zeXNmc19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQ0KLS0NCjIuMjUuMQ0K

--_000_CY5PR12MB6081716B558806A53D516B1E8EE3ACY5PR12MB6081namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPCEtLVtp
ZiAhbXNvXT48c3R5bGU+dlw6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kb1w6KiB7
YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kd1w6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0
I1ZNTCk7fQ0KLnNoYXBlIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9DQo8L3N0eWxlPjwh
W2VuZGlmXS0tPjxzdHlsZT48IS0tDQovKiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNl
DQoJe2ZvbnQtZmFtaWx5OlNpbVN1bjsNCglwYW5vc2UtMToyIDEgNiAwIDMgMSAxIDEgMSAxO30N
CkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0
IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJ
cGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWls
eToiXEBTaW1TdW4iOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUg
RGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwN
Cgl7bWFyZ2luOjBpbjsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OlNpbVN1bjsN
Cgltc28tZmFyZWFzdC1sYW5ndWFnZTpaSC1DTjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5r
DQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3Jh
dGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMjANCgl7bXNvLXN0eWxlLXR5cGU6cGVy
c29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LXNpemU6MTAuMHB0Ow0KCW1zby1saWdhdHVyZXM6bm9uZTt9DQpAcGFnZSBXb3Jk
U2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGlu
IDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9z
dHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVk
aXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28g
OV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJl
ZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9o
ZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBz
dHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPHAgc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFs
O2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5vcm1h
bDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVmdCI+
DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF08YnI+DQo8L3A+DQo8YnI+DQo8ZGl2
Pg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDss
c2Fucy1zZXJpZjttc28tZmFyZWFzdC1sYW5ndWFnZTpFTi1VUyI+UmV2aWV3ZWQtYnk6IEFzYWQg
S2FtYWwNCjxhIGhyZWY9Im1haWx0bzphc2FkLmthbWFsQGFtZC5jb20iPmFzYWQua2FtYWxAYW1k
LmNvbTwvYT48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7
LHNhbnMtc2VyaWY7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjttc28tZmFy
ZWFzdC1sYW5ndWFnZTpFTi1VUyI+VGhhbmtzICZhbXA7IFJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7bXNvLWZhcmVhc3Qt
bGFuZ3VhZ2U6RU4tVVMiPkFzYWQ8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7bXNvLWZhcmVhc3QtbGFuZ3VhZ2U6RU4tVVMiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTti
b3JkZXItdG9wOnNvbGlkICNFMUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPkZyb206PC9zcGFuPjwv
Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJp
JnF1b3Q7LHNhbnMtc2VyaWYiPiBhbWQtZ2Z4ICZsdDthbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnJmd0Ow0KPGI+T24gQmVoYWxmIE9mIDwvYj5XYW5nLCBZYW5nKEtldmluKTxi
cj4NCjxiPlNlbnQ6PC9iPiBGcmlkYXksIEF1Z3VzdCAyNSwgMjAyMyA0OjQ2IFBNPGJyPg0KPGI+
VG86PC9iPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTGF6YXIsIExpam8gJmx0O0xp
am8uTGF6YXJAYW1kLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IERldWNoZXIsIEFsZXhhbmRlciAm
bHQ7QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbSZndDs7IFpoYW5nLCBIYXdraW5nICZsdDtIYXdr
aW5nLlpoYW5nQGFtZC5jb20mZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBbUEFUQ0hdIGRy
bS9hbWRncHU6IEFkZCBvbmx5IHZhbGlkIGZpcm13YXJlIHZlcnNpb24gbm9kZXM8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8cCBzdHlsZT0ibWFyZ2luOjUuMHB0Ij48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2Nv
bG9yOmJsdWUiPltBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFsXTxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRp
dj4NCjxwIHN0eWxlPSJtYXJnaW46NS4wcHQiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0
O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Ymx1ZSI+W0FN
RCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxk
aXY+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJldmlld2VkLWJ5OiBZYW5n
IFdhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzprZXZpbnlhbmcud2FuZ0BhbWQuY29tIj5rZXZpbnlh
bmcud2FuZ0BhbWQuY29tPC9hPiZndDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5CZXN0IFJlZ2FyZHMsPG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5LZXZpbjxvOnA+PC9vOnA+PC9w
Pg0KPC9kaXY+DQo8ZGl2IGlkPSJtYWlsLWVkaXRvci1yZWZlcmVuY2UtbWVzc2FnZS1jb250YWlu
ZXIiPg0KPGRpdiBjbGFzcz0iTXNvTm9ybWFsIiBhbGlnbj0iY2VudGVyIiBzdHlsZT0idGV4dC1h
bGlnbjpjZW50ZXIiPg0KPGhyIHNpemU9IjIiIHdpZHRoPSI5OCUiIGFsaWduPSJjZW50ZXIiPg0K
PC9kaXY+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxi
PjxzcGFuIGxhbmc9IlpILUNOIj7lj5Hku7bkuro8L3NwYW4+PC9iPjxiPjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPjo8L3NwYW4+PC9iPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPiBh
bWQtZ2Z4ICZsdDs8YSBocmVmPSJtYWlsdG86YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZyI+YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzwvYT4mZ3Q7DQo8
L3NwYW4+PHNwYW4gbGFuZz0iWkgtQ04iPuS7o+ihqDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gTGlqbyBMYXphciAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmxpam8ubGF6YXJAYW1kLmNvbSI+bGlqby5sYXphckBhbWQuY29tPC9hPiZn
dDs8YnI+DQo8L3NwYW4+PGI+PHNwYW4gbGFuZz0iWkgtQ04iPuWPkemAgeaXtumXtDwvc3Bhbj48
L2I+PGI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZiI+Ojwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkm
cXVvdDssc2Fucy1zZXJpZiI+DQo8L3NwYW4+PHNwYW4gbGFuZz0iWkgtQ04iPuaYn+acn+S6lDwv
c3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNl
cmlmIj4sDQo8L3NwYW4+PHNwYW4gbGFuZz0iWkgtQ04iPuWFq+aciDwvc3Bhbj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gMjUsIDIwMjMg
MTc6Mjk8YnI+DQo8L3NwYW4+PGI+PHNwYW4gbGFuZz0iWkgtQ04iPuaUtuS7tuS6ujwvc3Bhbj48
L2I+PGI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZiI+Ojwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkm
cXVvdDssc2Fucy1zZXJpZiI+DQo8YSBocmVmPSJtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmciPmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPiAmbHQ7PGEgaHJlZj0i
bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIj5hbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzwvYT4mZ3Q7PGJyPg0KPC9zcGFuPjxiPjxzcGFuIGxhbmc9IlpILUNOIj7mioTp
gIE8L3NwYW4+PC9iPjxiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1
b3Q7LHNhbnMtc2VyaWYiPjo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVv
dDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPiBEZXVjaGVyLCBBbGV4YW5kZXIgJmx0OzxhIGhy
ZWY9Im1haWx0bzpBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tIj5BbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPC9hPiZndDs7IFpoYW5nLCBIYXdraW5nDQogJmx0OzxhIGhyZWY9Im1haWx0bzpIYXdr
aW5nLlpoYW5nQGFtZC5jb20iPkhhd2tpbmcuWmhhbmdAYW1kLmNvbTwvYT4mZ3Q7PGJyPg0KPC9z
cGFuPjxiPjxzcGFuIGxhbmc9IlpILUNOIj7kuLvpopg8L3NwYW4+PC9iPjxiPjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPjo8L3NwYW4+PC9i
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYi
PiBbUEFUQ0hdIGRybS9hbWRncHU6IEFkZCBvbmx5IHZhbGlkIGZpcm13YXJlIHZlcnNpb24gbm9k
ZXMNCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4m
bmJzcDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEyLjBwdCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPlNob3cgb25seSBmaXJtd2FyZSB2ZXJzaW9uIGF0dHJpYnV0ZXMg
dGhhdCBoYXZlIHZhbGlkIHZlcnNpb24uIEhpZGU8YnI+DQpvdGhlcnMuPGJyPg0KPGJyPg0KU2ln
bmVkLW9mZi1ieTogTGlqbyBMYXphciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxpam8ubGF6YXJAYW1k
LmNvbSI+bGlqby5sYXphckBhbWQuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQombmJzcDtkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDMzICsrKysrKysrKysrKysr
KysrKysrLS0tPGJyPg0KJm5ic3A7MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91Y29kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Vjb2RlLmM8YnI+DQppbmRleCA4YmVlZmMwNDVlMTQuLmIwYjM3YzA1NmMzNiAxMDA2NDQ8YnI+
DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYzxicj4NCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jPGJyPg0KQEAgLTY2
OSwxNSArNjY5LDI1IEBAIGNvbnN0IGNoYXIgKmFtZGdwdV91Y29kZV9uYW1lKGVudW0gQU1ER1BV
X1VDT0RFX0lEIHVjb2RlX2lkKTxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyB9PGJyPg0KJm5ic3A7fTxicj4NCiZuYnNwOzxicj4NCitzdGF0aWMg
aW5saW5lIGludCBhbWRncHVfdWNvZGVfaXNfdmFsaWQodWludDMyX3QgZndfdmVyc2lvbik8YnI+
DQorezxicj4NCismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCFmd192
ZXJzaW9uKTxicj4NCismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJuIC1FSU5WQUw7
PGJyPg0KKzxicj4NCismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcmV0dXJu
IDA7PGJyPg0KK308YnI+DQorPGJyPg0KJm5ic3A7I2RlZmluZSBGV19WRVJTSU9OX0FUVFIobmFt
ZSwgbW9kZSwgZmllbGQpJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IFw8YnI+DQombmJzcDtzdGF0aWMgc3NpemVfdCBzaG93XyMjbmFt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IFw8YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlICphdHRyLCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBcPGJyPg0KLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBjaGFyICpidWYpJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFw8YnI+DQorJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICph
dHRyLCBjaGFyICpidWYpJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFw8YnI+DQombmJzcDt7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IFw8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXDxicj4NCiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IGRybV90b19hZGV2KGRkZXYpOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBcPGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IFw8YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJldHVybiBz
eXNmc19lbWl0KGJ1ZiwgJnF1b3Q7MHglMDh4XG4mcXVvdDssIGFkZXYtJmd0O2ZpZWxkKTsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgXDxicj4NCismbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYgKCFidWYpJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IFw8YnI+DQorJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJl
dHVybiBhbWRncHVfdWNvZGVfaXNfdmFsaWQoYWRldi0mZ3Q7ZmllbGQpOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBcPGJyPg0KKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBcPGJyPg0KKyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gc3lzZnNfZW1pdChidWYsICZxdW90OzB4
JTA4eFxuJnF1b3Q7LCBhZGV2LSZndDtmaWVsZCk7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IFw8YnI+DQombmJzcDt9Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFw8YnI+DQombmJzcDtz
dGF0aWMgREVWSUNFX0FUVFIobmFtZSwgbW9kZSwgc2hvd18jI25hbWUsIE5VTEwpPGJyPg0KJm5i
c3A7PGJyPg0KQEAgLTcyMiw5ICs3MzIsMjQgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmZ3
X2F0dHJzW10gPSB7PGJyPg0KJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IE5VTEw8YnI+DQombmJzcDt9Ozxicj4NCiZuYnNwOzxicj4NCisjZGVmaW5lIHRv
X2Rldl9hdHRyKHgpIGNvbnRhaW5lcl9vZih4LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSwgYXR0
cik8YnI+DQorPGJyPg0KK3N0YXRpYyB1bW9kZV90IGFtZGdwdV91Y29kZV9zeXNfdmlzaWJsZShz
dHJ1Y3Qga29iamVjdCAqa29iaiw8YnI+DQorJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0cnVjdCBhdHRyaWJ1dGUgKmF0dHIsIGludCBp
ZHgpPGJyPg0KK3s8YnI+DQorJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlICpkZXZfYXR0ciA9IHRvX2Rldl9hdHRyKGF0dHIpOzxicj4N
CismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc3RydWN0IGRldmljZSAqZGV2
ID0ga29ial90b19kZXYoa29iaik7PGJyPg0KKzxicj4NCismbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgaWYgKGRldl9hdHRyLSZndDtzaG93KGRldiwgZGV2X2F0dHIsIE5VTEwp
ID09IC1FSU5WQUwpPGJyPg0KKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4gMDs8
YnI+DQorPGJyPg0KKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZXR1cm4g
YXR0ci0mZ3Q7bW9kZTs8YnI+DQorfTxicj4NCis8YnI+DQombmJzcDtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGF0dHJpYnV0ZV9ncm91cCBmd19hdHRyX2dyb3VwID0gezxicj4NCiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAubmFtZSA9ICZxdW90O2Z3X3ZlcnNp
b24mcXVvdDssPGJyPg0KLSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAuYXR0
cnMgPSBmd19hdHRyczxicj4NCismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
LmF0dHJzID0gZndfYXR0cnMsPGJyPg0KKyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAuaXNfdmlzaWJsZSA9IGFtZGdwdV91Y29kZV9zeXNfdmlzaWJsZTxicj4NCiZuYnNwO307
PGJyPg0KJm5ic3A7PGJyPg0KJm5ic3A7aW50IGFtZGdwdV91Y29kZV9zeXNmc19pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTxicj4NCi0tIDxicj4NCjIuMjUuMTxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_CY5PR12MB6081716B558806A53D516B1E8EE3ACY5PR12MB6081namp_--
