Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE4F3799A1
	for <lists+amd-gfx@lfdr.de>; Tue, 11 May 2021 00:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533CE6E92F;
	Mon, 10 May 2021 22:05:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA286E92F;
 Mon, 10 May 2021 22:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPpHYenUeZnNjvFDHZABW8SygyMDAt+W7Oe7PbnWIro74QBMJG5bX/79AsCfjozdMMCQQq7G2oemsbdpIVJ5k89AGhO7yuQE3VGbxeARFVjxjKvYLbfh2Al4xL7jJEj22Gn0LI4wen5jFFy7kI0OkEkkxMWUaAD1fi51HL+uUpVDax2IKKAYtoilmfpHe9epQ4ubdK5HX/y2w6pele+9zea4V2h3Zzf7ulBCUbSOcYFNXjQaKjWPwWnBHVnOzb65y4oEw3haDwsY0WB5ikUifAYNJGru5aay70GbwsTdhwcptOqhCoVzXur67xzIFOnWHmjoIBsZkVXjarFdQZqRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPH9+jmJH4FnMXHbqGLWv6lgFDU2gGQnHPIhrmCHUb4=;
 b=i9JHFXKIETxGAOyXfa6TGmzvG7lA6JfZsnqoobooDrFXcPqe+ck0/QJYOfZ8f2vifEvmsXvVhcMZa2hY4z99E0a51YQ3yTQuWmTpCWehinXGr0tj1+kULGKTBW4HekucZLjYnQte291P0lK6OwZvGy4s9M4IyxbCZin4nkkkvblWtwAbSLnOBONZM1Aig+fc5+xgvbRLm3JwN3S6Y96PXyYMwzoxKRUoQHHaF//+hRkkimFU42urTs2vqwOxCtriTrGwwC0IXs5ADUQHUt58sXMp2JRsSgRlpVB/xQ8BwtZPtwXQcK9QBPF1vGPUAIN0D04XGBGGOZNQWGMe2iqCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPH9+jmJH4FnMXHbqGLWv6lgFDU2gGQnHPIhrmCHUb4=;
 b=Yyz5xmP5QIuLXz5lisXhExq4Y7wHSywjcEu5+OJHdiyJjULALpW38sbEa0zEyiJBXbnkDF9ILGIOlJXvYaH+s0LC0CsVC92/cETFPlMYU0kr7kVl9rZZXdFS9gAMd1On+HWKaQfRxPaNmYgSPa8ML+nHrJCe/Px3EvU2mMkkRQ8=
Received: from SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 by SN6PR12MB4734.namprd12.prod.outlook.com (2603:10b6:805:e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Mon, 10 May
 2021 22:05:03 +0000
Received: from SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021]) by SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:05:03 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak"
 <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 05/10] drm/amdgpu: Add multi-GPU DMA mapping helpers
Thread-Topic: [PATCH v2 05/10] drm/amdgpu: Add multi-GPU DMA mapping helpers
Thread-Index: AQHXPU8CLte3u0frWkalVLZzGBk7y6rdVlxg
Date: Mon, 10 May 2021 22:05:03 +0000
Message-ID: <SN6PR12MB2672D07C35FEFA6DDA91D344E3549@SN6PR12MB2672.namprd12.prod.outlook.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
 <20210422013058.6305-6-Felix.Kuehling@amd.com>
 <D7CF3F16-B02B-4F84-8E3C-0DAF65261B2C@amd.com>
 <1c3566b0-6275-b6c2-3f3f-28178bf60b44@amd.com>
In-Reply-To: <1c3566b0-6275-b6c2-3f3f-28178bf60b44@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-10T22:04:55Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=61de82cc-f8ad-43aa-aa91-d7dc4f28ccf3;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: Review of amdgpu code  
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [70.114.142.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25454704-195c-4967-9107-08d913ffa9e2
x-ms-traffictypediagnostic: SN6PR12MB4734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB4734FD728ADE4FF0A732C887E3549@SN6PR12MB4734.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QXsAgClZy/DX+04yBlngNBTNzBh2W0sH5G96naIlOm5VZwjeRCoFEiL6XHZObjoxE3Hf1E2fK1IQkhWVvzWWAWR4ckRcMW9ia8a6XT9VxenmtaZTDwZ5mB66HNGStCrJGBfIIeHiCQecuwIDJi2Boz/gE/sOobX2G9km1+CqaFwcvXVk9cvAtqNJLK6dz1GvhmuI5E3wmlEvWkZ32dYvezVC1hzvabX9s9UgPOntx9u0afhNKoUQUUmgciGbDtp6ZQdXmT5v5iHUUh+0G6zO9e+Vnmj/u+5DBwsnKV4JleVUMxJVDoCJscGNlr8zEvpKL0OYN5cXKRcP0/HDX1gxy8Fp+XD5ewxA6J9rhpufLBWX21rQqOKCULO7PWdYEaIdqy5w7qkovdZp5CVboA96xUUu5aEPBKXhak55t+G11QDzAPH2febKXX/f+5dibu0GNuwMmD/z+CMavMJKRnRXyL1xK/m34OT3anJqMpPnavC2VLSLuy//j+gosKCJV/GKbcfltMJQ5uDrTsTvwFEyRHCryOKqwGMp/DTU/bOOEM9HNZcmKEuBE4R4yNVwnoxadJOEp9aSBELIP237BxfldUlEnY5p7vvtB5qakA/QrZDUQGuIrml0VrZ08vnmxdEYsCljl30lKyvHfMGdNvKZXPdVFSAKpOXZX+L479N08DT6WFAbs9uwVy7HtYhhZW9B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2672.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(478600001)(9686003)(52536014)(86362001)(33656002)(71200400001)(26005)(8936002)(8676002)(45080400002)(83380400001)(38100700002)(122000001)(76116006)(966005)(450100002)(66556008)(186003)(66446008)(66946007)(110136005)(64756008)(66476007)(6506007)(53546011)(55016002)(5660300002)(2906002)(7696005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SkVQaGpnd1h5NEFrSjRsTld6UVMxYWoxekpsZU91V2M2UlRpL0lmblBmR1pO?=
 =?utf-8?B?cWIvYmFhUnFvZ0taVk9yVTVDVklzSm9pYUpMRlJpWFcyOFhnYk9veXBUTFZX?=
 =?utf-8?B?Z1JYWFYyV0d6VXJ6dHkxTWwxV1RZd1J2a3J6aHhRT2EySmp4L2czcHZ2WDJE?=
 =?utf-8?B?bzNDeERzcFlPWVVHRy9nZldZN2s5MGI3VGlNY1ZaWVZnTGJSUVBuTkwweFZK?=
 =?utf-8?B?RW1NOXp0RExoQm5qM2tKczVjTk53bWtpYitqOEEvWGgrUkI0TTRBZXJ4ZGpj?=
 =?utf-8?B?dDVoOGtkL2l1WUp4RnBjeE13ZXVlT1hyazlwb0psbVJZWkN2V1h3cDVEN21G?=
 =?utf-8?B?NkZlTHI2cTNUcENCMEN4aHhzdFNjcTdoL29XTmErQXJoMXBReXVucit1ZXhC?=
 =?utf-8?B?WTFLUVdVWjJUTllvVFBlRHh1VW9CQ3hvVFYvOUxrTzRKMjV1MEd4eHpPRHdE?=
 =?utf-8?B?Tm9QTnM1dTI3MXdHTXRiVzZQdXZ4RDdZQjFJall0bUhHYTQ1bU1LVWhoZU9k?=
 =?utf-8?B?S21IeXBRRkwwWDBtNGFCd3krT0VYYnJmdlEwV1VCUEFQdFQ4WVl2SDZxWVF5?=
 =?utf-8?B?M0g2UlRvNmtSOXZSM09XN3dMb1NIcHdwOHdpNUtqMkVqQUt3SE1YOUxDSnNU?=
 =?utf-8?B?WC9UT3lOQWozdEgxeUJXK2w4SVFTM3RsYkt0ejkwTDJPR0piRjQ5NkpkdnJP?=
 =?utf-8?B?TzEyWE5zWXVkT2xvVUZkQnpvT2kzczhnQjFuTUxSTEZQdUVyUHIvZ2hKa2Ro?=
 =?utf-8?B?MGJxYk8zSU1Md2lCLzJlM2xqdVVJWFRFR0dnQ0R0QnVBaGYreVJHdXBjMEJx?=
 =?utf-8?B?QUNkTVdxZnBUM2ZaNW52L0FKdWhpUmMyd1d0aGlHVXF5dzJsMCtRUGVqd0NT?=
 =?utf-8?B?QWRUVFhoS1Ivd3Y3YW4vRmFIZWVTZ2IzWGhySkNjaHloRUI3TjN0TXJTRFZs?=
 =?utf-8?B?Z0FLd3BmQytQaXlOMUlPMXdHcVFIbGVlU3pxeUVySVlEeGhCN2VnVHJjd3RN?=
 =?utf-8?B?aVZwMDhBSnA4UGg5RVpCWlZwcUh2ZkJtNGZockZFbHM0d21xRzJNUE9XQlFj?=
 =?utf-8?B?WDFZSkxEVnQ3Sm5USXpkanZJQVdLd3UrTmhYRHA4N0hBUnVVS3cxbHpJZTZF?=
 =?utf-8?B?SXl1Ui92SFZHMDZUd3lPZmhVV1lTTGQ5MmZGNG44SnJDazFRdDJMWWI4WFgx?=
 =?utf-8?B?WlVwTEN6Ry9wTlZaRll3bWZFQWZNKzl1Mk91VHdOOHRRZHRlR09iNmhlSGtT?=
 =?utf-8?B?SzI4by9VVkoxNFE0NWwwUmRGTHBKdndlcCtsNFM3bFR3U3k3SzRLYitEdVQ3?=
 =?utf-8?B?UmFQNk1JMWVJR1RqZkR1Z1phejdOZkMyL1NkdWN1MG1TSklMR09VOGhTckh6?=
 =?utf-8?B?Rjd3bU80YlM4TGcxbFI0YUU4dnYxVDZmUWE0eDBXeHMzbU8rOVhqa2hvckt0?=
 =?utf-8?B?K3MzcDJ5QzdCNEZmTFZCSjZJTnExWjRDa1oyUytPUDdxeTQ3QUJqY1NwaWhM?=
 =?utf-8?B?dno5VjFMWnU4bkV0VzlFaElINmdCdGR6NnJMcHM3UnBaZThZLzhNN2NRYW5E?=
 =?utf-8?B?SzlGeTZiU1NkbjJzcVFqT01HTjIxbTFtcnpCOVQzNDV3bitmWkVCb2ViZnVC?=
 =?utf-8?B?Yytyd0JPNnZrekI5bTYyRm5NcGZwcU1rYTFTVXFFSWcwTzhQTG50WHAzTElY?=
 =?utf-8?B?bTZPaXJZS1ZZeVRDK3Z3eklFUGhMc0g5U1JxajVwdGd5bnM5d3Q2dFloU0c1?=
 =?utf-8?Q?WFbkxMeVpUiesw3pG+YsxqTcFJMQnj68O2B08Vn?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25454704-195c-4967-9107-08d913ffa9e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:05:03.5792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xshMB4EGD04JDvLAzGLs0+updcwL0Ab8Gh6YBeYk+WO66aj2x9xWmbbrek0F8uoQbL11QrcV8OMFaI3djqYEEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4734
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpB
Y2tlZC1ieTogUmFtZXNoIEVycmFib2x1IDxyYW1lc2guZXJyYWJvbHVAYW1kLmNvbT4NCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLdWVobGluZywgRmVsaXgNClNlbnQ6
IE1vbmRheSwgQXByaWwgMjYsIDIwMjEgMTA6NDEgUE0NClRvOiBaZW5nLCBPYWsgPE9hay5aZW5n
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNS8xMF0gZHJtL2FtZGdw
dTogQWRkIG11bHRpLUdQVSBETUEgbWFwcGluZyBoZWxwZXJzDQoNCkFtIDIwMjEtMDQtMjYgdW0g
ODowOSBwLm0uIHNjaHJpZWIgWmVuZywgT2FrOg0KPiBBcyBJIHVuZGVyc3RhbmQgaXQsIHdoZW4g
b25lIEdQVSBtYXAgYW5vdGhlciBHUFUncyB2cmFtLCB0aGlzIHZyYW0gc2hvdWxkIGFsc28gYmUg
bWFwcGVkIGluIGlvbW11IHBhZ2UgdGFibGUuIEFsc28gbm9ybWFsIEdUVCBtZW1vcnkgKHZlcnN1
cyB1c2VycHRyKSBhbHNvIG5lZWQgdG8gYmUgbWFwcGVkIGluIGlvbW11LiBCdXQgZG9uJ3Qgc2Vl
IHRoaXMgY29kZSBiZWxvdy4NCg0KUmlnaHQsIEknbSBub3Qgc29sdmluZyBhbGwgcHJvYmxlbXMg
YXQgb25jZS4gVGhlIG5leHQgcGF0Y2ggaXMgdGhlcmUgdG8gaGFuZGxlIEdUVCBCT3MuDQoNClBl
ZXIgbWFwcGluZ3Mgb2YgZG9vcmJlbGxzLCBNTUlPIGFuZCBWUkFNIHN0aWxsIG5lZWQgdG8gYmUg
aGFuZGxlZCBpbiB0aGUgZnV0dXJlLiBJJ20gdHJ5aW5nIHRvIGZpeCB0aGUgd29yc3QgaXNzdWVz
IGZpcnN0LiBUaGlzIHNlcmllcyBzaG91bGQgZ2V0IDk5JSBvZiByZWFsIHdvcmxkIHRlc3RzIHdv
cmtpbmcuDQoNCg0KPiAgSSBvbmx5IHNlZSB5b3UgbWFwIHVzZXJwdHIgaW4gaW9tbXUuIE1heWJl
IHlvdSBtYXAgdGhlbSBpbiBpb21tdSBub3QgZHVyaW5nIG1lbW9yeSBhdHRhY2htZW50IHRpbWU/
DQo+DQo+IEFsc28gc2VlIGEgbml0LXBpY2sgaW5saW5lDQo+DQo+IFJlZ2FyZHMsDQo+IE9haw0K
Pg0KPiAgDQo+DQo+IO+7v09uIDIwMjEtMDQtMjEsIDk6MzEgUE0sICJkcmktZGV2ZWwgb24gYmVo
YWxmIG9mIEZlbGl4IEt1ZWhsaW5nIiA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnIG9uIGJlaGFsZiBvZiBGZWxpeC5LdWVobGluZ0BhbWQuY29tPiB3cm90ZToNCj4NCj4g
ICAgIEFkZCBCTy10eXBlIHNwZWNpZmljIGhlbHBlcnMgZnVuY3Rpb25zIHRvIERNQS1tYXAgYW5k
IHVubWFwDQo+ICAgICBrZmRfbWVtX2F0dGFjaG1lbnRzLiBJbXBsZW1lbnQgdGhpcyBmdW5jdGlv
bmFsaXR5IGZvciB1c2VycHRycyBieSBjcmVhdGluZw0KPiAgICAgb25lIFNHIEJPIHBlciBHUFUg
YW5kIGZpbGxpbmcgaXQgd2l0aCBhIERNQSBtYXBwaW5nIG9mIHRoZSBwYWdlcyBmcm9tIHRoZQ0K
PiAgICAgb3JpZ2luYWwgbWVtLT5iby4NCj4NCj4gICAgIFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPiAgICAgLS0tDQo+ICAgICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oICAgIHwgICA4ICstDQo+ICAgICAg
Li4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgIHwgMTQ2ICsrKysr
KysrKysrKysrKysrLQ0KPiAgICAgIDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pDQo+DQo+ICAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5oDQo+ICAgICBpbmRleCBjMjRiMjQ3OGY0NDUuLjYzNjY4NDMzZjVhNiAxMDA2
NDQNCj4gICAgIC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQu
aA0KPiAgICAgKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5o
DQo+ICAgICBAQCAtMzgsMTEgKzM4LDE3IEBAIGV4dGVybiB1aW50NjRfdCBhbWRncHVfYW1ka2Zk
X3RvdGFsX21lbV9zaXplOw0KPg0KPiAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlOw0KPg0KPiAg
ICAgK2VudW0ga2ZkX21lbV9hdHRhY2htZW50X3R5cGUgew0KPiAgICAgKwlLRkRfTUVNX0FUVF9T
SEFSRUQsCS8qIFNoYXJlIGtnZF9tZW0tPmJvIG9yIGFub3RoZXIgYXR0YWNobWVudCdzICovDQo+
ICAgICArCUtGRF9NRU1fQVRUX1VTRVJQVFIsCS8qIFNHIGJvIHRvIERNQSBtYXAgcGFnZXMgZnJv
bSBhIHVzZXJwdHIgYm8gKi8NCj4gICAgICt9Ow0KPiAgICAgKw0KPiAgICAgIHN0cnVjdCBrZmRf
bWVtX2F0dGFjaG1lbnQgew0KPiAgICAgIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+ICAgICAr
CWVudW0ga2ZkX21lbV9hdHRhY2htZW50X3R5cGUgdHlwZTsNCj4gICAgICsJYm9vbCBpc19tYXBw
ZWQ7DQo+ICAgICAgCXN0cnVjdCBhbWRncHVfYm9fdmEgKmJvX3ZhOw0KPiAgICAgIAlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldjsNCj4gICAgIC0JYm9vbCBpc19tYXBwZWQ7DQo+ICAgICAgCXVp
bnQ2NF90IHZhOw0KPiAgICAgIAl1aW50NjRfdCBwdGVfZmxhZ3M7DQo+ICAgICAgfTsNCj4gICAg
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dw
dXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMN
Cj4gICAgIGluZGV4IGZiZDdlNzg2YjU0ZS4uNDlkMWFmNGFhNWYxIDEwMDY0NA0KPiAgICAgLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+ICAg
ICArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMN
Cj4gICAgIEBAIC00NzMsMTIgKzQ3MywxMTcgQEAgc3RhdGljIHVpbnQ2NF90IGdldF9wdGVfZmxh
Z3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBrZ2RfbWVtICptZW0pDQo+ICAg
ICAgCXJldHVybiBwdGVfZmxhZ3M7DQo+ICAgICAgfQ0KPg0KPiAgICAgK3N0YXRpYyBpbnQNCj4g
ICAgICtrZmRfbWVtX2RtYW1hcF91c2VycHRyKHN0cnVjdCBrZ2RfbWVtICptZW0sDQo+ICAgICAr
CQkgICAgICAgc3RydWN0IGtmZF9tZW1fYXR0YWNobWVudCAqYXR0YWNobWVudCkNCj4gICAgICt7
DQo+ICAgICArCWVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcmVjdGlvbiA9DQo+ICAgICArCQlt
ZW0tPmFsbG9jX2ZsYWdzICYgS0ZEX0lPQ19BTExPQ19NRU1fRkxBR1NfV1JJVEFCTEUgPw0KPiAg
ICAgKwkJRE1BX0JJRElSRUNUSU9OQUwgOiBETUFfVE9fREVWSUNFOw0KPiAgICAgKwlzdHJ1Y3Qg
dHRtX29wZXJhdGlvbl9jdHggY3R4ID0gey5pbnRlcnJ1cHRpYmxlID0gdHJ1ZX07DQo+ICAgICAr
CXN0cnVjdCBhbWRncHVfYm8gKmJvID0gYXR0YWNobWVudC0+Ym9fdmEtPmJhc2UuYm87DQo+ICAg
ICArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYXR0YWNobWVudC0+YWRldjsNCj4gICAg
ICsJc3RydWN0IHR0bV90dCAqc3JjX3R0bSA9IG1lbS0+Ym8tPnRiby50dG07DQo+ICAgICArCXN0
cnVjdCB0dG1fdHQgKnR0bSA9IGJvLT50Ym8udHRtOw0KPiAgICAgKwlpbnQgcmV0Ow0KPiAgICAg
Kw0KPiAgICAgKwl0dG0tPnNnID0ga21hbGxvYyhzaXplb2YoKnR0bS0+c2cpLCBHRlBfS0VSTkVM
KTsNCj4gICAgICsJaWYgKHVubGlrZWx5KCF0dG0tPnNnKSkNCj4gICAgICsJCXJldHVybiAtRU5P
TUVNOw0KPiAgICAgKw0KPiAgICAgKwlpZiAoV0FSTl9PTih0dG0tPm51bV9wYWdlcyAhPSBzcmNf
dHRtLT5udW1fcGFnZXMpKQ0KPiAgICAgKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICAgICArDQo+ICAg
ICArCS8qIFNhbWUgc2VxdWVuY2UgYXMgaW4gYW1kZ3B1X3R0bV90dF9waW5fdXNlcnB0ciAqLw0K
PiAgICAgKwlyZXQgPSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKHR0bS0+c2csIHNyY190dG0t
PnBhZ2VzLA0KPiAgICAgKwkJCQkJdHRtLT5udW1fcGFnZXMsIDAsDQo+ICAgICArCQkJCQkodTY0
KXR0bS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsDQo+ICAgICArCQkJCQlHRlBfS0VSTkVMKTsN
Cj4gICAgICsJaWYgKHVubGlrZWx5KHJldCkpDQo+ICAgICArCQlnb3RvIHJlbGVhc2Vfc2c7DQo+
IFNob3VsZCBnbyB0byBhIGxhYmVsIHN0YXJ0aW5nIGZyb20ga2ZyZWUgYmVsb3c/DQoNClRoYW5r
cywgSSdsbCBmaXggdGhhdC4NCg0KUmVnYXJkcywNCsKgIEZlbGl4DQoNCg0KPiAgICAgKw0KPiAg
ICAgKwlyZXQgPSBkbWFfbWFwX3NndGFibGUoYWRldi0+ZGV2LCB0dG0tPnNnLCBkaXJlY3Rpb24s
IDApOw0KPiAgICAgKwlpZiAodW5saWtlbHkocmV0KSkNCj4gICAgICsJCWdvdG8gcmVsZWFzZV9z
ZzsNCj4gICAgICsNCj4gICAgICsJZHJtX3ByaW1lX3NnX3RvX2RtYV9hZGRyX2FycmF5KHR0bS0+
c2csIHR0bS0+ZG1hX2FkZHJlc3MsDQo+ICAgICArCQkJCSAgICAgICB0dG0tPm51bV9wYWdlcyk7
DQo+ICAgICArDQo+ICAgICArCWFtZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oYm8sIEFN
REdQVV9HRU1fRE9NQUlOX0dUVCk7DQo+ICAgICArCXJldCA9IHR0bV9ib192YWxpZGF0ZSgmYm8t
PnRibywgJmJvLT5wbGFjZW1lbnQsICZjdHgpOw0KPiAgICAgKwlpZiAocmV0KQ0KPiAgICAgKwkJ
Z290byByZWxlYXNlX3NnOw0KPiAgICAgKw0KPiAgICAgKwlyZXR1cm4gMDsNCj4gICAgICsNCj4g
ICAgICtyZWxlYXNlX3NnOg0KPiAgICAgKwlwcl9lcnIoIkRNQSBtYXAgdXNlcnB0ciBmYWlsZWQ6
ICVkXG4iLCByZXQpOw0KPiAgICAgKwlzZ19mcmVlX3RhYmxlKHR0bS0+c2cpOw0KPiAgICAgKwlr
ZnJlZSh0dG0tPnNnKTsNCj4gICAgICsJdHRtLT5zZyA9IE5VTEw7DQo+ICAgICArCXJldHVybiBy
ZXQ7DQo+ICAgICArfQ0KPiAgICAgKw0KPiAgICAgK3N0YXRpYyBpbnQNCj4gICAgICtrZmRfbWVt
X2RtYW1hcF9hdHRhY2htZW50KHN0cnVjdCBrZ2RfbWVtICptZW0sDQo+ICAgICArCQkJICBzdHJ1
Y3Qga2ZkX21lbV9hdHRhY2htZW50ICphdHRhY2htZW50KQ0KPiAgICAgK3sNCj4gICAgICsJc3dp
dGNoIChhdHRhY2htZW50LT50eXBlKSB7DQo+ICAgICArCWNhc2UgS0ZEX01FTV9BVFRfU0hBUkVE
Og0KPiAgICAgKwkJcmV0dXJuIDA7DQo+ICAgICArCWNhc2UgS0ZEX01FTV9BVFRfVVNFUlBUUjoN
Cj4gICAgICsJCXJldHVybiBrZmRfbWVtX2RtYW1hcF91c2VycHRyKG1lbSwgYXR0YWNobWVudCk7
DQo+ICAgICArCWRlZmF1bHQ6DQo+ICAgICArCQlXQVJOX09OX09OQ0UoMSk7DQo+ICAgICArCX0N
Cj4gICAgICsJcmV0dXJuIC1FSU5WQUw7DQo+ICAgICArfQ0KPiAgICAgKw0KPiAgICAgK3N0YXRp
YyB2b2lkDQo+ICAgICAra2ZkX21lbV9kbWF1bm1hcF91c2VycHRyKHN0cnVjdCBrZ2RfbWVtICpt
ZW0sDQo+ICAgICArCQkJIHN0cnVjdCBrZmRfbWVtX2F0dGFjaG1lbnQgKmF0dGFjaG1lbnQpDQo+
ICAgICArew0KPiAgICAgKwllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24gPQ0KPiAg
ICAgKwkJbWVtLT5hbGxvY19mbGFncyAmIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxF
ID8NCj4gICAgICsJCURNQV9CSURJUkVDVElPTkFMIDogRE1BX1RPX0RFVklDRTsNCj4gICAgICsJ
c3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsuaW50ZXJydXB0aWJsZSA9IGZhbHNlfTsN
Cj4gICAgICsJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBhdHRhY2htZW50LT5ib192YS0+YmFzZS5i
bzsNCj4gICAgICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhdHRhY2htZW50LT5hZGV2
Ow0KPiAgICAgKwlzdHJ1Y3QgdHRtX3R0ICp0dG0gPSBiby0+dGJvLnR0bTsNCj4gICAgICsNCj4g
ICAgICsJaWYgKHVubGlrZWx5KCF0dG0tPnNnKSkNCj4gICAgICsJCXJldHVybjsNCj4gICAgICsN
Cj4gICAgICsJYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihibywgQU1ER1BVX0dFTV9E
T01BSU5fQ1BVKTsNCj4gICAgICsJdHRtX2JvX3ZhbGlkYXRlKCZiby0+dGJvLCAmYm8tPnBsYWNl
bWVudCwgJmN0eCk7DQo+ICAgICArDQo+ICAgICArCWRtYV91bm1hcF9zZ3RhYmxlKGFkZXYtPmRl
diwgdHRtLT5zZywgZGlyZWN0aW9uLCAwKTsNCj4gICAgICsJc2dfZnJlZV90YWJsZSh0dG0tPnNn
KTsNCj4gICAgICsJdHRtLT5zZyA9IE5VTEw7DQo+ICAgICArfQ0KPiAgICAgKw0KPiAgICAgK3N0
YXRpYyB2b2lkDQo+ICAgICAra2ZkX21lbV9kbWF1bm1hcF9hdHRhY2htZW50KHN0cnVjdCBrZ2Rf
bWVtICptZW0sDQo+ICAgICArCQkJICAgIHN0cnVjdCBrZmRfbWVtX2F0dGFjaG1lbnQgKmF0dGFj
aG1lbnQpDQo+ICAgICArew0KPiAgICAgKwlzd2l0Y2ggKGF0dGFjaG1lbnQtPnR5cGUpIHsNCj4g
ICAgICsJY2FzZSBLRkRfTUVNX0FUVF9TSEFSRUQ6DQo+ICAgICArCQlicmVhazsNCj4gICAgICsJ
Y2FzZSBLRkRfTUVNX0FUVF9VU0VSUFRSOg0KPiAgICAgKwkJa2ZkX21lbV9kbWF1bm1hcF91c2Vy
cHRyKG1lbSwgYXR0YWNobWVudCk7DQo+ICAgICArCQlicmVhazsNCj4gICAgICsJZGVmYXVsdDoN
Cj4gICAgICsJCVdBUk5fT05fT05DRSgxKTsNCj4gICAgICsJfQ0KPiAgICAgK30NCj4gICAgICsN
Cj4gICAgICAvKiBrZmRfbWVtX2F0dGFjaCAtIEFkZCBhIEJPIHRvIGEgVk0NCj4gICAgICAgKg0K
PiAgICAgICAqIEV2ZXJ5dGhpbmcgdGhhdCBuZWVkcyB0byBibyBkb25lIG9ubHkgb25jZSB3aGVu
IGEgQk8gaXMgZmlyc3QgYWRkZWQNCj4gICAgICAgKiB0byBhIFZNLiBJdCBjYW4gbGF0ZXIgYmUg
bWFwcGVkIGFuZCB1bm1hcHBlZCBtYW55IHRpbWVzIHdpdGhvdXQNCj4gICAgICAgKiByZXBlYXRp
bmcgdGhlc2Ugc3RlcHMuDQo+ICAgICAgICoNCj4gICAgICsgKiAwLiBDcmVhdGUgQk8gZm9yIERN
QSBtYXBwaW5nLCBpZiBuZWVkZWQNCj4gICAgICAgKiAxLiBBbGxvY2F0ZSBhbmQgaW5pdGlhbGl6
ZSBCTyBWQSBlbnRyeSBkYXRhIHN0cnVjdHVyZQ0KPiAgICAgICAqIDIuIEFkZCBCTyB0byB0aGUg
Vk0NCj4gICAgICAgKiAzLiBEZXRlcm1pbmUgQVNJQy1zcGVjaWZpYyBQVEUgZmxhZ3MNCj4gICAg
IEBAIC00ODgsMTAgKzU5MywxMiBAQCBzdGF0aWMgdWludDY0X3QgZ2V0X3B0ZV9mbGFncyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGtnZF9tZW0gKm1lbSkNCj4gICAgICBzdGF0
aWMgaW50IGtmZF9tZW1fYXR0YWNoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
a2dkX21lbSAqbWVtLA0KPiAgICAgIAkJc3RydWN0IGFtZGdwdV92bSAqdm0sIGJvb2wgaXNfYXFs
KQ0KPiAgICAgIHsNCj4gICAgICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmJvX2FkZXYgPSBhbWRn
cHVfdHRtX2FkZXYobWVtLT5iby0+dGJvLmJkZXYpOw0KPiAgICAgIAl1bnNpZ25lZCBsb25nIGJv
X3NpemUgPSBtZW0tPmJvLT50Ym8uYmFzZS5zaXplOw0KPiAgICAgIAl1aW50NjRfdCB2YSA9IG1l
bS0+dmE7DQo+ICAgICAgCXN0cnVjdCBrZmRfbWVtX2F0dGFjaG1lbnQgKmF0dGFjaG1lbnRbMl0g
PSB7TlVMTCwgTlVMTH07DQo+ICAgICAgCXN0cnVjdCBhbWRncHVfYm8gKmJvWzJdID0ge05VTEws
IE5VTEx9Ow0KPiAgICAgKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdvYmo7DQo+ICAgICAgCWlu
dCBpLCByZXQ7DQo+DQo+ICAgICAgCWlmICghdmEpIHsNCj4gICAgIEBAIC01MDksMTQgKzYxNiwz
NyBAQCBzdGF0aWMgaW50IGtmZF9tZW1fYXR0YWNoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBzdHJ1Y3Qga2dkX21lbSAqbWVtLA0KPiAgICAgIAkJcHJfZGVidWcoIlx0IGFkZCBWQSAweCVs
bHggLSAweCVsbHggdG8gdm0gJXBcbiIsIHZhLA0KPiAgICAgIAkJCSB2YSArIGJvX3NpemUsIHZt
KTsNCj4NCj4gICAgIC0JCS8qIEZJWE1FOiBGb3Igbm93IGFsbCBhdHRhY2htZW50cyB1c2UgdGhl
IHNhbWUgQk8uIFRoaXMgaXMNCj4gICAgIC0JCSAqIGluY29ycmVjdCBiZWNhdXNlIG9uZSBCTyBj
YW4gb25seSBoYXZlIG9uZSBETUEgbWFwcGluZw0KPiAgICAgLQkJICogZm9yIG9uZSBHUFUuIFdl
IG5lZWQgb25lIEJPIHBlciBHUFUsIGUuZy4gYSBETUFCdWYNCj4gICAgIC0JCSAqIGltcG9ydCB3
aXRoIGR5bmFtaWMgYXR0YWNobWVudC4gVGhpcyB3aWxsIGJlIGFkZHJlc3NlZA0KPiAgICAgLQkJ
ICogb25lIEJPLXR5cGUgYXQgYSB0aW1lIGluIHN1YnNlcXVlbnQgcGF0Y2hlcy4NCj4gICAgIC0J
CSAqLw0KPiAgICAgLQkJYm9baV0gPSBtZW0tPmJvOw0KPiAgICAgLQkJZHJtX2dlbV9vYmplY3Rf
Z2V0KCZib1tpXS0+dGJvLmJhc2UpOw0KPiAgICAgKwkJaWYgKGFkZXYgPT0gYm9fYWRldiB8fCAo
bWVtLT5kb21haW4gPT0gQU1ER1BVX0dFTV9ET01BSU5fVlJBTSAmJg0KPiAgICAgKwkJCQkJYW1k
Z3B1X3hnbWlfc2FtZV9oaXZlKGFkZXYsIGJvX2FkZXYpKSkgew0KPiAgICAgKwkJCS8qIE1hcHBp
bmdzIG9uIHRoZSBsb2NhbCBHUFUgYW5kIFZSQU0gbWFwcGluZ3MgaW4gdGhlDQo+ICAgICArCQkJ
ICogbG9jYWwgaGl2ZSBzaGFyZSB0aGUgb3JpZ2luYWwgQk8NCj4gICAgICsJCQkgKi8NCj4gICAg
ICsJCQlhdHRhY2htZW50W2ldLT50eXBlID0gS0ZEX01FTV9BVFRfU0hBUkVEOw0KPiAgICAgKwkJ
CWJvW2ldID0gbWVtLT5ibzsNCj4gICAgICsJCQlkcm1fZ2VtX29iamVjdF9nZXQoJmJvW2ldLT50
Ym8uYmFzZSk7DQo+ICAgICArCQl9IGVsc2UgaWYgKGkgPiAwKSB7DQo+ICAgICArCQkJLyogTXVs
dGlwbGUgbWFwcGluZ3Mgb24gdGhlIHNhbWUgR1BVIHNoYXJlIHRoZSBCTyAqLw0KPiAgICAgKwkJ
CWF0dGFjaG1lbnRbaV0tPnR5cGUgPSBLRkRfTUVNX0FUVF9TSEFSRUQ7DQo+ICAgICArCQkJYm9b
aV0gPSBib1swXTsNCj4gICAgICsJCQlkcm1fZ2VtX29iamVjdF9nZXQoJmJvW2ldLT50Ym8uYmFz
ZSk7DQo+ICAgICArCQl9IGVsc2UgaWYgKGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJtbShtZW0tPmJv
LT50Ym8udHRtKSkgew0KPiAgICAgKwkJCS8qIENyZWF0ZSBhbiBTRyBCTyB0byBETUEtbWFwIHVz
ZXJwdHJzIG9uIG90aGVyIEdQVXMgKi8NCj4gICAgICsJCQlhdHRhY2htZW50W2ldLT50eXBlID0g
S0ZEX01FTV9BVFRfVVNFUlBUUjsNCj4gICAgICsJCQlyZXQgPSBhbWRncHVfZ2VtX29iamVjdF9j
cmVhdGUoYWRldiwgYm9fc2l6ZSwgMSwNCj4gICAgICsJCQkJCQkgICAgICAgQU1ER1BVX0dFTV9E
T01BSU5fQ1BVLA0KPiAgICAgKwkJCQkJCSAgICAgICAwLCB0dG1fYm9fdHlwZV9zZywNCj4gICAg
ICsJCQkJCQkgICAgICAgbWVtLT5iby0+dGJvLmJhc2UucmVzdiwNCj4gICAgICsJCQkJCQkgICAg
ICAgJmdvYmopOw0KPiAgICAgKwkJCWlmIChyZXQpDQo+ICAgICArCQkJCWdvdG8gdW53aW5kOw0K
PiAgICAgKwkJCWJvW2ldID0gZ2VtX3RvX2FtZGdwdV9ibyhnb2JqKTsNCj4gICAgICsJCQlib1tp
XS0+cGFyZW50ID0gYW1kZ3B1X2JvX3JlZihtZW0tPmJvKTsNCj4gICAgICsJCX0gZWxzZSB7DQo+
ICAgICArCQkJLyogRklYTUU6IE5lZWQgdG8gRE1BLW1hcCBvdGhlciBCTyB0eXBlcyAqLw0KPiAg
ICAgKwkJCWF0dGFjaG1lbnRbaV0tPnR5cGUgPSBLRkRfTUVNX0FUVF9TSEFSRUQ7DQo+ICAgICAr
CQkJYm9baV0gPSBtZW0tPmJvOw0KPiAgICAgKwkJCWRybV9nZW1fb2JqZWN0X2dldCgmYm9baV0t
PnRiby5iYXNlKTsNCj4gICAgICsJCX0NCj4NCj4gICAgICAJCS8qIEFkZCBCTyB0byBWTSBpbnRl
cm5hbCBkYXRhIHN0cnVjdHVyZXMgKi8NCj4gICAgICAJCWF0dGFjaG1lbnRbaV0tPmJvX3ZhID0g
YW1kZ3B1X3ZtX2JvX2FkZChhZGV2LCB2bSwgYm9baV0pOw0KPiAgICAgLS0gDQo+ICAgICAyLjMx
LjENCj4NCj4gICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+ICAgICBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+ICAgICBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+ICAgICANCj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdA0KPiBzLmZyZWVkZXNrdG9w
Lm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wNCU3QzAxJTdD
DQo+IHBoaWxpcC55YW5nJTQwYW1kLmNvbSU3QzM3NjYwNDNjNDY3MDQxY2MzNTg0MDhkOTA5MmU1
OTkwJTdDM2RkODk2MWZlNDgNCj4gODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1
NTA5MTY5NDI0NzQ0MDglN0NVbmtub3duJTdDVFdGcGJHWg0KPiBzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzDQo+IEQl
N0MxMDAwJmFtcDtzZGF0YT1IMUglMkJDd1NlTGtjamlVTWFFJTJGY3pqJTJCWXBCS3VGJTJGaHFu
ZW4wcDlkdUc0VU0NCj4gJTNEJmFtcDtyZXNlcnZlZD0wDQo+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmcl
MkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NwaGlsaXAu
eWFuZyU0MGFtZC5jb20lN0MzNzY2MDQzYzQ2NzA0MWNjMzU4NDA4ZDkwOTJlNTk5MCU3QzNkZDg5
NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1NTA5MTY5NDI0ODQ0MDIl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVN
eklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9TjVlaVJr
T1d5MnBrQUJMWG96dGkwdVUwY2hIZzN3N0pGemdOJTJGcWRMZE9BJTNEJmFtcDtyZXNlcnZlZD0w
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
