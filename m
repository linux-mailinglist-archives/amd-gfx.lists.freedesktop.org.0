Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE466413687
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Sep 2021 17:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77AF6EA41;
	Tue, 21 Sep 2021 15:51:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89626EA41;
 Tue, 21 Sep 2021 15:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fw7K2+BE49Gyw+Ine7jrD6mfT2Kjwgb7fSa4FZa++36oeGUk4Ty+H86FguIPrU29YTKaPH2VN49LqG/MeqDO7t/z4PLu0QyoOY4SwWOrCB5nM9GgLrhnRvioGGYvCnElNg45U4PruEesXNfP+azbHhrHI+NFzXYAiORkAvN5OY7Yl13UEx9O1iCmArXsNRtB0IaSdhu9U0Pot/t4KJ17r0Vb02wbk89MGwYPaf/cVEHMLNUaPKfNbh6ZVxt8DKZhFLXO9lb+RYSrrZgaBakwcOoz/p0VdnpN7P1B8zM2rT7kD+VIvhjYJr88RrFdRFxphUWRQxVkouQMCCkV2RdPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gq5+eD1oIpC3fCSLw/0aLECmU/HQfXyKROLov7l3B6A=;
 b=F880Y30JL5ee1+1T5tC42s08q+rwM3u+abSRb1iZGevh03D/H7N00OJ9usQ7kYdVftE1EoHr6kJSH92/h4A2ZZVq4ZjNHTRA5ZK8SQ2Q+gQXZeCgMapTPKJVdrI7TLjpYIS/AtFAcz46nqHkY7i9X31Jaw5ZDTU57eX7PHfWSL/1wSRcGkNgQbBuLGRruDiVrEk1McF9oxhLBxvnNmI05C83f4nPOf4uYeldRDTZs6AfYVry8iCjPt6H/gDVwN6d/iiT8JXFoSXsnjYXEzVArrv0xqFV1dWXYQufB4Q/fCVU3n/F98osYICZVqT9k5zRhnkgBMPmy52Skj5HHwjciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq5+eD1oIpC3fCSLw/0aLECmU/HQfXyKROLov7l3B6A=;
 b=zC+0UprgQ4VbxE/kiX2DGua4DPJc09GB/XGrWI+b6pCbSATPY724PllaOLZOJ3idBexVsDnhDNHWDPfqVbLKXRTlw4O4NK/U62O9jH7NiNL0RB350lun1FwbfZK2jjbxh6x5tYI5b/EQIcFKKAcg9+zRzzqadK/pPiAnHwt2Xt8=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 15:51:44 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::69b7:2dfa:9867:4a1e]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::69b7:2dfa:9867:4a1e%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 15:51:44 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] Add drm buddy manager support to amdgpu driver
Thread-Topic: [PATCH 2/2] Add drm buddy manager support to amdgpu driver
Thread-Index: AQHXrlTBTsyACrKkPkqDWcB4l34U06uuMrKAgABCEfA=
Date: Tue, 21 Sep 2021 15:51:44 +0000
Message-ID: <MN2PR12MB4342C3996173DC4DB6B34FC9E4A19@MN2PR12MB4342.namprd12.prod.outlook.com>
References: <20210920192110.221153-1-Arunpravin.PaneerSelvam@amd.com>
 <adf913fd-da60-70b5-2a83-608d8b8b9cba@amd.com>
In-Reply-To: <adf913fd-da60-70b5-2a83-608d8b8b9cba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-09-21T15:51:39Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=e2aacbac-e924-40ba-9f8e-3dc723e9e986;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00b5c225-b46d-407a-edda-08d97d17b66e
x-ms-traffictypediagnostic: MN2PR12MB4206:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB420666FE61170EC1B4E98A62E4A19@MN2PR12MB4206.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mNzCW6o/peXwzz/ldrUSrz9PpwUpcZGAEYyT7+MKhKB29bdWv07xlgqht6FQLMN/5JQZ+y0n8KWureKoCZ8EGFuEflHfzrPYdtheqSMoGIyA4KKmWnJ/p/jJAfRO2jIfXhxMKFK9zfcCJpPYxW55bDAp6qoNAGUCMtzH247na9BiCm8mJI92Sji/Liv41B31qaHs/3AhZwZezLFA68hVEylBe6DPp2pGdKcYm0XTtWUJah9YybopW52Biwxwoc9uxlKcUxSx2Cm+X0nO5ZImLgDf8AxhKQkAY158NwM8erQFnj58UF57Hqtk6d3w9jWutXNUiVUYfsdtk+vdrL+Bv/qs8ofe+MZ8RLIREZSdpw6BuCljBo6TtmvvDfRQBvfpg56FuEtIEUjYtr1pHD7AO+wPHq51gDogOUld4rIQSrSAeA0T38tF/NknRwU4z2+7svlQqmG0mjC4wtPHWeFn/lVjS0AXN9xpIjfRdpIq4vLdAJME+TVUWSQCSHck33PSiKwzIIC+O6Ohkefspzn8kQ/EYES7i0dGzIKp7yidBo3x19dVTyL51zNVEDVMIAFFEGs93q9fRLBAUHFUgIhVOidjfT14wiDAYyI52j845OP2Om0oKrcTBBrIXqZtzB+a5Z+RjxLNPBsLaAdBllw4jtR9OOs4YrSSAz/sn0ndrnzpVGNDoEAGEo8W4i5wudjE7YrONdsjfao7y5jwHizUgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6636002)(55016002)(8936002)(9686003)(71200400001)(66476007)(122000001)(30864003)(66556008)(110136005)(38100700002)(76116006)(26005)(316002)(2906002)(508600001)(38070700005)(186003)(5660300002)(53546011)(7696005)(6506007)(33656002)(8676002)(83380400001)(52536014)(66946007)(66446008)(64756008)(86362001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUV4cndDbVQvYUtFbzhpZlNuRE10dmV0M2UzRzkyZkRYbzFsTEdQVE54RzR4?=
 =?utf-8?B?N041NlozRnVRU1cwK2tOOVU1dmVmaS82MEVCYXpDOUdibVAyWmlZem1kTGEr?=
 =?utf-8?B?U3JSbVlFSnNSb2xqdEF6WG1Zeml1OWxDYmZDZFRQRUM5NktzY2djb0VFTldi?=
 =?utf-8?B?SExBY3d2azJtcUl1UDBWZUR1dmZDYlBnU0JVaStKMHdIWTFpS3dqQmg3TGUv?=
 =?utf-8?B?YmtGeHJzSWt6TDlmaE5kQ0FOQ0R6WE5CQ284R3kxcUZwMVNpS2N0MWQyUUZJ?=
 =?utf-8?B?MERvV05ZWTBPaFJJMnBqRzdtYnV6SWRJaGdNenJ5ck5OeU55QUpNT0tDOTJP?=
 =?utf-8?B?NjA0NjZnSGY1NlFHVEhUSHFVRWNCQnpZODR5RW9jdHFtNzFSOWJYQzY5ZEVN?=
 =?utf-8?B?YXlmYUZyS1FzYjRZQW8zclpiZlFOc2ZSVjRUT28wQUxmQkQ2NzFHWHZVQkdw?=
 =?utf-8?B?NW9oRW1VKzlubjNBVFlzaVZnRkpyckkwRTJGOG5ENmhKY01RQm85RFRRUnVw?=
 =?utf-8?B?Zjh5T0lFanR2NmI2VTVSOVllaGx3OGFZWndTUUxrcmx0dHdrMUkrbG5oWGJV?=
 =?utf-8?B?MHAxOUc0K3VKalhqMVpBNGFidXFvMGNsOS9QTTZEcVpKTm1UcTZWLy8zak1N?=
 =?utf-8?B?K2JCd1Q0NmxpM2xJUEk2Mnh5UmVCRjQ2RElFWEtqVnFFbXpEMDk5Q3plUXpH?=
 =?utf-8?B?QVg4aS9KK0xVS1h3M0NvTjFZalprMDNjNmtoVWdsRFkrVzc4RTVNREZpQ0pY?=
 =?utf-8?B?Q2trTWlqRmFTNEI2MWFsYlBlK0FJa1FnWFVrYktzNHd6SnZLMWs0cE13MG0w?=
 =?utf-8?B?ZVdLams2SlpQNnlzQjYweGpna1hXd2FUNmJvYmQzNFJHZnFHL0RCcFYrSFZZ?=
 =?utf-8?B?UXQ4am5zMkw3RzRPdk5kTzBTK2ZSaVJ6b2JFRk5wUWJaS0FWZVlzMTkzbCtY?=
 =?utf-8?B?T2VnL1BMZFJOVDEwaG5HSjkveEhVQ1ZLcXlkMGpSUTliejZIQWpNaVg3dGpt?=
 =?utf-8?B?SU9QL0trWXQ5eER3dGRqMHUvTmE2SVAvTkxVdDg5V0pmRHZFakNSYWQzaVcw?=
 =?utf-8?B?ZmM2ZFZQYm01QWY5NHVWYWluUmV2T2dtcnBXVnJUc3ZtSVZIQUlsekFWQkN3?=
 =?utf-8?B?MFRIb2FPZmV3QlpHQ2JhdWFJLzNsOHpKTm9VZU1CbU5hcFRCSHF6akEzb080?=
 =?utf-8?B?UzBpeTFHbCsraXd1anhzRzB2T042ckQrVXRVNGhZelRIQ0xXRUxjZEJRTndY?=
 =?utf-8?B?SlVJMkxPVjB0SVVteHA2ZGs1azR2OHk4YXdoYXVlZmdmNzVXallyV3lBUDFJ?=
 =?utf-8?B?eHZOUHJjLzlZZUlxMEcyWnlJb3AyblVyV2hBNkdVOG50Y3I1T1VYcWpSU3ZK?=
 =?utf-8?B?VEV6S0NadURmd084aDJZNEpEWTJlMFFPWGNMVWZSVjhldEpjY2JNUVJRVDFs?=
 =?utf-8?B?VWRvemZ4S0hyNUs0MnkwK3YzaTRMU0RYWGtZSzJrQkY2V1FMOEsvNE0xbkNj?=
 =?utf-8?B?Nnd2eXNOUTVCK0FkOVJXUUlydGRhVWNDS09BQTQwSXNCc3NoMkhoU3BxZjN4?=
 =?utf-8?B?cmtrYnhrVHU4bElGZWsxTWp2RE1OckVMZVd5aU9OTUY5UGd6d3V0MVdmUklo?=
 =?utf-8?B?RHBHYkxBZ2ttc1pZNlZhN0VTUGZNSDNLYXVoU296RTViY3NzaG14cFhzc2l2?=
 =?utf-8?B?UC9pNzlEZG1GVFRPbU4zbHd1bWpsSVpKaUt3SFJuTTZzY0d5TStLMmdkVW5Z?=
 =?utf-8?Q?1Ots8s9eq8pnOg1bJrmVk9br5oucCJFprPp9LIC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b5c225-b46d-407a-edda-08d97d17b66e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 15:51:44.6834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEEGjmiuE3t6TRVGTYNSmVwS+CEK//gsxDgsfm91KTZ77mCvfeMj/GK2rLOlKyLCf6LCNC3AJYwHJyOlNOUk0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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

W0FNRCBQdWJsaWMgVXNlXQ0KDQpIaSBDaHJpc3RpYW4sDQpQbGVhc2UgZmluZCBteSBjb21tZW50
cy4NCg0KVGhhbmtzLA0KQXJ1bg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtv
ZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IA0KU2VudDogVHVlc2Rh
eSwgU2VwdGVtYmVyIDIxLCAyMDIxIDI6MzQgUE0NClRvOiBQYW5lZXIgU2VsdmFtLCBBcnVucHJh
dmluIDxBcnVucHJhdmluLlBhbmVlclNlbHZhbUBhbWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IG1hdHRoZXcuYXVsZEBpbnRlbC5jb207IGRhbmllbEBmZnds
bC5jaDsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3Vi
amVjdDogUmU6IFtQQVRDSCAyLzJdIEFkZCBkcm0gYnVkZHkgbWFuYWdlciBzdXBwb3J0IHRvIGFt
ZGdwdSBkcml2ZXINCg0KQW0gMjAuMDkuMjEgdW0gMjE6MjEgc2NocmllYiBBcnVucHJhdmluOg0K
PiBSZXBsYWNlIGRybV9tbSB3aXRoIGRybSBidWRkeSBtYW5hZ2VyIGZvciBWUkFNIG1lbW9yeSBt
YW5hZ2VtZW50DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEFydW5wcmF2aW4gPEFydW5wcmF2aW4uUGFu
ZWVyU2VsdmFtQGFtZC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jlc19jdXJzb3IuaCAgICB8ICA3OCArKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5oICAgICAgIHwgICAzICstDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgIHwgMjE2ICsrKysrKysrKystLS0tLS0tLQ0K
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTg5IGluc2VydGlvbnMoKyksIDEwOCBkZWxldGlvbnMoLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yZXNf
Y3Vyc29yLmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jlc19jdXJz
b3IuaA0KPiBpbmRleCBhY2ZhMjA3Y2Y5NzAuLmJhMjQwNTJlOTA2MiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jlc19jdXJzb3IuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmVzX2N1cnNvci5oDQo+IEBAIC0zMCwx
MiArMzAsMjUgQEANCj4gICAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcmVzb3VyY2UuaD4NCj4gICAj
aW5jbHVkZSA8ZHJtL3R0bS90dG1fcmFuZ2VfbWFuYWdlci5oPg0KPiAgIA0KPiArc3RydWN0IGFt
ZGdwdV92cmFtX21ncl9ub2RlIHsNCj4gKwlzdHJ1Y3QgdHRtX3JhbmdlX21ncl9ub2RlIHRub2Rl
Ow0KDQpOQUssIGRvbid0IGJhc2UgdGhpcyBvbiB0dG1fcmFuZ2VfbWdyX25vZGUuIEluc3RlYWQg
dXNlIHR0bV9yZXNvdXJjZS4NCg0KQW5kIHBsZWFzZSBuYW1lIHRoZSBtZW1iZXIgYmFzZSBpbnN0
ZWFkLg0KQXJ1biAtIG9rDQoNCj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGJsb2NrczsNCj4gK307DQo+
ICsNCj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGFtZGdwdV92cmFtX21ncl9ub2RlICogDQo+ICt0
b19hbWRncHVfdnJhbV9tZ3Jfbm9kZShzdHJ1Y3QgdHRtX3Jlc291cmNlICpyZXMpIHsNCj4gKwly
ZXR1cm4gY29udGFpbmVyX29mKGNvbnRhaW5lcl9vZihyZXMsIHN0cnVjdCB0dG1fcmFuZ2VfbWdy
X25vZGUsIGJhc2UpLA0KPiArCQkJc3RydWN0IGFtZGdwdV92cmFtX21ncl9ub2RlLCB0bm9kZSk7
IH0NCj4gKw0KDQpNYXliZSBzdHVmZiB0aGF0IGluIGEgc2VwYXJhdGUgYW1kZ3B1X3ZyYW1fbWdy
LmggZmlsZSB0b2dldGhlciB3aXRoIGFsbCB0aGUgb3RoZXIgZGVmaW5lcyBmb3IgdGhlIHZyYW0g
bWFuYWdlci4NCg0KQXJ1biAtIEkgdGhvdWdodCBhYm91dCBpdCwgd2lsbCBjcmVhdGUgYSBuZXcg
aGVhZGVyIGZpbGUgZm9yIHZyYW0gbWFuYWdlcg0KDQo+ICAgLyogc3RhdGUgYmFjayBmb3Igd2Fs
a2luZyBvdmVyIHZyYW1fbWdyIGFuZCBndHRfbWdyIGFsbG9jYXRpb25zICovDQo+ICAgc3RydWN0
IGFtZGdwdV9yZXNfY3Vyc29yIHsNCj4gICAJdWludDY0X3QJCXN0YXJ0Ow0KPiAgIAl1aW50NjRf
dAkJc2l6ZTsNCj4gICAJdWludDY0X3QJCXJlbWFpbmluZzsNCj4gLQlzdHJ1Y3QgZHJtX21tX25v
ZGUJKm5vZGU7DQo+ICsJdm9pZAkJCSpub2RlOw0KPiArCXVpbnQzMl90CQltZW1fdHlwZTsNCj4g
ICB9Ow0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtNTIsOCArNjUsNiBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgYW1kZ3B1X3Jlc19maXJzdChzdHJ1Y3QgdHRtX3Jlc291cmNlICpyZXMsDQo+ICAgCQkJCSAg
ICB1aW50NjRfdCBzdGFydCwgdWludDY0X3Qgc2l6ZSwNCj4gICAJCQkJICAgIHN0cnVjdCBhbWRn
cHVfcmVzX2N1cnNvciAqY3VyKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGU7
DQo+IC0NCj4gICAJaWYgKCFyZXMgfHwgcmVzLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7
DQo+ICAgCQljdXItPnN0YXJ0ID0gc3RhcnQ7DQo+ICAgCQljdXItPnNpemUgPSBzaXplOw0KPiBA
QCAtNjUsMTQgKzc2LDM5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhbWRncHVfcmVzX2ZpcnN0KHN0
cnVjdCANCj4gdHRtX3Jlc291cmNlICpyZXMsDQo+ICAgDQo+ICAgCUJVR19PTihzdGFydCArIHNp
emUgPiByZXMtPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUKTsNCj4gICANCj4gLQlub2RlID0gdG9f
dHRtX3JhbmdlX21ncl9ub2RlKHJlcyktPm1tX25vZGVzOw0KPiAtCXdoaWxlIChzdGFydCA+PSBu
b2RlLT5zaXplIDw8IFBBR0VfU0hJRlQpDQo+IC0JCXN0YXJ0IC09IG5vZGUrKy0+c2l6ZSA8PCBQ
QUdFX1NISUZUOw0KPiArCWN1ci0+bWVtX3R5cGUgPSByZXMtPm1lbV90eXBlOw0KPiArDQo+ICsJ
aWYgKGN1ci0+bWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0pIHsNCg0KUmF0aGVyIHVzZSBhIHN3aXRj
aC9jYXNlIGhlcmUuDQpBcnVuIC0gb2sNCg0KPiArCQlzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpi
bG9jazsNCj4gKwkJc3RydWN0IGxpc3RfaGVhZCAqaGVhZCwgKm5leHQ7DQo+ICsNCj4gKwkJaGVh
ZCA9ICZ0b19hbWRncHVfdnJhbV9tZ3Jfbm9kZShyZXMpLT5ibG9ja3M7DQo+ICsNCj4gKwkJYmxv
Y2sgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoaGVhZCwgc3RydWN0IGRybV9idWRkeV9ibG9j
aywgbGluayk7DQo+ICsJCXdoaWxlIChzdGFydCA+PSBibG9jay0+c2l6ZSA8PCBQQUdFX1NISUZU
KSB7DQo+ICsJCQlzdGFydCAtPSBibG9jay0+c2l6ZSA8PCBQQUdFX1NISUZUOw0KPiArDQo+ICsJ
CQluZXh0ID0gYmxvY2stPmxpbmsubmV4dDsNCj4gKwkJCWlmIChuZXh0ICE9IGhlYWQpDQo+ICsJ
CQkJYmxvY2sgPSBsaXN0X2VudHJ5KG5leHQsIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2ssIGxpbmsp
Ow0KPiArCQl9DQo+ICAgDQo+IC0JY3VyLT5zdGFydCA9IChub2RlLT5zdGFydCA8PCBQQUdFX1NI
SUZUKSArIHN0YXJ0Ow0KPiAtCWN1ci0+c2l6ZSA9IG1pbigobm9kZS0+c2l6ZSA8PCBQQUdFX1NI
SUZUKSAtIHN0YXJ0LCBzaXplKTsNCj4gLQljdXItPnJlbWFpbmluZyA9IHNpemU7DQo+IC0JY3Vy
LT5ub2RlID0gbm9kZTsNCj4gKwkJY3VyLT5zdGFydCA9IChibG9jay0+c3RhcnQgPDwgUEFHRV9T
SElGVCkgKyBzdGFydDsNCj4gKwkJY3VyLT5zaXplID0gbWluKChibG9jay0+c2l6ZSA8PCBQQUdF
X1NISUZUKSAtIHN0YXJ0LCBzaXplKTsNCj4gKwkJY3VyLT5yZW1haW5pbmcgPSBzaXplOw0KPiAr
CQljdXItPm5vZGUgPSBibG9jazsNCj4gKwl9IGVsc2UgaWYgKGN1ci0+bWVtX3R5cGUgPT0gVFRN
X1BMX1RUKSB7DQo+ICsJCXN0cnVjdCBkcm1fbW1fbm9kZSAqbm9kZTsNCj4gKw0KPiArCQlub2Rl
ID0gdG9fdHRtX3JhbmdlX21ncl9ub2RlKHJlcyktPm1tX25vZGVzOw0KPiArCQl3aGlsZSAoc3Rh
cnQgPj0gbm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZUKQ0KPiArCQkJc3RhcnQgLT0gbm9kZSsrLT5z
aXplIDw8IFBBR0VfU0hJRlQ7DQo+ICsNCj4gKwkJY3VyLT5zdGFydCA9IChub2RlLT5zdGFydCA8
PCBQQUdFX1NISUZUKSArIHN0YXJ0Ow0KPiArCQljdXItPnNpemUgPSBtaW4oKG5vZGUtPnNpemUg
PDwgUEFHRV9TSElGVCkgLSBzdGFydCwgc2l6ZSk7DQo+ICsJCWN1ci0+cmVtYWluaW5nID0gc2l6
ZTsNCj4gKwkJY3VyLT5ub2RlID0gbm9kZTsNCg0KV2l0aCBhIGRlZmF1bHQgaGFuZGxpbmcgZm9y
IG90aGVyIHBsYWNlbWVudCB0eXBlcy4NCkFydW4gLSBvaw0KDQo+ICsJfQ0KPiAgIH0NCj4gICAN
Cj4gICAvKioNCj4gQEAgLTg1LDggKzEyMSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhbWRncHVf
cmVzX2ZpcnN0KHN0cnVjdCB0dG1fcmVzb3VyY2UgKnJlcywNCj4gICAgKi8NCj4gICBzdGF0aWMg
aW5saW5lIHZvaWQgYW1kZ3B1X3Jlc19uZXh0KHN0cnVjdCBhbWRncHVfcmVzX2N1cnNvciAqY3Vy
LCB1aW50NjRfdCBzaXplKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUgPSBj
dXItPm5vZGU7DQo+IC0NCj4gICAJQlVHX09OKHNpemUgPiBjdXItPnJlbWFpbmluZyk7DQo+ICAg
DQo+ICAgCWN1ci0+cmVtYWluaW5nIC09IHNpemU7DQo+IEBAIC05OSw5ICsxMzMsMjMgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGFtZGdwdV9yZXNfbmV4dChzdHJ1Y3QgYW1kZ3B1X3Jlc19jdXJzb3Ig
KmN1ciwgdWludDY0X3Qgc2l6ZSkNCj4gICAJCXJldHVybjsNCj4gICAJfQ0KPiAgIA0KPiAtCWN1
ci0+bm9kZSA9ICsrbm9kZTsNCj4gLQljdXItPnN0YXJ0ID0gbm9kZS0+c3RhcnQgPDwgUEFHRV9T
SElGVDsNCj4gLQljdXItPnNpemUgPSBtaW4obm9kZS0+c2l6ZSA8PCBQQUdFX1NISUZULCBjdXIt
PnJlbWFpbmluZyk7DQo+ICsJaWYgKGN1ci0+bWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0pIHsNCj4g
KwkJc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2sgPSBjdXItPm5vZGU7DQo+ICsJCXN0cnVj
dCBsaXN0X2hlYWQgKm5leHQ7DQo+ICsNCj4gKwkJbmV4dCA9IGJsb2NrLT5saW5rLm5leHQ7DQo+
ICsJCWJsb2NrID0gbGlzdF9lbnRyeShuZXh0LCBzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrLCBsaW5r
KTsNCj4gKw0KPiArCQljdXItPm5vZGUgPSBibG9jazsNCj4gKwkJY3VyLT5zdGFydCA9IGJsb2Nr
LT5zdGFydCA8PCBQQUdFX1NISUZUOw0KPiArCQljdXItPnNpemUgPSBtaW4oYmxvY2stPnNpemUg
PDwgUEFHRV9TSElGVCwgY3VyLT5yZW1haW5pbmcpOw0KPiArCX0gZWxzZSBpZiAoY3VyLT5tZW1f
dHlwZSA9PSBUVE1fUExfVFQpIHsNCj4gKwkJc3RydWN0IGRybV9tbV9ub2RlICpub2RlID0gY3Vy
LT5ub2RlOw0KPiArDQo+ICsJCWN1ci0+bm9kZSA9ICsrbm9kZTsNCj4gKwkJY3VyLT5zdGFydCA9
IG5vZGUtPnN0YXJ0IDw8IFBBR0VfU0hJRlQ7DQo+ICsJCWN1ci0+c2l6ZSA9IG1pbihub2RlLT5z
aXplIDw8IFBBR0VfU0hJRlQsIGN1ci0+cmVtYWluaW5nKTsNCj4gKwl9DQo+ICAgfQ0KPiAgIA0K
PiAgICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5oIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaA0K
PiBpbmRleCBlNjlmM2U4ZTA2ZTUuLjk2YzhlOGFhYTBlZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaA0KPiBAQCAtMjYsNiArMjYsNyBAQA0KPiAgIA0KPiAg
ICNpbmNsdWRlIDxsaW51eC9kbWEtZGlyZWN0aW9uLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9ncHVf
c2NoZWR1bGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9idWRkeS5oPg0KPiAgICNpbmNsdWRl
ICJhbWRncHUuaCINCj4gICANCj4gICAjZGVmaW5lIEFNREdQVV9QTF9HRFMJCShUVE1fUExfUFJJ
ViArIDApDQo+IEBAIC00MCw3ICs0MSw3IEBADQo+ICAgDQo+ICAgc3RydWN0IGFtZGdwdV92cmFt
X21nciB7DQo+ICAgCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciBtYW5hZ2VyOw0KPiAtCXN0
cnVjdCBkcm1fbW0gbW07DQo+ICsJc3RydWN0IGRybV9idWRkeV9tbSBtbTsNCj4gICAJc3Bpbmxv
Y2tfdCBsb2NrOw0KPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIHJlc2VydmF0aW9uc19wZW5kaW5nOw0K
PiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIHJlc2VydmVkX3BhZ2VzOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCj4gaW5kZXggN2IyYjA5ODBlYzQx
Li5kZTBjNWY0Y2FiYWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92cmFtX21nci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92cmFtX21nci5jDQo+IEBAIC0yMyw3ICsyMyw5IEBADQo+ICAgICovDQo+ICAgDQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbGlzdF9z
b3J0Lmg+DQo+ICAgI2luY2x1ZGUgPGRybS90dG0vdHRtX3JhbmdlX21hbmFnZXIuaD4NCj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2J1ZGR5Lmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgImFtZGdwdS5oIg0K
PiAgICNpbmNsdWRlICJhbWRncHVfdm0uaCINCj4gQEAgLTMzLDcgKzM1LDcgQEANCj4gICANCj4g
ICBzdHJ1Y3QgYW1kZ3B1X3ZyYW1fcmVzZXJ2YXRpb24gew0KPiAgIAlzdHJ1Y3QgbGlzdF9oZWFk
IG5vZGU7DQo+IC0Jc3RydWN0IGRybV9tbV9ub2RlIG1tX25vZGU7DQo+ICsJc3RydWN0IGRybV9i
dWRkeV9ibG9jayBtbV9ub2RlOw0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIGlubGluZSBzdHJ1
Y3QgYW1kZ3B1X3ZyYW1fbWdyICogQEAgLTE5NiwxMCArMTk4LDEwIEBAIGNvbnN0IA0KPiBzdHJ1
Y3QgYXR0cmlidXRlX2dyb3VwIGFtZGdwdV92cmFtX21ncl9hdHRyX2dyb3VwID0gew0KPiAgICAq
IENhbGN1bGF0ZSBob3cgbWFueSBieXRlcyBvZiB0aGUgTU0gbm9kZSBhcmUgaW5zaWRlIHZpc2li
bGUgVlJBTQ0KPiAgICAqLw0KPiAgIHN0YXRpYyB1NjQgYW1kZ3B1X3ZyYW1fbWdyX3Zpc19zaXpl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAtCQkJCSAgICBzdHJ1Y3QgZHJtX21tX25v
ZGUgKm5vZGUpDQo+ICsJCQkJICAgIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2sgKmJsb2NrKQ0KPiAg
IHsNCj4gLQl1aW50NjRfdCBzdGFydCA9IG5vZGUtPnN0YXJ0IDw8IFBBR0VfU0hJRlQ7DQo+IC0J
dWludDY0X3QgZW5kID0gKG5vZGUtPnNpemUgKyBub2RlLT5zdGFydCkgPDwgUEFHRV9TSElGVDsN
Cj4gKwl1aW50NjRfdCBzdGFydCA9IGJsb2NrLT5zdGFydCA8PCBQQUdFX1NISUZUOw0KPiArCXVp
bnQ2NF90IGVuZCA9IChibG9jay0+c2l6ZSArIGJsb2NrLT5zdGFydCkgPDwgUEFHRV9TSElGVDsN
Cj4gICANCj4gICAJaWYgKHN0YXJ0ID49IGFkZXYtPmdtYy52aXNpYmxlX3ZyYW1fc2l6ZSkNCj4g
ICAJCXJldHVybiAwOw0KPiBAQCAtMjIwLDggKzIyMiw4IEBAIHU2NCBhbWRncHVfdnJhbV9tZ3Jf
Ym9fdmlzaWJsZV9zaXplKHN0cnVjdCBhbWRncHVfYm8gKmJvKQ0KPiAgIHsNCj4gICAJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsNCj4g
ICAJc3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzID0gYm8tPnRiby5yZXNvdXJjZTsNCj4gLQl1bnNp
Z25lZCBwYWdlcyA9IHJlcy0+bnVtX3BhZ2VzOw0KPiAtCXN0cnVjdCBkcm1fbW1fbm9kZSAqbW07
DQo+ICsJc3RydWN0IGFtZGdwdV92cmFtX21ncl9ub2RlICp2bm9kZSA9IHRvX2FtZGdwdV92cmFt
X21ncl9ub2RlKHJlcyk7DQo+ICsJc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2s7DQo+ICAg
CXU2NCB1c2FnZTsNCj4gICANCj4gICAJaWYgKGFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUo
JmFkZXYtPmdtYykpDQo+IEBAIC0yMzAsOSArMjMyLDggQEAgdTY0IGFtZGdwdV92cmFtX21ncl9i
b192aXNpYmxlX3NpemUoc3RydWN0IGFtZGdwdV9ibyAqYm8pDQo+ICAgCWlmIChyZXMtPnN0YXJ0
ID49IGFkZXYtPmdtYy52aXNpYmxlX3ZyYW1fc2l6ZSA+PiBQQUdFX1NISUZUKQ0KPiAgIAkJcmV0
dXJuIDA7DQo+ICAgDQo+IC0JbW0gPSAmY29udGFpbmVyX29mKHJlcywgc3RydWN0IHR0bV9yYW5n
ZV9tZ3Jfbm9kZSwgYmFzZSktPm1tX25vZGVzWzBdOw0KPiAtCWZvciAodXNhZ2UgPSAwOyBwYWdl
czsgcGFnZXMgLT0gbW0tPnNpemUsIG1tKyspDQo+IC0JCXVzYWdlICs9IGFtZGdwdV92cmFtX21n
cl92aXNfc2l6ZShhZGV2LCBtbSk7DQo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShibG9jaywgJnZu
b2RlLT5ibG9ja3MsIGxpbmspDQo+ICsJCXVzYWdlICs9IGFtZGdwdV92cmFtX21ncl92aXNfc2l6
ZShhZGV2LCBibG9jayk7DQo+ICAgDQo+ICAgCXJldHVybiB1c2FnZTsNCj4gICB9DQo+IEBAIC0y
NDIsMTIgKzI0MywxNSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdnJhbV9tZ3JfZG9fcmVzZXJ2ZShz
dHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbikNCj4gICB7DQo+ICAgCXN0cnVjdCBhbWRn
cHVfdnJhbV9tZ3IgKm1nciA9IHRvX3ZyYW1fbWdyKG1hbik7DQo+ICAgCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gdG9fYW1kZ3B1X2RldmljZShtZ3IpOw0KPiAtCXN0cnVjdCBkcm1fbW0g
Km1tID0gJm1nci0+bW07DQo+ICsJc3RydWN0IGRybV9idWRkeV9tbSAqbW0gPSAmbWdyLT5tbTsN
Cj4gICAJc3RydWN0IGFtZGdwdV92cmFtX3Jlc2VydmF0aW9uICpyc3YsICp0ZW1wOw0KPiAgIAl1
aW50NjRfdCB2aXNfdXNhZ2U7DQo+ICsJaW50IHIgPSAwOw0KPiAgIA0KPiAgIAlsaXN0X2Zvcl9l
YWNoX2VudHJ5X3NhZmUocnN2LCB0ZW1wLCAmbWdyLT5yZXNlcnZhdGlvbnNfcGVuZGluZywgbm9k
ZSkgew0KPiAtCQlpZiAoZHJtX21tX3Jlc2VydmVfbm9kZShtbSwgJnJzdi0+bW1fbm9kZSkpDQo+
ICsJCXIgPSBkcm1fYnVkZHlfYWxsb2NfcmFuZ2UobW0sICZyc3YtPm5vZGUsIHJzdi0+bW1fbm9k
ZS5zdGFydCwgDQo+ICtyc3YtPm1tX25vZGUuc2l6ZSk7DQo+ICsNCj4gKwkJaWYgKHVubGlrZWx5
KHIpKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAgIA0KPiAgIAkJZGV2X2RiZyhhZGV2LT5kZXYsICJS
ZXNlcnZhdGlvbiAweCVsbHggLSAlbGxkLCBTdWNjZWVkZWRcbiIsIEBAIA0KPiAtMzMzLDI2ICsz
MzcsMTYgQEAgaW50IGFtZGdwdV92cmFtX21ncl9xdWVyeV9wYWdlX3N0YXR1cyhzdHJ1Y3QgdHRt
X3Jlc291cmNlX21hbmFnZXIgKm1hbiwNCj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+
IC0vKioNCj4gLSAqIGFtZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0IC0gdXBkYXRlIHZpcnR1YWwg
c3RhcnQgYWRkcmVzcw0KPiAtICoNCj4gLSAqIEBtZW06IHR0bV9yZXNvdXJjZSB0byB1cGRhdGUN
Cj4gLSAqIEBub2RlOiBqdXN0IGFsbG9jYXRlZCBub2RlDQo+IC0gKg0KPiAtICogQ2FsY3VsYXRl
IGEgdmlydHVhbCBCTyBzdGFydCBhZGRyZXNzIHRvIGVhc2lseSBjaGVjayBpZiBldmVyeXRoaW5n
IA0KPiBpcyBDUFUNCj4gLSAqIGFjY2Vzc2libGUuDQo+IC0gKi8NCj4gLXN0YXRpYyB2b2lkIGFt
ZGdwdV92cmFtX21ncl92aXJ0X3N0YXJ0KHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSwNCj4gLQkJ
CQkgICAgICAgc3RydWN0IGRybV9tbV9ub2RlICpub2RlKQ0KPiArc3RhdGljIGludCBzb3J0X2Js
b2Nrcyh2b2lkICpwcml2LCBjb25zdCBzdHJ1Y3QgbGlzdF9oZWFkICpBLA0KPiArCQkJCQljb25z
dCBzdHJ1Y3QgbGlzdF9oZWFkICpCKQ0KDQpQbGVhc2UgcHJlZml4IGFsbCBmdW5jdGlvbiB3aXRo
IGFtZGdwdV92cmFtX21ncl8uDQpBcnVuIC0gb2sNCg0KPiAgIHsNCj4gLQl1bnNpZ25lZCBsb25n
IHN0YXJ0Ow0KPiArCXN0cnVjdCBkcm1fYnVkZHlfYmxvY2sgKmEgPSBsaXN0X2VudHJ5KEEsIHR5
cGVvZigqYSksIGxpbmspOw0KPiArCXN0cnVjdCBkcm1fYnVkZHlfYmxvY2sgKmIgPSBsaXN0X2Vu
dHJ5KEIsIHR5cGVvZigqYiksIGxpbmspOw0KPiAgIA0KPiAtCXN0YXJ0ID0gbm9kZS0+c3RhcnQg
KyBub2RlLT5zaXplOw0KPiAtCWlmIChzdGFydCA+IG1lbS0+bnVtX3BhZ2VzKQ0KPiAtCQlzdGFy
dCAtPSBtZW0tPm51bV9wYWdlczsNCj4gKwlpZiAoYS0+c3RhcnQgPCBiLT5zdGFydCkNCj4gKwkJ
cmV0dXJuIC0xOw0KPiAgIAllbHNlDQo+IC0JCXN0YXJ0ID0gMDsNCj4gLQltZW0tPnN0YXJ0ID0g
bWF4KG1lbS0+c3RhcnQsIHN0YXJ0KTsNCj4gKwkJcmV0dXJuIDE7DQo+ICAgfQ0KPiAgIA0KPiAg
IC8qKg0KPiBAQCAtMzcwLDE1ICszNjQsMjAgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3Jf
bmV3KHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLA0KPiAgIAkJCSAgICAgICBjb25z
dCBzdHJ1Y3QgdHRtX3BsYWNlICpwbGFjZSwNCj4gICAJCQkgICAgICAgc3RydWN0IHR0bV9yZXNv
dXJjZSAqKnJlcykNCj4gICB7DQo+IC0JdW5zaWduZWQgbG9uZyBscGZuLCBudW1fbm9kZXMsIHBh
Z2VzX3Blcl9ub2RlLCBwYWdlc19sZWZ0LCBwYWdlczsNCj4gKwl1bnNpZ25lZCBsb25nIGxwZm4s
IHBhZ2VzX3Blcl9ub2RlLCBwYWdlc19sZWZ0LCBwYWdlczsNCj4gICAJc3RydWN0IGFtZGdwdV92
cmFtX21nciAqbWdyID0gdG9fdnJhbV9tZ3IobWFuKTsNCj4gICAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSB0b19hbWRncHVfZGV2aWNlKG1ncik7DQo+ICAgCXVpbnQ2NF90IHZpc191c2Fn
ZSA9IDAsIG1lbV9ieXRlcywgbWF4X2J5dGVzOw0KPiArCXN0cnVjdCBhbWRncHVfdnJhbV9tZ3Jf
bm9kZSAqdm5vZGU7DQo+ICsJc3RydWN0IGRybV9idWRkeV9tbSAqbW0gPSAmbWdyLT5tbTsNCj4g
ICAJc3RydWN0IHR0bV9yYW5nZV9tZ3Jfbm9kZSAqbm9kZTsNCj4gLQlzdHJ1Y3QgZHJtX21tICpt
bSA9ICZtZ3ItPm1tOw0KPiAtCWVudW0gZHJtX21tX2luc2VydF9tb2RlIG1vZGU7DQo+ICsJZW51
bSBkcm1fYnVkZHlfYWxsb2NfbW9kZSBtb2RlOw0KPiArCXN0cnVjdCBkcm1fYnVkZHlfYmxvY2sg
KmJsb2NrOw0KPiArCXVuc2lnbmVkIGludCB2aXNpYmxlX3BmbjsNCj4gKwlib29sIGJhcl9saW1p
dF9lbmFibGVkOw0KPiArCXVuc2lnbmVkIGxvbmcgbl9wYWdlczsNCj4gICAJdW5zaWduZWQgaTsN
Cj4gLQlpbnQgcjsNCj4gKwlpbnQgciA9IDA7DQoNClBsZWFzZSBkb24ndCBpbml0aWFsaXplIHRo
ZSByZXR1cm4gdHlwZSBoZXJlLiBUaGF0J3MgY29uc2lkZXJlZCBiYWQgY29kaW5nIHN0eWxlLg0K
QXJ1biAtIHdpbGwgZml4IGl0DQoNCj4gICANCj4gICAJbHBmbiA9IHBsYWNlLT5scGZuOw0KPiAg
IAlpZiAoIWxwZm4pDQo+IEBAIC0zOTUsMTAgKzM5NCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zy
YW1fbWdyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwNCj4gICAJCWdvdG8g
ZXJyb3Jfc3ViOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9G
TEFHX0NPTlRJR1VPVVMpIHsNCj4gKwlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdfQ09O
VElHVU9VUykNCj4gICAJCXBhZ2VzX3Blcl9ub2RlID0gfjB1bDsNCj4gLQkJbnVtX25vZGVzID0g
MTsNCj4gLQl9IGVsc2Ugew0KPiArCWVsc2Ugew0KPiAgICNpZmRlZiBDT05GSUdfVFJBTlNQQVJF
TlRfSFVHRVBBR0UNCj4gICAJCXBhZ2VzX3Blcl9ub2RlID0gSFBBR0VfUE1EX05SOw0KPiAgICNl
bHNlDQo+IEBAIC00MDcsNTcgKzQwNSw5NyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9u
ZXcoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sDQo+ICAgI2VuZGlmDQo+ICAgCQlw
YWdlc19wZXJfbm9kZSA9IG1heF90KHVpbnQzMl90LCBwYWdlc19wZXJfbm9kZSwNCj4gICAJCQkJ
ICAgICAgIHRiby0+cGFnZV9hbGlnbm1lbnQpOw0KPiAtCQludW1fbm9kZXMgPSBESVZfUk9VTkRf
VVBfVUxMKFBGTl9VUChtZW1fYnl0ZXMpLCBwYWdlc19wZXJfbm9kZSk7DQo+ICAgCX0NCj4gICAN
Cj4gLQlub2RlID0ga3ZtYWxsb2Moc3RydWN0X3NpemUobm9kZSwgbW1fbm9kZXMsIG51bV9ub2Rl
cyksDQo+IC0JCQlHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7DQo+IC0JaWYgKCFub2RlKSB7DQo+
ICsJdm5vZGUgPSBremFsbG9jKHNpemVvZigqdm5vZGUpLCBHRlBfS0VSTkVMKTsNCj4gKw0KPiAr
CWlmICghdm5vZGUpIHsNCj4gICAJCXIgPSAtRU5PTUVNOw0KPiAgIAkJZ290byBlcnJvcl9zdWI7
DQo+ICAgCX0NCj4gICANCj4gKwlub2RlID0gJnZub2RlLT50bm9kZTsNCj4gKw0KPiAgIAl0dG1f
cmVzb3VyY2VfaW5pdCh0Ym8sIHBsYWNlLCAmbm9kZS0+YmFzZSk7DQo+ICAgDQo+IC0JbW9kZSA9
IERSTV9NTV9JTlNFUlRfQkVTVDsNCj4gLQlpZiAocGxhY2UtPmZsYWdzICYgVFRNX1BMX0ZMQUdf
VE9QRE9XTikNCj4gLQkJbW9kZSA9IERSTV9NTV9JTlNFUlRfSElHSDsNCj4gKwliYXJfbGltaXRf
ZW5hYmxlZCA9ICEoYW1kZ3B1X2dtY192cmFtX2Z1bGxfdmlzaWJsZSgmYWRldi0+Z21jKSk7DQo+
ICsNCj4gKwl2aXNpYmxlX3BmbiA9IGFkZXYtPmdtYy52aXNpYmxlX3ZyYW1fc2l6ZSA+PiBQQUdF
X1NISUZUOw0KPiArDQo+ICsJbW9kZSA9IERSTV9CVUREWV9CT1RUT01fVVA7DQo+ICsJaWYgKCFw
bGFjZS0+ZnBmbiAmJiBscGZuID09IG1hbi0+c2l6ZSAmJg0KPiArCQkJCQkocGxhY2UtPmZsYWdz
ICYgVFRNX1BMX0ZMQUdfVE9QRE9XTikpDQo+ICsJCS8qIEFsbG9jYXRlIGJsb2NrcyBmcm9tIENQ
VSBub24tbWFwcGFibGUgKFRPUC1ET1dOKSByZWdpb24gKi8NCj4gKwkJbW9kZSA9IERSTV9CVURE
WV9UT1BfRE9XTjsNCj4gKwllbHNlIGlmIChwbGFjZS0+ZnBmbiB8fCAobHBmbiAhPSBtYW4tPnNp
emUgJiYgbHBmbiAhPSB2aXNpYmxlX3BmbikpDQo+ICsJCS8qIEFsbG9jYXRlIGJsb2NrcyBpbiBk
ZXNpcmVkIHJhbmdlICovDQo+ICsJCW1vZGUgPSBEUk1fQlVERFlfQUxMT0NfUkFOR0U7DQo+ICAg
DQo+ICAgCXBhZ2VzX2xlZnQgPSBub2RlLT5iYXNlLm51bV9wYWdlczsNCj4gICANCj4gICAJLyog
TGltaXQgbWF4aW11bSBzaXplIHRvIDJHQiBkdWUgdG8gU0cgdGFibGUgbGltaXRhdGlvbnMgKi8N
Cj4gICAJcGFnZXMgPSBtaW4ocGFnZXNfbGVmdCwgMlVMIDw8ICgzMCAtIFBBR0VfU0hJRlQpKTsN
Cj4gICANCj4gKwlJTklUX0xJU1RfSEVBRCgmdm5vZGUtPmJsb2Nrcyk7DQo+ICsNCj4gICAJaSA9
IDA7DQo+IC0Jc3Bpbl9sb2NrKCZtZ3ItPmxvY2spOw0KPiAtCXdoaWxlIChwYWdlc19sZWZ0KSB7
DQo+IC0JCXVpbnQzMl90IGFsaWdubWVudCA9IHRiby0+cGFnZV9hbGlnbm1lbnQ7DQo+IC0NCj4g
LQkJaWYgKHBhZ2VzID49IHBhZ2VzX3Blcl9ub2RlKQ0KPiAtCQkJYWxpZ25tZW50ID0gcGFnZXNf
cGVyX25vZGU7DQo+IC0NCj4gLQkJciA9IGRybV9tbV9pbnNlcnRfbm9kZV9pbl9yYW5nZShtbSwg
Jm5vZGUtPm1tX25vZGVzW2ldLCBwYWdlcywNCj4gLQkJCQkJCWFsaWdubWVudCwgMCwgcGxhY2Ut
PmZwZm4sDQo+IC0JCQkJCQlscGZuLCBtb2RlKTsNCj4gLQkJaWYgKHVubGlrZWx5KHIpKSB7DQo+
IC0JCQlpZiAocGFnZXMgPiBwYWdlc19wZXJfbm9kZSkgew0KPiAtCQkJCWlmIChpc19wb3dlcl9v
Zl8yKHBhZ2VzKSkNCj4gLQkJCQkJcGFnZXMgPSBwYWdlcyAvIDI7DQo+IC0JCQkJZWxzZQ0KPiAt
CQkJCQlwYWdlcyA9IHJvdW5kZG93bl9wb3dfb2ZfdHdvKHBhZ2VzKTsNCj4gLQkJCQljb250aW51
ZTsNCj4gLQkJCX0NCj4gLQkJCWdvdG8gZXJyb3JfZnJlZTsNCj4gLQkJfQ0KPiArCWlmIChtb2Rl
ID09IERSTV9CVUREWV9BTExPQ19SQU5HRSkgew0KPiArCQlyID0gZHJtX2J1ZGR5X2FsbG9jX3Jh
bmdlKG1tLCAmdm5vZGUtPmJsb2NrcywNCj4gKwkJCQkodWludDY0X3QpcGxhY2UtPmZwZm4gPDwg
UEFHRV9TSElGVCwgcGFnZXMgPDwgUEFHRV9TSElGVCk7DQoNClRoYXQgaGFuZGxpbmcgd29uJ3Qg
d29yay4gSXQncyBwb3NzaWJsZSB0aGF0IHlvdSBuZWVkIGNvbnRpZ3VvdXMgbWVtb3J5IGluIGEg
c3BlY2lmaWMgcmFuZ2UuDQoNCkFydW4gLSB0aGUgZXhpc3RpbmcgZGVmYXVsdCBiYWNrZW5kIHJh
bmdlIGhhbmRsZXIgYWxsb2NhdGVzIGNvbnRpZ3VvdXMgbm9kZXMgaW4gcG93ZXIgb2YgMiBmaW5k
aW5nIHRoZSBNU0IncyBvZiANCnRoZSBhbnkgZ2l2ZW4gc2l6ZS4gV2UgZ2V0IGxpbmtlZCBub2Rl
cyAoZGVwZW5kcyBvbiB0aGUgcmVxdWVzdGVkIHNpemUpIGluIGNvbnRpbnVvdXMgcmFuZ2Ugb2Yg
YWRkcmVzcy4NCkV4YW1wbGUsIGZvciB0aGUgc2l6ZSA3NjggcGFnZXMgcmVxdWVzdCwgd2UgZ2V0
IDUxMiArIDI1NiByYW5nZSBvZiBjb250aW51b3VzIGFkZHJlc3MgaW4gMiBub2Rlcy4NCg0KSXQg
d29ya3MgYnkgcGFzc2luZyB0aGUgZnBmbiBhbmQgdGhlIHJlcXVlc3RlZCBzaXplLCB0aGUgYmFj
a2VuZCBoYW5kbGVyIGNhbGN1bGF0ZXMgdGhlIGxwZm4gYnkgYWRkaW5nIGZwZm4gKyBzaXplID0g
bHBmbi4NClRoZSBkcmF3YmFjayBoZXJlIGFyZSB3ZSBhcmUgbm90IGhhbmRsaW5nIHRoZSBzcGVj
aWZpYyBscGZuIHZhbHVlIChhcyBvZiBub3cgaXQgaXMgY2FsY3VsYXRlZCB1c2luZyB0aGUgZnBm
biArIHJlcXVlc3RlZCBzaXplKSANCmFuZCBub3QgZm9sbG93aW5nIHRoZSBwYWdlc19wZXJfbm9k
ZSBydWxlLg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyB3b24ndCB3b3JrIGZvciBhbGwg
c3BlY2lmaWMgZnBmbiAvIGxwZm4gY2FzZXMNCg0KPiArDQo+ICsJCWlmICh1bmxpa2VseShyKSkN
Cj4gKwkJCWdvdG8gZXJyb3JfZnJlZV9yZXM7DQo+ICsJfSBlbHNlIHsNCj4gKwkJd2hpbGUgKHBh
Z2VzX2xlZnQpIHsNCj4gKwkJCWlmIChwYWdlcyA+PSBwYWdlc19wZXJfbm9kZSkNCj4gKwkJCQlw
YWdlcyA9IHBhZ2VzX3Blcl9ub2RlOw0KPiArDQo+ICsJCQluX3BhZ2VzID0gcGFnZXM7DQo+ICsN
Cj4gKwkJCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VTKQ0KPiArCQkJ
CW5fcGFnZXMgPSByb3VuZHVwX3Bvd19vZl90d28obl9wYWdlcyk7DQoNClRoYXQgYXBwcm9hY2gg
d29uJ3Qgd29yayBlaXRoZXIuIEZvciBjb250aWd1b3VzIGFsbG9jYXRpb24geW91IG5lZWQgdG8g
YWxsb2NhdGUgb25lIGJpZyBjaHVuayBhbmQgdGhlbiBmcmVlIHVwIHdoYXQgeW91IGRvbid0IG5l
ZWQgYXQgdGhlIGVuZC4NCkFydW4gLSBvaywgSSB3aWxsIGZyZWUgdXAgdGhlIHVudXNlZCBwYWdl
cw0KDQo+ICsNCj4gKwkJCWRvIHsNCj4gKwkJCQl1bnNpZ25lZCBpbnQgb3JkZXI7DQo+ICsNCj4g
KwkJCQlvcmRlciA9IGZscyhuX3BhZ2VzKSAtIDE7DQo+ICsJCQkJQlVHX09OKG9yZGVyID4gbW0t
Pm1heF9vcmRlcik7DQo+ICsNCj4gKwkJCQlzcGluX2xvY2soJm1nci0+bG9jayk7DQo+ICsJCQkJ
YmxvY2sgPSBkcm1fYnVkZHlfYWxsb2MobW0sIG9yZGVyLCBiYXJfbGltaXRfZW5hYmxlZCwNCj4g
KwkJCQkJCQkJCXZpc2libGVfcGZuLCBtb2RlKTsNCg0KVGhhdCBkb2Vzbid0IHNlZW0gdG8gbWFr
ZSBtdWNoIHNlbnNlIGVpdGhlci4gVGhlIGJhY2tlbmQgYWxsb2NhdG9yIHNob3VsZCBub3QgY2Fy
ZSBhYm91dCB0aGUgQkFSIHNpemUgbm9yIHRoZSB2aXNpYmxlX3Bmbi4NCg0KQXJ1biAtIHdlIGFy
ZSBzZW5kaW5nIHRoZSBCQVIgbGltaXQgZW5hYmxlIGluZm9ybWF0aW9uIChpbiBjYXNlIG9mIEFQ
VSBvciBsYXJnZSBCQVIsIHdlIHRha2UgZGlmZmVyZW50IGFwcHJvYWNoKSBhbmQgdmlzaWJsZV9w
Zm4NCkluZm9ybWF0aW9uLiANCg0KSW4gY2FzZSBvZiBiYXJfbGltaXRfZW5hYmxlZCBpcyB0cnVl
LCBJIHRob3VnaHQgdmlzaWJsZV9wZm4gcmVxdWlyZWQgZm9yIHRoZSBiYWNrZW5kIGFsbG9jYXRv
ciB0byBjb21wYXJlIHdpdGggdGhlIGJsb2NrIHN0YXJ0IGFkZHJlc3MNCmFuZCBmaW5kIHRoZSBk
ZXNpcmVkIGJsb2NrcyBmb3IgdGhlIFRPUC1ET1dOIGFuZCBCT1RUT00tVVAgYXBwcm9hY2ggKFRP
UC1ET1dOIC0gcmV0dXJuIGJsb2NrcyBoaWdoZXIgdGhhbiB0aGUgdmlzaWJsZV9wZm4gbGltaXQs
DQpCT1RUT00tVVAgLSByZXR1cm4gYmxvY2tzIGxvd2VyIHRoYW4gdGhlIHZpc2libGVfcGZuIGxp
bWl0KS4NCg0KSW4gY2FzZSBvZiBiYXJfbGltaXRfZW5hYmxlZCBpcyBmYWxzZSwgd2UganVzdCBy
ZXR1cm4gdGhlIHRvcCBvcmRlcmVkIGJsb2NrcyBhbmQgYm90dG9tIG1vc3QgYmxvY2tzIGZvciB0
aGUgVE9QLURPV04gYW5kIEJPVFRPTS1VUA0KcmVzcGVjdGl2ZWx5IChzdWl0YWJsZSBmb3IgQVBV
IGFuZCBMYXJnZSBCQVIgY2FzZSkuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB3ZSBoYXZlIG90
aGVyIHdheSB0byBmaXggdGhpcyBwcm9ibGVtIA0KDQo+ICsJCQkJc3Bpbl91bmxvY2soJm1nci0+
bG9jayk7DQo+ICAgDQo+IC0JCXZpc191c2FnZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3NpemUo
YWRldiwgJm5vZGUtPm1tX25vZGVzW2ldKTsNCj4gLQkJYW1kZ3B1X3ZyYW1fbWdyX3ZpcnRfc3Rh
cnQoJm5vZGUtPmJhc2UsICZub2RlLT5tbV9ub2Rlc1tpXSk7DQo+IC0JCXBhZ2VzX2xlZnQgLT0g
cGFnZXM7DQo+IC0JCSsraTsNCj4gKwkJCQlpZiAoSVNfRVJSKGJsb2NrKSkgew0KPiArCQkJCQly
ID0gLUVOT1NQQzsNCj4gKwkJCQkJZ290byBlcnJvcl9mcmVlX2Jsb2NrczsNCj4gKwkJCQl9DQo+
ICAgDQo+IC0JCWlmIChwYWdlcyA+IHBhZ2VzX2xlZnQpDQo+IC0JCQlwYWdlcyA9IHBhZ2VzX2xl
ZnQ7DQo+ICsJCQkJbl9wYWdlcyAtPSBCSVQob3JkZXIpOw0KPiArDQo+ICsJCQkJbGlzdF9hZGRf
dGFpbCgmYmxvY2stPmxpbmssICZ2bm9kZS0+YmxvY2tzKTsNCj4gKw0KPiArCQkJCWlmICghbl9w
YWdlcykNCj4gKwkJCQkJYnJlYWs7DQo+ICsJCQl9IHdoaWxlICgxKTsNCj4gKw0KPiArCQkJcGFn
ZXNfbGVmdCAtPSBwYWdlczsNCj4gKwkJCSsraTsNCj4gKw0KPiArCQkJaWYgKHBhZ2VzID4gcGFn
ZXNfbGVmdCkNCj4gKwkJCQlwYWdlcyA9IHBhZ2VzX2xlZnQ7DQo+ICsJCX0NCj4gICAJfQ0KPiAr
DQo+ICsJc3Bpbl9sb2NrKCZtZ3ItPmxvY2spOw0KPiArCWxpc3Rfc29ydChOVUxMLCAmdm5vZGUt
PmJsb2Nrcywgc29ydF9ibG9ja3MpOw0KDQpXaHkgZG8geW91IHNvcnQgdGhlIGxpc3QgaGVyZT8N
Cg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQXJ1biAtIEl0IGdhdmUgYmV0dGVyIEdMbWFyazIg
c2NvcmUgd2hlbiB3ZSBzb3J0IHRoZSBibG9ja3MgaW4gYXNjZW5kaW5nIG9yZGVyLA0KSXRzIG5v
dCByZXF1aXJlZCwgSSB3aWxsIHJlbW92ZSBpdA0KDQpSZWdhcmRzLA0KQXJ1bg0KDQoNCj4gKw0K
PiArCWxpc3RfZm9yX2VhY2hfZW50cnkoYmxvY2ssICZ2bm9kZS0+YmxvY2tzLCBsaW5rKQ0KPiAr
CQl2aXNfdXNhZ2UgKz0gYW1kZ3B1X3ZyYW1fbWdyX3Zpc19zaXplKGFkZXYsIGJsb2NrKTsNCj4g
Kw0KPiArCWJsb2NrID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZ2bm9kZS0+YmxvY2tzLA0K
PiArCQkJc3RydWN0IGRybV9idWRkeV9ibG9jaywgbGluayk7DQo+ICsJbm9kZS0+YmFzZS5zdGFy
dCA9IGJsb2NrLT5zdGFydDsNCj4gICAJc3Bpbl91bmxvY2soJm1nci0+bG9jayk7DQo+ICAgDQo+
ICAgCWlmIChpID09IDEpDQo+IEBAIC00NzIsMTIgKzUxMCwxMiBAQCBzdGF0aWMgaW50IGFtZGdw
dV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sDQo+ICAgCSpy
ZXMgPSAmbm9kZS0+YmFzZTsNCj4gICAJcmV0dXJuIDA7DQo+ICAgDQo+IC1lcnJvcl9mcmVlOg0K
PiAtCXdoaWxlIChpLS0pDQo+IC0JCWRybV9tbV9yZW1vdmVfbm9kZSgmbm9kZS0+bW1fbm9kZXNb
aV0pOw0KPiArZXJyb3JfZnJlZV9ibG9ja3M6DQo+ICsJc3Bpbl9sb2NrKCZtZ3ItPmxvY2spOw0K
PiArCWRybV9idWRkeV9mcmVlX2xpc3QobW0sICZ2bm9kZS0+YmxvY2tzKTsNCj4gICAJc3Bpbl91
bmxvY2soJm1nci0+bG9jayk7DQo+IC0Ja3ZmcmVlKG5vZGUpOw0KPiAtDQo+ICtlcnJvcl9mcmVl
X3JlczoNCj4gKwlrZnJlZSh2bm9kZSk7DQo+ICAgZXJyb3Jfc3ViOg0KPiAgIAlhdG9taWM2NF9z
dWIobWVtX2J5dGVzLCAmbWdyLT51c2FnZSk7DQo+ICAgCXJldHVybiByOw0KPiBAQCAtNDk0LDI4
ICs1MzIsMjggQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fcmVz
b3VyY2VfbWFuYWdlciAqbWFuLA0KPiAgIHN0YXRpYyB2b2lkIGFtZGdwdV92cmFtX21ncl9kZWwo
c3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sDQo+ICAgCQkJCXN0cnVjdCB0dG1fcmVz
b3VyY2UgKnJlcykNCj4gICB7DQo+IC0Jc3RydWN0IHR0bV9yYW5nZV9tZ3Jfbm9kZSAqbm9kZSA9
IHRvX3R0bV9yYW5nZV9tZ3Jfbm9kZShyZXMpOw0KPiArCXN0cnVjdCBhbWRncHVfdnJhbV9tZ3Jf
bm9kZSAqdm5vZGUgPSB0b19hbWRncHVfdnJhbV9tZ3Jfbm9kZShyZXMpOw0KPiAgIAlzdHJ1Y3Qg
YW1kZ3B1X3ZyYW1fbWdyICptZ3IgPSB0b192cmFtX21ncihtYW4pOw0KPiAgIAlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IHRvX2FtZGdwdV9kZXZpY2UobWdyKTsNCj4gKwlzdHJ1Y3QgZHJt
X2J1ZGR5X21tICptbSA9ICZtZ3ItPm1tOw0KPiArCXN0cnVjdCBkcm1fYnVkZHlfYmxvY2sgKmJs
b2NrOw0KPiAgIAl1aW50NjRfdCB1c2FnZSA9IDAsIHZpc191c2FnZSA9IDA7DQo+IC0JdW5zaWdu
ZWQgaSwgcGFnZXM7DQo+ICAgDQo+ICAgCXNwaW5fbG9jaygmbWdyLT5sb2NrKTsNCj4gLQlmb3Ig
KGkgPSAwLCBwYWdlcyA9IHJlcy0+bnVtX3BhZ2VzOyBwYWdlczsNCj4gLQkgICAgIHBhZ2VzIC09
IG5vZGUtPm1tX25vZGVzW2ldLnNpemUsICsraSkgew0KPiAtCQlzdHJ1Y3QgZHJtX21tX25vZGUg
Km1tID0gJm5vZGUtPm1tX25vZGVzW2ldOw0KPiAtDQo+IC0JCWRybV9tbV9yZW1vdmVfbm9kZSht
bSk7DQo+IC0JCXVzYWdlICs9IG1tLT5zaXplIDw8IFBBR0VfU0hJRlQ7DQo+IC0JCXZpc191c2Fn
ZSArPSBhbWRncHVfdnJhbV9tZ3JfdmlzX3NpemUoYWRldiwgbW0pOw0KPiArCWxpc3RfZm9yX2Vh
Y2hfZW50cnkoYmxvY2ssICZ2bm9kZS0+YmxvY2tzLCBsaW5rKSB7DQo+ICsJCXVzYWdlICs9IGJs
b2NrLT5zaXplIDw8IFBBR0VfU0hJRlQ7DQo+ICsJCXZpc191c2FnZSArPSBhbWRncHVfdnJhbV9t
Z3JfdmlzX3NpemUoYWRldiwgYmxvY2spOw0KPiAgIAl9DQo+ICsNCj4gICAJYW1kZ3B1X3ZyYW1f
bWdyX2RvX3Jlc2VydmUobWFuKTsNCj4gKw0KPiArCWRybV9idWRkeV9mcmVlX2xpc3QobW0sICZ2
bm9kZS0+YmxvY2tzKTsNCj4gICAJc3Bpbl91bmxvY2soJm1nci0+bG9jayk7DQo+ICAgDQo+ICAg
CWF0b21pYzY0X3N1Yih1c2FnZSwgJm1nci0+dXNhZ2UpOw0KPiAgIAlhdG9taWM2NF9zdWIodmlz
X3VzYWdlLCAmbWdyLT52aXNfdXNhZ2UpOw0KPiAgIA0KPiAtCWt2ZnJlZShub2RlKTsNCj4gKwlr
ZnJlZSh2bm9kZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtNjY4LDEyICs3MDYsNiBA
QCB1aW50NjRfdCBhbWRncHVfdnJhbV9tZ3JfdmlzX3VzYWdlKHN0cnVjdCB0dG1fcmVzb3VyY2Vf
bWFuYWdlciAqbWFuKQ0KPiAgIHN0YXRpYyB2b2lkIGFtZGdwdV92cmFtX21ncl9kZWJ1ZyhzdHJ1
Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwNCj4gICAJCQkJICBzdHJ1Y3QgZHJtX3ByaW50
ZXIgKnByaW50ZXIpDQo+ICAgew0KPiAtCXN0cnVjdCBhbWRncHVfdnJhbV9tZ3IgKm1nciA9IHRv
X3ZyYW1fbWdyKG1hbik7DQo+IC0NCj4gLQlzcGluX2xvY2soJm1nci0+bG9jayk7DQo+IC0JZHJt
X21tX3ByaW50KCZtZ3ItPm1tLCBwcmludGVyKTsNCj4gLQlzcGluX3VubG9jaygmbWdyLT5sb2Nr
KTsNCj4gLQ0KPiAgIAlkcm1fcHJpbnRmKHByaW50ZXIsICJtYW4gc2l6ZTolbGx1IHBhZ2VzLCBy
YW0gdXNhZ2U6JWxsdU1CLCB2aXMgdXNhZ2U6JWxsdU1CXG4iLA0KPiAgIAkJICAgbWFuLT5zaXpl
LCBhbWRncHVfdnJhbV9tZ3JfdXNhZ2UobWFuKSA+PiAyMCwNCj4gICAJCSAgIGFtZGdwdV92cmFt
X21ncl92aXNfdXNhZ2UobWFuKSA+PiAyMCk7IEBAIC03MDEsNyArNzMzLDcgQEAgaW50IA0KPiBh
bWRncHVfdnJhbV9tZ3JfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICANCj4g
ICAJbWFuLT5mdW5jID0gJmFtZGdwdV92cmFtX21ncl9mdW5jOw0KPiAgIA0KPiAtCWRybV9tbV9p
bml0KCZtZ3ItPm1tLCAwLCBtYW4tPnNpemUpOw0KPiArCWRybV9idWRkeV9pbml0KCZtZ3ItPm1t
LCBtYW4tPnNpemUgPDwgUEFHRV9TSElGVCwgUEFHRV9TSVpFKTsNCj4gICAJc3Bpbl9sb2NrX2lu
aXQoJm1nci0+bG9jayk7DQo+ICAgCUlOSVRfTElTVF9IRUFEKCZtZ3ItPnJlc2VydmF0aW9uc19w
ZW5kaW5nKTsNCj4gICAJSU5JVF9MSVNUX0hFQUQoJm1nci0+cmVzZXJ2ZWRfcGFnZXMpOw0KPiBA
QCAtNzM3LDEwICs3NjksMTAgQEAgdm9pZCBhbWRncHVfdnJhbV9tZ3JfZmluaShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikNCj4gICAJCWtmcmVlKHJzdik7DQo+ICAgDQo+ICAgCWxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShyc3YsIHRlbXAsICZtZ3ItPnJlc2VydmVkX3BhZ2VzLCBub2RlKSB7
DQo+IC0JCWRybV9tbV9yZW1vdmVfbm9kZSgmcnN2LT5tbV9ub2RlKTsNCj4gKwkJZHJtX2J1ZGR5
X2ZyZWUoJm1nci0+bW0sICZyc3YtPm1tX25vZGUpOw0KPiAgIAkJa2ZyZWUocnN2KTsNCj4gICAJ
fQ0KPiAtCWRybV9tbV90YWtlZG93bigmbWdyLT5tbSk7DQo+ICsJZHJtX2J1ZGR5X2ZpbmkoJm1n
ci0+bW0pOw0KPiAgIAlzcGluX3VubG9jaygmbWdyLT5sb2NrKTsNCj4gICANCj4gICAJdHRtX3Jl
c291cmNlX21hbmFnZXJfY2xlYW51cChtYW4pOw0K
