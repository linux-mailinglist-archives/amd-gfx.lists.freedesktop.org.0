Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB54CB564
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Mar 2022 04:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4B10F01D;
	Thu,  3 Mar 2022 03:22:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A36B10F01D
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Mar 2022 03:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpwmAoCW/oMZCCAL/v+fTN/2aEPvTN5D7IKmbHvMYyq5F24FOTnNnjwjrHiUjvRJ4Pa/J+MmQEVevtQaS+9zHxA7MDsiWqrV8yXKDA0Loed2RUgVNEb5kn+M0DfejnoRGDC7Hu+tnwiKP/7Ay0eq8s2pMP3z7ztrwXscu7ZpmEnSUmJFCyrl/3GdzhnPjUvuItehUDxxTUr7jGuevxePXtw33qIhPJdzqBoc6CiMRFSWN9JvhK1p29xFVIUYHqu5cs/XgaU4ghoY0E7YMV4dLYrd/aZdOFgJ58Cc4M4Q5Squm9OhhtVGaBmKwPeRugPk4fDIYjZpib2Qd6ITYwkn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIChwPChRG5TMzJi1rnfGxcOpWhUIPzwtBrpYnv26dA=;
 b=bwrvdNLVgR+IKfb0m7bxigMMphFSZgQRcMM4ahuYiNN4uVI1chgoDiO2EBmOIQJGGs0/nSqDeu3nYrqwgR2EgA1Oc9SxqDkI2SqbzMHLCD16WTbmvLMBRsNEAX4GkLOE0DL0qe1SgFVdBFsCHIIBYNojNFmqeZQgLYQFlD+ZXn/ifsnugO2hnY6lAzu5XPI8JfrlMBghEHaSNTvBPxg5XDcJ6zMuTKVlIbJeHB1gqZnPMJS+dvXdtCf5oBWMedKCOfSiMC4jJ67IfB53+NNGR7XHeSk22mQFsGFMeMMDRc1ogVWWNFfQyfOnGAThw6yIRcPFnt0AkauTtHmqJILsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIChwPChRG5TMzJi1rnfGxcOpWhUIPzwtBrpYnv26dA=;
 b=3+XzSTGvxbGCyD50PjmkaI2BWzalMLCbEmyoRjOILCUo8f8kBfo5WaFZiV0TaY0ER2Opm0p6G1qQlWIn66Y2gcT6483fGJUXUv4DwtV8k2KLeddcAvwSB6ABTgsWgb12g6GNjKDGJci1/a0Cmn60kQ7yEONSEp42Nel8Lb0fY6k=
Received: from BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 by BYAPR12MB4760.namprd12.prod.outlook.com (2603:10b6:a03:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 03:21:54 +0000
Received: from BL1PR12MB5334.namprd12.prod.outlook.com
 ([fe80::245e:645a:38d6:ead8]) by BL1PR12MB5334.namprd12.prod.outlook.com
 ([fe80::245e:645a:38d6:ead8%6]) with mapi id 15.20.5017.028; Thu, 3 Mar 2022
 03:21:54 +0000
From: "Yang, Stanley" <Stanley.Yang@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Joo, Maria" <Maria.Joo@amd.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggUmV2aWV3IDEvMV0gZHJtL2FtZGdwdTogc3VwcG9y?=
 =?utf-8?Q?t_send_bad_channel_info_to_smu?=
Thread-Topic: [PATCH Review 1/1] drm/amdgpu: support send bad channel info to
 smu
Thread-Index: AQHYLXCFGvSvR6tyeUSPpnwDNowQ+6yrt+iAgAFC/OA=
Date: Thu, 3 Mar 2022 03:21:54 +0000
Message-ID: <BL1PR12MB5334AF47CCF60BC5DB5353789A049@BL1PR12MB5334.namprd12.prod.outlook.com>
References: <20220301133022.17602-1-Stanley.Yang@amd.com>
 <DM5PR12MB177034C3444BB1CDB304ED0FB0039@DM5PR12MB1770.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB177034C3444BB1CDB304ED0FB0039@DM5PR12MB1770.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-02T07:35:46Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=0a847742-6747-4e61-ac8c-042c8e5fa9bf;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98aca637-2aee-4191-928e-08d9fcc4f740
x-ms-traffictypediagnostic: BYAPR12MB4760:EE_
x-microsoft-antispam-prvs: <BYAPR12MB47609523F4F58DD56BC951EE9A049@BYAPR12MB4760.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dy2h+p3EPKoBW/lXj8yszL+JSTMYTVSwYGekArejaPoztoIiTyEshDYOdJH/YIc0ZQAFPLXxZA/NHB0pmQ4yhDcCthPUkPE0k35GkiZad8jmKWwEiXj6A6szLrVJSBct1Uu8IiL/oQ5/NNaS7I9FAKlGqEh53Ftjal+VpEXN5ns1Y73Wvopzmoh8Vzo2uROZFzXjCgDAe+WpcRBGSFVN7br9/1TNJli5mlQOhc6vVA0l70wrJ1c8FlbNrm4bR4EVqtX4niVt/lX7jsITulIOReV5VKIT/k7WixnuKBMMBa03nhH9TEZzOdlFLlANKvTWmwOCmpHMwdPjLtRiD8f+bzq4DvqCqBQ9lDS2OLkI9t3caEfvQVEUnWevJ/PWeP1ZNvxNAzppUPB1XepnYDj2Mky7iC6VnlVT82mZ/yBPmfTRA2HY51eqFD9fvNlJqPc5H+w1nwZvicOz1x5QSQVsHPQU1GobqKTxHJ7xBPMVvUq+030VBmME+wS2epi0fezAklFRrtP3u1fPT6fJB+Pb61SV3dpFr4IWerRXnLoTmoO+L2L9J3eiVdFvBFG8aONulEwnQZzV5SVH5uTW8C1pbBz0ImNqSrO5ElVuVT9worcCcuOlKVpP0NLd+Yhc6VCYFG0ELzrUqdZG3W1lIwOLa3xvy8aXvSLBXoSPPNA+DA4bHMa7ZsHbBzRsPkb9veTvrldQ0M4+PaLyBiBqYSeSSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5334.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(33656002)(26005)(9686003)(86362001)(53546011)(5660300002)(122000001)(186003)(83380400001)(38070700005)(30864003)(110136005)(2906002)(316002)(6636002)(71200400001)(55016003)(508600001)(224303003)(6506007)(52536014)(64756008)(66446008)(66476007)(66556008)(66946007)(8936002)(7696005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUQrNWJ4MVJBYkkwTXBLbjlRR1p4cm4ycU1qd1ZOOTFYOHlpVWF6RTQwZytN?=
 =?utf-8?B?SU1XS3JMRWxsc0dZeHdQSEJWZkZ1Qmhydk5RTHRJQUVQaHozN2NWQUpPNmJE?=
 =?utf-8?B?cURrUUVsL25VTVB6MnBBa2FpVkVVRXpvNjA2MkRMR1draS85dGVXRXVYQXZj?=
 =?utf-8?B?VHEwUDYyOVdzWWI2bGUzNmcvSlFDQzVoMStsNWdZbDRBSkN0L085R01RRXNv?=
 =?utf-8?B?cjJrUk5ZNS92ZGpvUUNER3FBZ04wT1B6WUlvRHVwMHMwamdQTzFaOXFudTJS?=
 =?utf-8?B?VkdRSzJKSW1QOUhzS0huTkNES1F3bm5Dc1RUczYxTTNnNkk0S0M0ejh0bnBo?=
 =?utf-8?B?V055VmN4aU5lQUZ0cWFERzRVNmJwaU5rV2U4blFxaXVXVnE5L2s0cG5NT3Nx?=
 =?utf-8?B?NkMrNGVETHlTYmVnSkpRQ3ZGNzdaKzMzU05WclE3TzNJZnVXMnVhWmJsVGtv?=
 =?utf-8?B?R2RLeEpIUGJSaGZ2VmxWNnc0ejJ1ZnlESGpIempIeFltZ2NuUW1jNU92VC9W?=
 =?utf-8?B?ZXRnMmw1NkFIa0VuWlllUGZtS0JnVnp1aEdvdVcvWlZoMVdJRCtwN014V2E4?=
 =?utf-8?B?cVZ6WDY3aWx0OXVYQVcrTzJ3RHNKcm01NTBsK1BRTUhkWEpDWTBwSGFhMGlt?=
 =?utf-8?B?SURvL0VxclhERzcwMlFacWJuM2RDYlBKZVIydDlya2JaVUVnVFo4Z3Z4dTN5?=
 =?utf-8?B?MmVRajR4ZEhmdkNwak1vOXo4a3EyN05oYzNQWVdnLzZsRjFTVDYyMjZRK1lR?=
 =?utf-8?B?U2l5eS9PR0xXSnpiT05EU1h4UFhjZzdFWFNtL1lsSWxBWUtVNWl4L3k3NWpj?=
 =?utf-8?B?QWZScVVNelNPdzE4RFBjSWRwNFRHUnJUUzk0T3ovYXhpaFA2cTN1a0NMRm5Y?=
 =?utf-8?B?R2JibW5pcG9BY3FMaHAxdFgvZS9CQXltMVQ5bzVRdUNvOVRjcC9UMXJ6eWN0?=
 =?utf-8?B?NVJKNkMwTXZ4Z2dyL2ZraXJlWWxxNTFFM0NYUlUwMHU0OUFGS0I0blZOWmJv?=
 =?utf-8?B?a1pnMFZRb25yaWZ3T1B2SEZsaHF5NHpCbVFkZlNaaVdCZ05CNlNxUWN6eWlD?=
 =?utf-8?B?OHZ2SXUzSmJ4VXRwcVlQOWRvNUl0SUw4ZlBZWkUzOTFYWUpHVWxMbFZWYXhY?=
 =?utf-8?B?VXdFSVhmZUdTbUVMQ21ySWRkSDlZK2dBUmdEakw3ckVWekdIU25SWEFpMVo2?=
 =?utf-8?B?VFUyVmZ2TGtVeUJLMXhycWQ0aUZmczZwY3l6Zjc2Z1NRNnVjMWxuUDNZdW5W?=
 =?utf-8?B?M2t3MkdjL3doL2RXTy9YakRmWUQwUWVkVElVZGk5dndDYisxNW1QN3djRFJl?=
 =?utf-8?B?aG9OVHY0S21aMVp5OXkvVHFhVFNvUFFRZGFReGpsOUIxRTBkcURad2FZNTlC?=
 =?utf-8?B?R2g0WFkwSUJYWlpmU1pBM0tLc1kwWFl3RTJSRGVQQUVFNWVXc0JRMVlDdnEx?=
 =?utf-8?B?VlB2NXhrd2JtTkIveko3VFJGUmMrZzVjMktXV05pYjFUL2llQVR5cWc5WmVu?=
 =?utf-8?B?ZGRjQ3BTVEhGS2h0WGhDekdCbHg0VE5qRDZkbzBpSUhRQnA1WmxyazlpVkhI?=
 =?utf-8?B?a0ZjTjdGMithaE8yRFV4RFVMay92R3l3YWlDSkJjdVdYWkExOVJyQkQyL1RJ?=
 =?utf-8?B?R3lWUkwvRlZ4eFhSUmo0Qm5yR1pKWDBhQklUYlYvL20wbVkwWG1VbUtBcVRQ?=
 =?utf-8?B?em9LSUdPNzRIOTY3MlNPdWtxdmtyb0x6NE9ENkVWU1I4TC9KTjZnUjhwdlVF?=
 =?utf-8?B?dm9iaytCYU5nM05vWHJEMFdUVVBrdTQ4Y1c0dFNTTmFBTnBPT04wZ3huWDVI?=
 =?utf-8?B?VzdnblRYVUgrZHkzQUxXVWJzeXRjcWxZbHUwbG9nTEhPUXdvWi9NNXZsaFpk?=
 =?utf-8?B?QUhWRno5Z2ZMM0N0bVZsTTdGSW9SZ0pMdjlIWWIzdndwcnFYVzhFcWhUTXBV?=
 =?utf-8?B?Uy9WU1hRdVhJa3RKMXhjMTdYdTFvWnJTeGxTK1JXd1pwY01aMW1QUmFzWjNl?=
 =?utf-8?B?cCs2MmFkY2dCU1grcDVUY1lJbDFiVjA0Qjk3U1RRWnVOM3RhSjJINzFSQUp5?=
 =?utf-8?B?ZUZvazNLN251d2t4THhqeWJmS1Q5ekFXMlNOZjZ4N09PVWNVbks3TlllV2xX?=
 =?utf-8?B?d3haL3lqMzVDOUVtWGdYdDM5QU9KU1JMUUErLzFJOWpoSlFkZU1URWh5V1JB?=
 =?utf-8?Q?Qmh/dr41/AMj4lsOlggmiVo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aca637-2aee-4191-928e-08d9fcc4f740
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 03:21:54.0536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ulcMhKvS9dYIdkHrZSNJEiHsiQB/krfCI7RjFC7m2guE+jTE9mE440uqRC8NFboT2wNJe/YjlCaCpd6MF2ybQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4760
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

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IFpob3UxLCBUYW8gPFRh
by5aaG91MUBhbWQuY29tPg0KPiDlj5HpgIHml7bpl7Q6IFdlZG5lc2RheSwgTWFyY2ggMiwgMjAy
MiAzOjQ1IFBNDQo+IOaUtuS7tuS6ujogWWFuZywgU3RhbmxleSA8U3RhbmxleS5ZYW5nQGFtZC5j
b20+OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdraW5nIDxI
YXdraW5nLlpoYW5nQGFtZC5jb20+Ow0KPiBKb28sIE1hcmlhIDxNYXJpYS5Kb29AYW1kLmNvbT4N
Cj4g5oqE6YCBOiBZYW5nLCBTdGFubGV5IDxTdGFubGV5LllhbmdAYW1kLmNvbT4NCj4g5Li76aKY
OiBSRTogW1BBVENIIFJldmlldyAxLzFdIGRybS9hbWRncHU6IHN1cHBvcnQgc2VuZCBiYWQgY2hh
bm5lbCBpbmZvDQo+IHRvIHNtdQ0KPiANCj4gW0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCj4gDQo+
IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFN0YW5sZXku
WWFuZyA8U3RhbmxleS5ZYW5nQGFtZC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgTWFyY2ggMSwg
MjAyMiA5OjMwIFBNDQo+ID4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFu
ZywgSGF3a2luZw0KPiA+IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8u
WmhvdTFAYW1kLmNvbT47IEpvbywNCj4gTWFyaWENCj4gPiA8TWFyaWEuSm9vQGFtZC5jb20+DQo+
ID4gQ2M6IFlhbmcsIFN0YW5sZXkgPFN0YW5sZXkuWWFuZ0BhbWQuY29tPg0KPiA+IFN1YmplY3Q6
IFtQQVRDSCBSZXZpZXcgMS8xXSBkcm0vYW1kZ3B1OiBzdXBwb3J0IHNlbmQgYmFkIGNoYW5uZWwg
aW5mbw0KPiA+IHRvIHNtdQ0KPiA+DQo+ID4gTWVzc2FnZSBTTVUgYmFkIGNoYW5uZWwgaW5mb3Jt
YXRpb24gYml0bWFwIHRvIHVwZGF0ZSBPT0IgdGFibGUNCj4gPg0KPiA+IENoYW5nZS1JZDogSTQ5
YTc5YWY2NGQ1MjYzYzI4ZGIwNTllY2I4Yjg0MDVhNDcxNDMxYjQNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTdGFubGV5LllhbmcgPFN0YW5sZXkuWWFuZ0BhbWQuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgICAgICAgfCAgNyArKysNCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oICAgICAgIHwgIDMgKysNCj4g
PiAgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jICAgIHwgMjUgKysr
KysrKysrKy0NCj4gPiAgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5o
ICAgIHwgIDQgKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5j
ICAgICAgIHwgIDUgKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X2RwbS5j
ICAgICAgICAgICB8IDEyICsrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9h
bWRncHVfZHBtLmggICAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvYW1kZ3B1X3NtdS5jICAgICB8IDEwICsrKysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vc3dzbXUvaW5jL2FtZGdwdV9zbXUuaCB8ICA3ICsrKw0KPiA+ICAuLi4vcG0vc3dzbXUvaW5j
L3BtZndfaWYvYWxkZWJhcmFuX3Bwc21jLmggICAgfCAgMyArLQ0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3N3c211L2luYy9zbXVfdHlwZXMuaCAgfCAgMyArLQ0KPiA+ICAuLi4vZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMy9hbGRlYmFyYW5fcHB0LmMgICAgfCA0Mw0KPiArKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEyIGZpbGVzIGNoYW5nZWQsIDExOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPiANCj4gW1Rhb10gSXQncyBiZXR0ZXIgdG8gc3BsaXQgdGhlIHBhdGNoIGludG8g
dHdvIHBhcnRzLCBvbmUgZm9yIGFtZGdwdSBhbmQgb25lIGZvcg0KPiBwbS4NCltZYW5nLCBTdGFu
bGV5XSA6IHllYWgsIGl0IG1ha2VzIHNlbnNlLCB3aWxsIHVwZGF0ZS4NCj4gDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gPiBpbmRleCBkMzg3
NTYxOGViZjUuLmY5MTA0Zjk5ZWI5YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmMNCj4gPiBAQCAtMjA2OCw2ICsyMDY4LDcgQEAgaW50IGFtZGdwdV9y
YXNfcmVjb3ZlcnlfaW5pdChzdHJ1Y3QNCj4gPiBhbWRncHVfZGV2aWNlDQo+ID4gKmFkZXYpDQo+
ID4gIAltdXRleF9pbml0KCZjb24tPnJlY292ZXJ5X2xvY2spOw0KPiA+ICAJSU5JVF9XT1JLKCZj
b24tPnJlY292ZXJ5X3dvcmssIGFtZGdwdV9yYXNfZG9fcmVjb3ZlcnkpOw0KPiA+ICAJYXRvbWlj
X3NldCgmY29uLT5pbl9yZWNvdmVyeSwgMCk7DQo+ID4gKwljb24tPmVlcHJvbV9jb250cm9sLmJh
ZF9jaGFubmVsX2JpdG1hcCA9IDA7DQo+ID4NCj4gPiAgCW1heF9lZXByb21fcmVjb3Jkc19jb3Vu
dCA9DQo+ID4gYW1kZ3B1X3Jhc19lZXByb21fbWF4X3JlY29yZF9jb3VudCgpOw0KPiA+ICAJYW1k
Z3B1X3Jhc192YWxpZGF0ZV90aHJlc2hvbGQoYWRldiwNCj4gbWF4X2VlcHJvbV9yZWNvcmRzX2Nv
dW50KTsgQEANCj4gPiAtMjA5Miw2ICsyMDkzLDExIEBAIGludCBhbWRncHVfcmFzX3JlY292ZXJ5
X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gPiAqYWRldikNCj4gPiAgCQkJZ290byBmcmVl
Ow0KPiA+DQo+ID4gIAkJYW1kZ3B1X2RwbV9zZW5kX2hibV9iYWRfcGFnZXNfbnVtKGFkZXYsIGNv
bi0NCj4gPiA+ZWVwcm9tX2NvbnRyb2wucmFzX251bV9yZWNzKTsNCj4gPiArDQo+ID4gKwkJaWYg
KGNvbi0+dXBkYXRlX2NoYW5uZWxfZmxhZyA9PSB0cnVlKSB7DQo+IFtUYW9dIEl0IGNhbiBiZSBz
aW1wbGlmaWVkIHRvICJpZiAoY29uLT51cGRhdGVfY2hhbm5lbF9mbGFnKSINCltZYW5nLCBTdGFu
bGV5XSA6IFllYWgsIGJvdGggdGhlICJpZiAoY29uLT51cGRhdGVfY2hhbm5lbF9mbGFnKSIgYW5k
ICJpZiAoY29uLT51cGRhdGVfY2hhbm5lbF9mbGFnID09IHR1cmUpIiBhcmUgZmVhc2libGUuDQo+
IA0KPiA+ICsJCQlhbWRncHVfZHBtX3NlbmRfaGJtX2JhZF9jaGFubmVsX2ZsYWcoYWRldiwNCj4g
Y29uLQ0KPiA+ID5lZXByb21fY29udHJvbC5iYWRfY2hhbm5lbF9iaXRtYXApOw0KPiANCj4gW1Rh
b10gZG8gd2UgbmVlZCB0byBjaGVjayBzdGF0dXMgb2YgdGhlIGZ1bmN0aW9uIGFuZCBzdG9wIHJl
Y292ZXJ5X2luaXQgaWYgaXQNCj4gZmFpbHM/DQpbWWFuZywgU3RhbmxleV0gOiBObywgaXQgZG9u
J3QgYWZmZWN0IHJhcyByZWNvdmVyeSBwcm9jZXNzIGV2ZW4gbWVzc2FnZSBzbXUgZmFpbGVkLg0K
PiANCj4gPiArCQkJY29uLT51cGRhdGVfY2hhbm5lbF9mbGFnID0gZmFsc2U7DQo+ID4gKwkJfQ0K
PiA+ICAJfQ0KPiA+DQo+ID4gICNpZmRlZiBDT05GSUdfWDg2X01DRV9BTUQNCj4gPiBAQCAtMjI4
NSw2ICsyMjkxLDcgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCj4gPiAgCQlnb3RvIHJlbGVhc2VfY29uOw0KPiA+ICAJfQ0KPiA+DQo+ID4gKwljb24t
PnVwZGF0ZV9jaGFubmVsX2ZsYWcgPSBmYWxzZTsNCj4gPiAgCWNvbi0+ZmVhdHVyZXMgPSAwOw0K
PiA+ICAJSU5JVF9MSVNUX0hFQUQoJmNvbi0+aGVhZCk7DQo+ID4gIAkvKiBNaWdodCBuZWVkIGdl
dCB0aGlzIGZsYWcgZnJvbSB2Ymlvcy4gKi8gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmFzLmgNCj4gPiBpbmRleCA3Y2RkYWFkOTBkNmQuLjkzMTRmZGU4MWU2OCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgNCj4gPiBA
QCAtMzc0LDYgKzM3NCw5IEBAIHN0cnVjdCBhbWRncHVfcmFzIHsNCj4gPg0KPiA+ICAJLyogcmVj
b3JkIHVtYyBlcnJvciBpbmZvIHF1ZXJpZWQgZnJvbSBzbXUgKi8NCj4gPiAgCXN0cnVjdCB1bWNf
ZWNjX2luZm8gdW1jX2VjYzsNCj4gPiArDQo+ID4gKwkvKiBJbmRpY2F0ZXMgc211IHdoZXRoZXIg
bmVlZCB1cGRhdGUgYmFkIGNoYW5uZWwgaW5mbyAqLw0KPiA+ICsJYm9vbCB1cGRhdGVfY2hhbm5l
bF9mbGFnOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCByYXNfZnNfZGF0YSB7DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMNCj4g
PiBpbmRleCAyYjg0NGE1YWFmZGIuLmFkNWQ4NjY3NzU2ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19lZXByb20uYw0KPiA+IEBAIC0yNjUs
NiArMjY1LDcgQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0X3RhYmxlKHN0cnVjdA0KPiA+
IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpICB7DQo+ID4gIAlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IHRvX2FtZGdwdV9kZXZpY2UoY29udHJvbCk7DQo+ID4gIAlzdHJ1
Y3QgYW1kZ3B1X3Jhc19lZXByb21fdGFibGVfaGVhZGVyICpoZHIgPSAmY29udHJvbC0+dGJsX2hk
cjsNCj4gPiArCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0
KGFkZXYpOw0KPiA+ICAJdTggY3N1bTsNCj4gPiAgCWludCByZXM7DQo+ID4NCj4gPiBAQCAtMjg1
LDYgKzI4NiwxMCBAQCBpbnQgYW1kZ3B1X3Jhc19lZXByb21fcmVzZXRfdGFibGUoc3RydWN0DQo+
ID4gYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCkNCj4gPg0KPiA+ICAJYW1kZ3B1
X2RwbV9zZW5kX2hibV9iYWRfcGFnZXNfbnVtKGFkZXYsIGNvbnRyb2wtDQo+ID4gPnJhc19udW1f
cmVjcyk7DQo+ID4NCj4gPiArCWNvbnRyb2wtPmJhZF9jaGFubmVsX2JpdG1hcCA9IDA7DQo+ID4g
KwlhbWRncHVfZHBtX3NlbmRfaGJtX2JhZF9jaGFubmVsX2ZsYWcoYWRldiwgY29udHJvbC0NCj4g
PiA+YmFkX2NoYW5uZWxfYml0bWFwKTsNCj4gPiArCWNvbi0+dXBkYXRlX2NoYW5uZWxfZmxhZyA9
IGZhbHNlOw0KPiA+ICsNCj4gPiAgCWFtZGdwdV9yYXNfZGVidWdmc19zZXRfcmV0X3NpemUoY29u
dHJvbCk7DQo+ID4NCj4gPiAgCW11dGV4X3VubG9jaygmY29udHJvbC0+cmFzX3RibF9tdXRleCk7
DQo+ID4gQEAgLTQxOCw2ICs0MjMsNyBAQCBhbWRncHVfcmFzX2VlcHJvbV9hcHBlbmRfdGFibGUo
c3RydWN0DQo+ID4gYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gPiAgCQkJ
ICAgICAgIHN0cnVjdCBlZXByb21fdGFibGVfcmVjb3JkICpyZWNvcmQsDQo+ID4gIAkJCSAgICAg
ICBjb25zdCB1MzIgbnVtKQ0KPiA+ICB7DQo+ID4gKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0N
Cj4gPiArYW1kZ3B1X3Jhc19nZXRfY29udGV4dCh0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpKTsN
Cj4gPiAgCXUzMiBhLCBiLCBpOw0KPiA+ICAJdTggKmJ1ZiwgKnBwOw0KPiA+ICAJaW50IHJlczsN
Cj4gPiBAQCAtNDI5LDkgKzQzNSwxNiBAQCBhbWRncHVfcmFzX2VlcHJvbV9hcHBlbmRfdGFibGUo
c3RydWN0DQo+ID4gYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gPiAgCS8q
IEVuY29kZSBhbGwgb2YgdGhlbSBpbiBvbmUgZ28uDQo+ID4gIAkgKi8NCj4gPiAgCXBwID0gYnVm
Ow0KPiA+IC0JZm9yIChpID0gMDsgaSA8IG51bTsgaSsrLCBwcCArPSBSQVNfVEFCTEVfUkVDT1JE
X1NJWkUpDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyssIHBwICs9IFJBU19UQUJMRV9S
RUNPUkRfU0laRSkgew0KPiA+ICAJCV9fZW5jb2RlX3RhYmxlX3JlY29yZF90b19idWYoY29udHJv
bCwgJnJlY29yZFtpXSwgcHApOw0KPiA+DQo+ID4gKwkJLyogdXBkYXRlIGJhZCBjaGFubmVsIGJp
dG1hcCAqLw0KPiA+ICsJCWlmICghKGNvbnRyb2wtPmJhZF9jaGFubmVsX2JpdG1hcCAmICgxIDw8
DQo+ID4gcmVjb3JkW2ldLm1lbV9jaGFubmVsKSkpIHsNCj4gPiArCQkJY29udHJvbC0+YmFkX2No
YW5uZWxfYml0bWFwIHw9IDEgPDwNCj4gPiByZWNvcmRbaV0ubWVtX2NoYW5uZWw7DQo+ID4gKwkJ
CWNvbi0+dXBkYXRlX2NoYW5uZWxfZmxhZyA9IHRydWU7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiAgCS8qIGEsIGZpcnN0IHJlY29yZCBpbmRleCB0byB3cml0ZSBpbnRvLg0KPiA+ICAJ
ICogYiwgbGFzdCByZWNvcmQgaW5kZXggdG8gd3JpdGUgaW50by4NCj4gPiAgCSAqIGEgPSBmaXJz
dCBpbmRleCB0byByZWFkIChmcmkpICsgbnVtYmVyIG9mIHJlY29yZHMgaW4gdGhlIHRhYmxlLA0K
PiA+IEBAIC0NCj4gPiA2ODQsNiArNjk3LDcgQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX3JlYWQo
c3RydWN0DQo+ID4gYW1kZ3B1X3Jhc19lZXByb21fY29udHJvbCAqY29udHJvbCwNCj4gPiAgCQkJ
ICAgY29uc3QgdTMyIG51bSkNCj4gPiAgew0KPiA+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYgPSB0b19hbWRncHVfZGV2aWNlKGNvbnRyb2wpOw0KPiA+ICsJc3RydWN0IGFtZGdwdV9yYXMg
KmNvbiA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoYWRldik7DQo+ID4gIAlpbnQgaSwgcmVzOw0K
PiA+ICAJdTggKmJ1ZiwgKnBwOw0KPiA+ICAJdTMyIGcwLCBnMTsNCj4gPiBAQCAtNzUxLDggKzc2
NSwxNSBAQCBpbnQgYW1kZ3B1X3Jhc19lZXByb21fcmVhZChzdHJ1Y3QNCj4gPiBhbWRncHVfcmFz
X2VlcHJvbV9jb250cm9sICpjb250cm9sLA0KPiA+ICAJLyogUmVhZCB1cCBldmVyeXRoaW5nPyBU
aGVuIHRyYW5zZm9ybS4NCj4gPiAgCSAqLw0KPiA+ICAJcHAgPSBidWY7DQo+ID4gLQlmb3IgKGkg
PSAwOyBpIDwgbnVtOyBpKyssIHBwICs9IFJBU19UQUJMRV9SRUNPUkRfU0laRSkNCj4gPiArCWZv
ciAoaSA9IDA7IGkgPCBudW07IGkrKywgcHAgKz0gUkFTX1RBQkxFX1JFQ09SRF9TSVpFKSB7DQo+
ID4gIAkJX19kZWNvZGVfdGFibGVfcmVjb3JkX2Zyb21fYnVmKGNvbnRyb2wsICZyZWNvcmRbaV0s
IHBwKTsNCj4gPiArDQo+ID4gKwkJLyogdXBkYXRlIGJhZCBjaGFubmVsIGJpdG1hcCAqLw0KPiA+
ICsJCWlmICghKGNvbnRyb2wtPmJhZF9jaGFubmVsX2JpdG1hcCAmICgxIDw8DQo+ID4gcmVjb3Jk
W2ldLm1lbV9jaGFubmVsKSkpIHsNCj4gPiArCQkJY29udHJvbC0+YmFkX2NoYW5uZWxfYml0bWFw
IHw9IDEgPDwNCj4gPiByZWNvcmRbaV0ubWVtX2NoYW5uZWw7DQo+ID4gKwkJCWNvbi0+dXBkYXRl
X2NoYW5uZWxfZmxhZyA9IHRydWU7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICBPdXQ6DQo+ID4g
IAlrZnJlZShidWYpOw0KPiA+ICAJbXV0ZXhfdW5sb2NrKCZjb250cm9sLT5yYXNfdGJsX211dGV4
KTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
c19lZXByb20uaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhc19l
ZXByb20uaA0KPiA+IGluZGV4IDZiYjAwNTc4YmZiYi4uNTRkOWJmZTA4ODFkIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmgNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5oDQo+
ID4gQEAgLTgwLDYgKzgwLDEwIEBAIHN0cnVjdCBhbWRncHVfcmFzX2VlcHJvbV9jb250cm9sIHsN
Cj4gPiAgCS8qIFByb3RlY3QgdGFibGUgYWNjZXNzIHZpYSB0aGlzIG11dGV4Lg0KPiA+ICAJICov
DQo+ID4gIAlzdHJ1Y3QgbXV0ZXggcmFzX3RibF9tdXRleDsNCj4gPiArDQo+ID4gKwkvKiBSZWNv
cmQgY2hhbm5lbCBpbmZvIHdoaWNoIG9jY3VycmVkIGJhZCBwYWdlcw0KPiA+ICsJICovDQo+ID4g
Kwl1MzIgYmFkX2NoYW5uZWxfYml0bWFwOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIC8qDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuYw0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+ID4gaW5kZXggODVkYTZj
YmFmM2I3Li5hYWQzYzhiNGM4MTAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3VtYy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3VtYy5jDQo+ID4gQEAgLTk3LDYgKzk3LDExIEBAIHN0YXRpYyBpbnQgYW1kZ3B1
X3VtY19kb19wYWdlX3JldGlyZW1lbnQoc3RydWN0DQo+ID4gYW1kZ3B1X2RldmljZSAqYWRldiwN
Cj4gPiAgCQkJYW1kZ3B1X3Jhc19zYXZlX2JhZF9wYWdlcyhhZGV2KTsNCj4gPg0KPiA+ICAJCQlh
bWRncHVfZHBtX3NlbmRfaGJtX2JhZF9wYWdlc19udW0oYWRldiwNCj4gY29uLQ0KPiA+ID5lZXBy
b21fY29udHJvbC5yYXNfbnVtX3JlY3MpOw0KPiA+ICsNCj4gPiArCQkJaWYgKGNvbi0+dXBkYXRl
X2NoYW5uZWxfZmxhZyA9PSB0cnVlKSB7DQo+ID4gKw0KPiA+IAlhbWRncHVfZHBtX3NlbmRfaGJt
X2JhZF9jaGFubmVsX2ZsYWcoYWRldiwgY29uLQ0KPiA+ID5lZXByb21fY29udHJvbC5iYWRfY2hh
bm5lbF9iaXRtYXApOw0KPiA+ICsJCQkJY29uLT51cGRhdGVfY2hhbm5lbF9mbGFnID0gZmFsc2U7
DQo+ID4gKwkJCX0NCj4gPiAgCQl9DQo+ID4NCj4gPiAgCQlpZiAocmVzZXQpDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X2RwbS5jDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYw0KPiA+IGluZGV4IDFkNjNmMWU4ODg0Yy4uOWE4
OTJkNmQxZDdhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1
X2RwbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMNCj4g
PiBAQCAtNTA3LDYgKzUwNywxOCBAQCBpbnQNCj4gYW1kZ3B1X2RwbV9zZW5kX2hibV9iYWRfcGFn
ZXNfbnVtKHN0cnVjdA0KPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHNpemUpDQo+
ID4gIAlyZXR1cm4gcmV0Ow0KPiA+ICB9DQo+ID4NCj4gPiAraW50IGFtZGdwdV9kcG1fc2VuZF9o
Ym1fYmFkX2NoYW5uZWxfZmxhZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwNCj4gPiAr
dWludDMyX3Qgc2l6ZSkgew0KPiA+ICsJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSBhZGV2LT5w
b3dlcnBsYXkucHBfaGFuZGxlOw0KPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsJbXV0
ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOw0KPiA+ICsJcmV0ID0gc211X3NlbmRfaGJtX2JhZF9j
aGFubmVsX2ZsYWcoc211LCBzaXplKTsNCj4gPiArCW11dGV4X3VubG9jaygmYWRldi0+cG0ubXV0
ZXgpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gIGludCBh
bWRncHVfZHBtX2dldF9kcG1fZnJlcV9yYW5nZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
Cj4gPiAgCQkJCSAgZW51bSBwcF9jbG9ja190eXBlIHR5cGUsDQo+ID4gIAkJCQkgIHVpbnQzMl90
ICptaW4sDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdw
dV9kcG0uaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQo+
ID4gaW5kZXggZGRmYTU1YjU5ZDAyLi4zZTc4YjMwNTcyNzcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1X2RwbS5oDQo+ID4gQEAgLTQxMiw2ICs0MTIsNyBAQCB2
b2lkIGFtZGdwdV9kcG1fZW5hYmxlX2pwZWcoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UNCj4gPiAq
YWRldiwgYm9vbCBlbmFibGUpOyAgaW50IGFtZGdwdV9wbV9sb2FkX3NtdV9maXJtd2FyZShzdHJ1
Y3QNCj4gPiBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCAqc211X3ZlcnNpb24pOyAgaW50
DQo+ID4gYW1kZ3B1X2RwbV9oYW5kbGVfcGFzc3Rocm91Z2hfc2JyKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KPiBib29sDQo+ID4gZW5hYmxlKTsgIGludCBhbWRncHVfZHBtX3NlbmRfaGJt
X2JhZF9wYWdlc19udW0oc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UNCj4gPiAqYWRldiwgdWludDMy
X3Qgc2l6ZSk7DQo+ID4gK2ludCBhbWRncHVfZHBtX3NlbmRfaGJtX2JhZF9jaGFubmVsX2ZsYWco
c3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gKmFkZXYsDQo+ID4gK3VpbnQzMl90IHNpemUpOw0KPiA+
ICBpbnQgYW1kZ3B1X2RwbV9nZXRfZHBtX2ZyZXFfcmFuZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsDQo+ID4gIAkJCQkgICAgICAgZW51bSBwcF9jbG9ja190eXBlIHR5cGUsDQo+ID4gIAkJ
CQkgICAgICAgdWludDMyX3QgKm1pbiwNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9zd3NtdS9hbWRncHVfc211LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
c3dzbXUvYW1kZ3B1X3NtdS5jDQo+ID4gaW5kZXggN2U3OWE2N2JiOGVmLi5mMTU0NDc1NWQ4YjQg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9hbWRncHVfc211
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2FtZGdwdV9zbXUuYw0K
PiA+IEBAIC0zMDUyLDMgKzMwNTIsMTMgQEAgaW50IHNtdV9zZW5kX2hibV9iYWRfcGFnZXNfbnVt
KHN0cnVjdA0KPiA+IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90IHNpemUpDQo+ID4NCj4gPiAg
CXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiArDQo+ID4gK2ludCBzbXVfc2VuZF9oYm1fYmFkX2No
YW5uZWxfZmxhZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwNCj4gdWludDMyX3QNCj4gPiArc2l6
ZSkgew0KPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsJaWYgKHNtdS0+cHB0X2Z1bmNz
ICYmIHNtdS0+cHB0X2Z1bmNzLQ0KPiA+c2VuZF9oYm1fYmFkX2NoYW5uZWxfZmxhZykNCj4gPiAr
CQlyZXQgPSBzbXUtPnBwdF9mdW5jcy0+c2VuZF9oYm1fYmFkX2NoYW5uZWxfZmxhZyhzbXUsDQo+
IHNpemUpOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9pbmMvYW1kZ3B1X3NtdS5oDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2luYy9hbWRncHVfc211LmgNCj4gPiBpbmRleCBm
YmVmM2FiOGQ0ODcuLmVmNTdiNjA4OWM2OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3N3c211L2luYy9hbWRncHVfc211LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL3N3c211L2luYy9hbWRncHVfc211LmgNCj4gPiBAQCAtMTI5Miw2ICsxMjkyLDEy
IEBAIHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHsNCj4gPiAgCSAqIEBzZXRfY29uZmlnX3RhYmxlOiBB
cHBseSB0aGUgaW5wdXQgRHJpdmVyU211Q29uZmlnIHRhYmxlIHNldHRpbmdzLg0KPiA+ICAJICov
DQo+ID4gIAlpbnQgKCpzZXRfY29uZmlnX3RhYmxlKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
c3RydWN0DQo+ID4gY29uZmlnX3RhYmxlX3NldHRpbmcgKnRhYmxlKTsNCj4gPiArDQo+ID4gKwkv
KioNCj4gPiArCSAqIEBzbmVkX2hibV9iYWRfY2hhbm5lbF9mbGFnOiAgbWVzc2FnZSBTTVUgdG8g
dXBkYXRlIGJhZA0KPiA+IGNoYW5uZWwgaW5mbw0KPiA+ICsJICoNCj4gPiAJCW9mIFNNVUJVUyB0
YWJsZS4NCj4gPiArCSAqLw0KPiA+ICsJaW50ICgqc2VuZF9oYm1fYmFkX2NoYW5uZWxfZmxhZyko
c3RydWN0IHNtdV9jb250ZXh0ICpzbXUsDQo+IHVpbnQzMl90DQo+ID4gK3NpemUpOw0KPiA+ICB9
Ow0KPiA+DQo+ID4gIHR5cGVkZWYgZW51bSB7DQo+ID4gQEAgLTE0MjgsNSArMTQzNCw2IEBAIGlu
dCBzbXVfZ2V0X2VjY19pbmZvKHN0cnVjdCBzbXVfY29udGV4dCAqc211LA0KPiA+IHZvaWQgKnVt
Y19lY2MpOyAgaW50IHNtdV9zdGJfY29sbGVjdF9pbmZvKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LA0KPiA+IHZvaWQgKmJ1ZmYsIHVpbnQzMl90IHNpemUpOyAgdm9pZCBhbWRncHVfc211X3N0Yl9k
ZWJ1Z19mc19pbml0KHN0cnVjdA0KPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYpOyAgaW50IHNtdV9z
ZW5kX2hibV9iYWRfcGFnZXNfbnVtKHN0cnVjdA0KPiA+IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQz
Ml90IHNpemUpOw0KPiA+ICtpbnQgc211X3NlbmRfaGJtX2JhZF9jaGFubmVsX2ZsYWcoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsDQo+IHVpbnQzMl90DQo+ID4gK3NpemUpOw0KPiA+ICAjZW5kaWYN
Cj4gPiAgI2VuZGlmDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9zd3NtdS9pbmMvcG1md19pZi9hbGRlYmFyYW5fcHBzbWMuaA0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wbS9zd3NtdS9pbmMvcG1md19pZi9hbGRlYmFyYW5fcHBzbWMuaA0KPiA+IGluZGV4
IGFiNjZhNGI5ZTQzOC4uMGY0OThiYWY2ODM4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG0vc3dzbXUvaW5jL3BtZndfaWYvYWxkZWJhcmFuX3Bwc21jLmgNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L2luYy9wbWZ3X2lmL2FsZGViYXJhbl9wcHNt
Yy5oDQo+ID4gQEAgLTEwMyw3ICsxMDMsOCBAQA0KPiA+ICAjZGVmaW5lIFBQU01DX01TR19HZnhE
cml2ZXJSZXNldFJlY292ZXJ5CTB4NDINCj4gPiAgI2RlZmluZSBQUFNNQ19NU0dfQm9hcmRQb3dl
ckNhbGlicmF0aW9uIAkweDQzDQo+ID4gICNkZWZpbmUgUFBTTUNfTVNHX0hlYXZ5U0JSICAgICAg
ICAgICAgICAgICAgICAgIDB4NDUNCj4gPiAtI2RlZmluZSBQUFNNQ19NZXNzYWdlX0NvdW50CQkJ
MHg0Ng0KPiA+ICsjZGVmaW5lIFBQU01DX01TR19TZXRCYWRIQk1QYWdlc1JldGlyZWRGbGFnc1Bl
ckNoYW5uZWwJMHg0Ng0KPiA+ICsjZGVmaW5lIFBQU01DX01lc3NhZ2VfQ291bnQJCQkweDQ3DQo+
ID4NCj4gPg0KPiA+ICAvL1BQU01DIFJlc2V0IFR5cGVzDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvaW5jL3NtdV90eXBlcy5oDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3N3c211L2luYy9zbXVfdHlwZXMuaA0KPiA+IGluZGV4IGQ3ODdjM2I5ZmM1
Mi4uOWY2ZjMwNmVlY2EwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
c3dzbXUvaW5jL3NtdV90eXBlcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9z
d3NtdS9pbmMvc211X3R5cGVzLmgNCj4gPiBAQCAtMjMyLDcgKzIzMiw4IEBADQo+ID4gIAlfX1NN
VV9EVU1NWV9NQVAoRm9yY2VHZnhWaWQpLCAgICAgICAgICAgICBcDQo+ID4gIAlfX1NNVV9EVU1N
WV9NQVAoU3BhcmUwKSwgICAgICAgICAgICAgICAgICBcDQo+ID4gIAlfX1NNVV9EVU1NWV9NQVAo
VW5mb3JjZUdmeFZpZCksICAgICAgICAgICBcDQo+ID4gLQlfX1NNVV9EVU1NWV9NQVAoSGVhdnlT
QlIpLA0KPiA+ICsJX19TTVVfRFVNTVlfTUFQKEhlYXZ5U0JSKSwJCQlcDQo+ID4gKwlfX1NNVV9E
VU1NWV9NQVAoU2V0QmFkSEJNUGFnZXNSZXRpcmVkRmxhZ3NQZXJDaGFubmVsKSwNCj4gPg0KPiA+
ICAjdW5kZWYgX19TTVVfRFVNTVlfTUFQDQo+ID4gICNkZWZpbmUgX19TTVVfRFVNTVlfTUFQKHR5
cGUpCVNNVV9NU0dfIyN0eXBlDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG0vc3dzbXUvc211MTMvYWxkZWJhcmFuX3BwdC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdTEzL2FsZGViYXJhbl9wcHQuYw0KPiA+IGluZGV4IDg5MGFjYzRlMmNiOC4u
ZTVlMjQ5OTY4MjQ0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTMvYWxkZWJhcmFuX3BwdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9zd3NtdS9zbXUxMy9hbGRlYmFyYW5fcHB0LmMNCj4gPiBAQCAtODIsNiArODIsMTIgQEANCj4g
PiAgICovDQo+ID4gICNkZWZpbmUgU1VQUE9SVF9FQ0NUQUJMRV9TTVVfVkVSU0lPTiAweDAwNDQy
YTAwDQo+ID4NCj4gPiArLyoNCj4gPiArICogU01VIHN1cHBvcnQgQkFEIENIRU5ORUwgaW5mbyBN
U0cgc2luY2UgdmVyc2lvbiA2OC41MS4wMCwNCj4gPiArICogdXNlIHRoaXMgdG8gY2hlY2sgRUND
VEFMRSBmZWF0dXJlIHdoZXRoZXIgc3VwcG9ydCAgKi8gI2RlZmluZQ0KPiA+ICtTVVBQT1JUX0JB
RF9DSEFOTkVMX0lORk9fTVNHX1ZFUlNJT04gMHgwMDQ0MzMwMA0KPiA+ICsNCj4gPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbXVfdGVtcGVyYXR1cmVfcmFuZ2Ugc211MTNfdGhlcm1hbF9wb2xpY3lb
XSA9ICB7DQo+ID4gIAl7LTI3MzE1MCwgIDk5MDAwLCA5OTAwMCwgLTI3MzE1MCwgOTkwMDAsIDk5
MDAwLCAtMjczMTUwLCA5OTAwMCwNCj4gPiA5OTAwMH0sIEBAIC0xNDAsNiArMTQ2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBjbW4yYXNpY19tc2dfbWFwcGluZw0KPiA+IGFsZGViYXJhbl9tZXNz
YWdlX21hcFtTTVVfTVNHX01BWF9DT1VOVA0KPiA+ICAJTVNHX01BUChHZnhEcml2ZXJSZXNldFJl
Y292ZXJ5LA0KPiA+IFBQU01DX01TR19HZnhEcml2ZXJSZXNldFJlY292ZXJ5LAkJMCksDQo+ID4g
IAlNU0dfTUFQKEJvYXJkUG93ZXJDYWxpYnJhdGlvbiwNCj4gPiBQUFNNQ19NU0dfQm9hcmRQb3dl
ckNhbGlicmF0aW9uLAkJMCksDQo+ID4gIAlNU0dfTUFQKEhlYXZ5U0JSLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQUFNNQ19NU0dfSGVhdnlTQlIsDQo+ID4gMCksDQo+ID4gKwlNU0dfTUFQ
KFNldEJhZEhCTVBhZ2VzUmV0aXJlZEZsYWdzUGVyQ2hhbm5lbCwNCj4gPiAJUFBTTUNfTVNHX1Nl
dEJhZEhCTVBhZ2VzUmV0aXJlZEZsYWdzUGVyQ2hhbm5lbCwJMCksDQo+ID4gIH07DQo+ID4NCj4g
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbW4yYXNpY19tYXBwaW5nDQo+IGFsZGViYXJhbl9jbGtf
bWFwW1NNVV9DTEtfQ09VTlRdDQo+ID4gPSB7IEBAIC0xOTk3LDYgKzIwMDQsNDEgQEAgc3RhdGlj
IGludA0KPiA+IGFsZGViYXJhbl9zbXVfc2VuZF9oYm1fYmFkX3BhZ2VfbnVtKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LA0KPiA+ICAJcmV0dXJuIHJldDsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRp
YyBpbnQgYWxkZWJhcmFuX2NoZWNrX2JhZF9jaGFubmVsX2luZm9fc3VwcG9ydChzdHJ1Y3QNCj4g
PiArc211X2NvbnRleHQNCj4gPiArKnNtdSkgew0KPiA+ICsJdWludDMyX3QgaWZfdmVyc2lvbiA9
IDB4ZmYsIHNtdV92ZXJzaW9uID0gMHhmZjsNCj4gPiArCWludCByZXQgPSAwOw0KPiA+ICsNCj4g
PiArCXJldCA9IHNtdV9jbW5fZ2V0X3NtY192ZXJzaW9uKHNtdSwgJmlmX3ZlcnNpb24sICZzbXVf
dmVyc2lvbik7DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJLyogcmV0dXJuIG5vdCBzdXBwb3J0
IGlmIGZhaWxlZCBnZXQgc211X3ZlcnNpb24gKi8NCj4gPiArCQlyZXQgPSAtRU9QTk9UU1VQUDsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoc211X3ZlcnNpb24gPCBTVVBQT1JUX0JBRF9DSEFO
TkVMX0lORk9fTVNHX1ZFUlNJT04pDQo+ID4gKwkJcmV0ID0gLUVPUE5PVFNVUFA7DQo+ID4gKw0K
PiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBhbGRlYmFy
YW5fc2VuZF9oYm1fYmFkX2NoYW5uZWxfZmxhZyhzdHJ1Y3Qgc211X2NvbnRleHQNCj4gKnNtdSwN
Cj4gPiArCQl1aW50MzJfdCBzaXplKQ0KPiA+ICt7DQo+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiAr
DQo+ID4gKwlyZXQgPSBhbGRlYmFyYW5fY2hlY2tfYmFkX2NoYW5uZWxfaW5mb19zdXBwb3J0KHNt
dSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJLyog
bWVzc2FnZSBTTVUgdG8gdXBkYXRlIHRoZSBiYWQgY2hhbm5lbCBpbmZvIG9uIFNNVUJVUyAqLw0K
PiA+ICsJcmV0ID0gc211X2Ntbl9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsDQo+ID4gU01V
X01TR19TZXRCYWRIQk1QYWdlc1JldGlyZWRGbGFnc1BlckNoYW5uZWwsIHNpemUsIE5VTEwpOw0K
PiA+ICsJaWYgKHJldCkNCj4gPiArCQlkZXZfZXJyKHNtdS0+YWRldi0+ZGV2LCAiWyVzXSBmYWls
ZWQgdG8gbWVzc2FnZSBTTVUgdG8NCj4gPiB1cGRhdGUgSEJNIGJhZCBjaGFubmVsIGluZm9cbiIs
DQo+ID4gKwkJCQlfX2Z1bmNfXyk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIGFsZGViYXJhbl9w
cHRfZnVuY3MgPSB7DQo+ID4gIAkvKiBpbml0IGRwbSAqLw0KPiA+ICAJLmdldF9hbGxvd2VkX2Zl
YXR1cmVfbWFzayA9DQo+IGFsZGViYXJhbl9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2ssDQo+ID4g
QEAgLTIwNjIsNiArMjEwNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcw0K
PiA+IGFsZGViYXJhbl9wcHRfZnVuY3MgPSB7DQo+ID4gIAkuaTJjX2ZpbmkgPSBhbGRlYmFyYW5f
aTJjX2NvbnRyb2xfZmluaSwNCj4gPiAgCS5zZW5kX2hibV9iYWRfcGFnZXNfbnVtID0NCj4gPiBh
bGRlYmFyYW5fc211X3NlbmRfaGJtX2JhZF9wYWdlX251bSwNCj4gPiAgCS5nZXRfZWNjX2luZm8g
PSBhbGRlYmFyYW5fZ2V0X2VjY19pbmZvLA0KPiA+ICsJLnNlbmRfaGJtX2JhZF9jaGFubmVsX2Zs
YWcgPQ0KPiA+IGFsZGViYXJhbl9zZW5kX2hibV9iYWRfY2hhbm5lbF9mbGFnLA0KPiA+ICB9Ow0K
PiA+DQo+ID4gIHZvaWQgYWxkZWJhcmFuX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250ZXh0
ICpzbXUpDQo+ID4gLS0NCj4gPiAyLjE3LjENCg==
