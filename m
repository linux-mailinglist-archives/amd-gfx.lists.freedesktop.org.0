Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722A2810784
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Dec 2023 02:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948F910E0DE;
	Wed, 13 Dec 2023 01:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2351010E0DE
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Dec 2023 01:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbpKIb7+2k4qbfmASu8w1eMrVyFwQ07yl1sQbGQqwjXP1NmEGlFkXK0AT+8eoAsUPG8STBbt37PgeTZ2SrEefBbU3VFWD599U+cHReH78rBXuZMYvaiadGve2MIMFNxXIhv0qxbo440VC8Y+mDG/SZ3bcC/Xu7DaQFHEWXz4FxMrMJ1lUn+RZ+9NOrDPp4zM8Y0ctOvwi1JLBMqvMcgMykDqY7gkXwUcDEzMz9S2WjqLN1bwee2AKJEjkEj9GDWK2nY59tgzprgWtvTYwBvCLwY1UE1XTNs+vKU0s9y91JVwExm2aWW8S3mnh76JgbBZs482N8dw14wBw1bmPdDMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBt3KCfz1GpdyoP5rjtqmNMrm6f4WMC/sWsp+BGMFwk=;
 b=cKFaOrmVQX6NDjKIAb3+VU2mP8hUezG/2qxueTN3HzopciuNCOCqU3K4Z/adKT/rTpMVIP7wH5Bm2hZB4mYdOI/ojA9m4lONZECaiS848T46h+745kN0cy+qHSC1Gqw/CW61uN7/ytDm1KMhU/C9IZk5zwLHX3DKc8KHDl55J2+qIFrySe7TmdDuF5RLroS5OpCpi9675/EuU/E6GzPbektAXUDnwVm9Xk6oU/Zy5rILaAK40DtJNEebyFx9RBQgGvJu6Q6mKyaTkvVbWJbYCqqh0XG+e8zK9VUXPmTciMhORmTnIE89WYlCMleycNGcUQ2cQoVKvQPS4Wz3c/RxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBt3KCfz1GpdyoP5rjtqmNMrm6f4WMC/sWsp+BGMFwk=;
 b=uEgRLsyesQRTLzeiZB3s8Q16rP0mq6qd9/9eW+CIwBxMEZ+cF2r/jzhEnsQn9vVETQSXSWpNpUyHImi21foJQjvk3ICmy2ypotALRFrpYm43qeI57FuWi5TdFf6gsQqWureGOWRC/v5WunEMH1eKn94zy/LrHEtcNnJr6vBCpvU=
Received: from CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6)
 by DM4PR12MB6399.namprd12.prod.outlook.com (2603:10b6:8:b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 01:19:10 +0000
Received: from CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::26b:275e:95a8:c54a]) by CY8PR12MB7435.namprd12.prod.outlook.com
 ([fe80::26b:275e:95a8:c54a%3]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 01:19:10 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Huang, JinHuiEric"
 <JinHuiEric.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix mes set shader debugger process management
Thread-Topic: [PATCH] drm/amdkfd: fix mes set shader debugger process
 management
Thread-Index: AQHaLHdMy6hjSboUMEi0ErCHNB+UVrCl7iUAgAA1WACAAAHBYIAACq+AgAAAWTCAABA2gIAAAsGwgAAUqYCAAAuy8A==
Date: Wed, 13 Dec 2023 01:19:09 +0000
Message-ID: <CY8PR12MB7435882A1367094CB9150448858DA@CY8PR12MB7435.namprd12.prod.outlook.com>
References: <20231211211612.3109-1-Jonathan.Kim@amd.com>
 <c4fc2b14-07b1-4b27-b460-166dcb343d74@amd.com>
 <CH0PR12MB5372AA024278ED7F7F078EEFF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435E109E255C480398C0FE4858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB5372602539AA4398F2ED5822F48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB74359C2CC97BEEC4DF059B3C858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB53724D1E4C95E787790DF22BF48EA@CH0PR12MB5372.namprd12.prod.outlook.com>
 <CY8PR12MB7435E7214AF1FF85B32D20B1858EA@CY8PR12MB7435.namprd12.prod.outlook.com>
 <CH0PR12MB5372DEE37C77FD4CA22B8B2FF48DA@CH0PR12MB5372.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB5372DEE37C77FD4CA22B8B2FF48DA@CH0PR12MB5372.namprd12.prod.outlook.com>
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
x-ms-traffictypediagnostic: CY8PR12MB7435:EE_|DM4PR12MB6399:EE_
x-ms-office365-filtering-correlation-id: 30b6f6ea-1756-4726-0210-08dbfb798244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /cTug5rqmAkc60PVFt28XAws2POqNkAFjkXMNJslbAqwNqL1NPgD8t9g6jgxOrLJpZHgZ0fUhjPoehbNHAXeJoylmMT/eregqQdISgYncpJRjQBgGG/ls+AXOkiBte9geY5jY3NLTP3Bo1sS4px9lTyor04t/rXeNxUP7UiAFxdgGwumQNtLnj/nGJpPkGHSiZJfYYswm05rE2knPq4wtA6YAeJzzXsosCpU1wLKnthrShw5+9E7V+qPnLcMMXaiy0KsMPhEwvQThOz26JbIVeWLuzH2C5vSnWThSe4E2j1wCkTe8ercokXA8wjKh7DUa1LwwiqdOkDrcJ0sxcWqMrfnLVYuJho/TlD1XwPsIIo1vXF+oHtwuV/3t2LWDvqS8YbF5w/o3KIUw5EOJwsEZscsQBCk0Hj7a5Pu/pMDmH8MVUNYePJQvhoi80Yfmar7/905VGiG+jJOHE5Zd2QVFYlWKXUoGBVl7Kb+ALDG8suRdZt6CO81LAtaRhHg96LdrV8SSny9MPTYQpoOrCBn2esnPxc6WQE6IeDtV0ARHug4l0RGm04fJAnCD70zGyejP6P/yJKIMf1Y03JJi7R9te9gE5MIG43taGgTtrIbV9+nUn1fDhI48qRGQ4KrLd8A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(110136005)(76116006)(54906003)(66946007)(66556008)(64756008)(66476007)(66446008)(316002)(478600001)(55016003)(8676002)(8936002)(71200400001)(6506007)(53546011)(7696005)(83380400001)(41300700001)(2906002)(4001150100001)(86362001)(52536014)(9686003)(33656002)(5660300002)(30864003)(4326008)(38100700002)(122000001)(38070700009)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3dCRm1abGliMko0YVJmdFNaRFVkdHdqeDlWNzNqRU5MU1dmemJIWExDMG03?=
 =?utf-8?B?T3RUclJNcXJXalJFM0RSd2d6WmtsOUJUWGpQNnNrOHlsVktheEI2NkFiTDU0?=
 =?utf-8?B?QlRGTS96cjRZVEM0OUlXVFlhYitIdnJ3TDdiSDZMVDZlbnNDRGlIYWxyc1RX?=
 =?utf-8?B?YUx6N0s4UDJXQW1QeXNDd08xMGMyUnJGTWlldXZtb00xKzU0Q3Frd2ppNzRo?=
 =?utf-8?B?ODdxNjltUWdTRngxL3dsQmcxMDR1VUJ0WWoyMFI3SU5sNGdWT01vOENkVmxD?=
 =?utf-8?B?VVlUbkM1R2hJZ1pYekxnNVBseS9NWG9JQUM1TlpWMmFzTk1HUUV3Yk1EQjBp?=
 =?utf-8?B?dVp5c1pGUnQrVldCNTA3a1hvSjl4dkRnUnB1UVIvaFV5MlgzQlJjanBTTnRT?=
 =?utf-8?B?S0ZrRHNzZXJuWDRqRFRJODNGMnB6ZEdSOHZHbW1jdlgvV1EvUnlJZWZ1WTBq?=
 =?utf-8?B?ZUtOMFpoUzlUREorZGkwc25IMm5HY3pOS2d6dWlObVI3R1o0WGxvbklWbTZQ?=
 =?utf-8?B?WGl6NldzU1M0bTRKWDhXZWM5Ymd5MkNZbEdGRktya2JNc2IvRVN1VkVLVWJz?=
 =?utf-8?B?RkE0eTVVclpYS1dlcWh1c290OE5WdlhQd0ZCU08vYmNYU3lkblBuMTJ4TmNo?=
 =?utf-8?B?YXJIT3E1REs0dEY0UkFwTERraDY1azdRbHRBazd4cXFBM0FVTy9QVWZleURE?=
 =?utf-8?B?bXNKdEVsSURIbFh0RGJaMTcyUlNIWFFWSVVOZXFoZmFWTkUvQmtDR0JndlBE?=
 =?utf-8?B?c2JYeG1SVjVLMjlxZjRYTnEyNE9EODRLYStOODd0U0lGTCtja1VTdDJXdVV2?=
 =?utf-8?B?c25zMGw2b0thQkJ1NTRuSyszUGUveFg3RlFsa2JMd3lQUkJwaThEZ29ZTkxv?=
 =?utf-8?B?QitERUpUdnlJTHFuR1EzZDNuci9PODVzVEpNK1JyMUNtYkNDeWlKNWRHbTRK?=
 =?utf-8?B?VWhyc3Qva0FQWDVNN3dpN2l5TFpFUXpxN29hc0F6b0NkL0pEbEZXNEdNa3hL?=
 =?utf-8?B?d1FlY0YzQUovelE4WWdMa0dmWFhTcExFQ0lqK09oTDBFcVc1YXM2UXAvZm5V?=
 =?utf-8?B?M25YRXJweUtXaDgrVFpkTkdmUlB4THpUNEI2K0NaMmI0aFdoc1hOWmpsWHEv?=
 =?utf-8?B?SzFSUFFOaFZGY1k4N1h0K1YrRmdjaXFsNmlLS3FvZ3V4TzIvb1BpaFhxdndi?=
 =?utf-8?B?KzhwWWtDb3ZpYTdmcTVpUk1RYm9SWkZFd2NXTDc3WDdseis2RjFzNXF3V3B2?=
 =?utf-8?B?TFRGdUNYYzZKSWRRQ1BydEI0RFdhRThvRVB6TlZVV3lTbjNJUDdJSXB0eVpD?=
 =?utf-8?B?VStxUzNkaHRVeGZ2TU0yTjA0UU1qRW44RkJ0M0RQVHQ3aFYxZ3ArRnc3dkR5?=
 =?utf-8?B?WXp4SzBBeUpsWWZmeWlrSEwvbG1NUVhNckRUd1ZwWEllYnhWcjhMY1cvVzlC?=
 =?utf-8?B?czJIRFFYZ2UrR1Y4T2xXMVBySUpBbHRRcjBMRlFoRzlUbHhONWJDZE5pNFg2?=
 =?utf-8?B?a29za3E4VjQ2eDN3ZG1JMFdPUlBqeEhUM2dqcWVNVWdQQUExQmNtWTVvN21h?=
 =?utf-8?B?WGxJVW9qWGQzMUdXSXpGWkVpbUF5Qkx5L0YreEViNFg4RVlXUUo4R0VBejBJ?=
 =?utf-8?B?MnZ1YTRxLzhONlluMGZQbHpYN0J6Q3F0cnpLWGVlYUxCVlZuR3dBTVhaRWlI?=
 =?utf-8?B?ZUExT3F2a2hXU2RiMytuTWtaS0hDZjNpMVBvbGFvaWVpZTZWS2NJSEtWcGQ1?=
 =?utf-8?B?SFhDMExwZ1pxc0lOQVBOamJUMG9ZUldwb3h3c1lZNFgvbis4Z1dSaUY1R1Iw?=
 =?utf-8?B?Tld3N1AydGFFdTVCSlQwTjMzV1JjTmpFOVQ2S3p0TmZMU3lBTWRzdXA0Sm1M?=
 =?utf-8?B?cDZGRnF0b0VNbHo0VTFnU0w3TlN2aFFTcHlpZWE4Vk16OFpsdlR1bHBuQ3VB?=
 =?utf-8?B?NXdDZGM1TXJ6dFcvNkU1elBRbm5OT0RxNzFic21sS1ZEMDB2Q2ZHcytVMGxH?=
 =?utf-8?B?SitPa21yMUxZQkdaTnlZQ2hTV0JjdjhNWjZ3NXcvTDBxdEZzY0ZmN0p0VTFY?=
 =?utf-8?B?djY4cy94eTlUWFlRU2Y5Y3FhdVhEYmo1TllNaFpoTTg2Tm9rci9Wb1hhS1Zu?=
 =?utf-8?Q?CQaI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b6f6ea-1756-4726-0210-08dbfb798244
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 01:19:09.7669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAHwJnMjrXPdiPfbBaSnl9kNfHrjuM/KiDey0Dh20bmBucMpyXG2jdo4y2ff2zGN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6399
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
LCAyMDIzIDc6MDggUE0NCj4gVG86IEtpbSwgSm9uYXRoYW4gPEpvbmF0aGFuLktpbUBhbWQuY29t
PjsgSHVhbmcsIEppbkh1aUVyaWMNCj4gPEppbkh1aUVyaWMuSHVhbmdAYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXb25nLCBBbGljZSA8U2hpd2VpLldvbmdA
YW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeA0KPiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IEth
c2l2aXN3YW5hdGhhbiwgSGFyaXNoDQo+IDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+
DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IGZpeCBtZXMgc2V0IHNoYWRlciBk
ZWJ1Z2dlciBwcm9jZXNzDQo+IG1hbmFnZW1lbnQNCj4NCj4gW1B1YmxpY10NCj4NCj4gSSBzZWUs
ICBzbyB0aGUgIHByb2JsZW0gaXMgYWZ0ZXIgcHJvY2VzcyBjb250ZXh0ICwgc2V0X3NoYWRlciBi
ZWVuICBjYWxsZWQgd2l0aA0KPiBkaXNhYmxlIHBhcmFtZXRlciwgIGRvIHlvdSBrbm93IHRoZSAg
cmVhc29uIHdoeSAgTUVTIHJlLWFkZGVkIHRoZQ0KPiBwcm9jZXNzIGNvbnRleHQgaW50byB0aGUg
IGxpc3QgPw0KDQpCZWNhdXNlIE1FUyBoYXMgbm8gaWRlYSB3aGF0IGRpc2FibGUgbWVhbnMuDQoN
CkFsbCBpdCBrbm93cyBpcyB0aGF0IHdpdGhvdXQgdGhlIGZsdXNoIGZsYWcsIHNldF9zaGFkZXIg
c2hvdWxkIHVwZGF0ZSB0aGUgbmVjZXNzYXJ5IHBlci1WTUlEIChwcm9jZXNzKSByZWdpc3RlcnMg
YXMgcmVxdWVzdGVkIGJ5IHRoZSBkcml2ZXIsIHdoaWNoIHJlcXVpcmVzIHBlcnNpc3RlbnQgcGVy
LXByb2Nlc3MgSFcgc2V0dGluZ3Mgc28gdGhhdCBwb3RlbnRpYWwgZnV0dXJlIHdhdmVzIGNhbiBp
bmhlcml0IHRob3NlIHNldHRpbmdzIGkuZS4gQUREX1FVRVVFLnNraXBfcHJvY2Vzc19jdHhfY2xl
YXIgaXMgc2V0ICh3aHkgQUREX1FVRVVFIGF1dG8gY2xlYXJzIHRoZSBwcm9jZXNzIGNvbnRleHQg
b3RoZXJ3aXNlIGlzIGFub3RoZXIgbG9uZyBzdG9yeSwgYmFzaWNhbGx5IGFuIHVuc29sdmFibGUg
TUVTIGNhY2hlIGJ1ZyBwcm9ibGVtKS4NCg0KQ29tbW9uIHVzZSBjYXNlIGV4YW1wbGU6DQphZGRf
cXVldWUgLT4gc2V0X3NoYWRlciBjYWxsIGVpdGhlciB0cmFuc2llbnRseSBzdGFsbHMgdGhlIFNQ
SSBwZXItVk1JRCBvciB0cmFuc2llbnRseSBkZXF1ZXVlcyB0aGUgSFdTIHBlci1WTUlEIGRlcGVu
ZGluZyBvbiB0aGUgcmVxdWVzdCBzZXR0aW5ncyAtPiBmdWxmaWxzIHRoZSBwZXItVk1JRCByZWdp
c3RlciB3cml0ZSB1cGRhdGVzIC0+IHJlc3VtZXMgcHJvY2VzcyBxdWV1ZXMgc28gdGhhdCBwb3Rl
bnRpYWwgd2F2ZXMgb24gdGhvc2UgcXVldWVzIGluaGVyaXQgbmV3IGRlYnVnIHNldHRpbmdzLg0K
DQpZb3UgY2FuJ3QgZG8gdGhpcyBraW5kIG9mIG9wZXJhdGlvbiBhdCB0aGUgcXVldWUgbGV2ZWwg
YWxvbmUuDQoNClRoZSBwcm9ibGVtIHRoYXQgdGhpcyBwYXRjaCBzb2x2ZXMgKGFsb25nIHdpdGgg
dGhlIE1FUyBGVyB1cGdyYWRlKSBpcyBhbiB1bmZvcnR1bmF0ZSBxdWlyayBvZiBoYXZpbmcgdG8g
b3BlcmF0ZSBiZXR3ZWVuIHByb2Nlc3MgKGRlYnVnIHJlcXVlc3RzKSBhbmQgcXVldWUgc3BhY2Ug
KG5vbi1kZWJ1ZyByZXF1ZXN0cykuDQpPbGQgSFdTIHVzZWQgdG8gb3BlcmF0ZSBhdCB0aGUgcGVy
LXByb2Nlc3MgbGV2ZWwgdmlhIE1BUF9QUk9DRVNTIHNvIGl0IHdhcyBhIGxvdCBlYXNpZXIgdG8g
YmFsYW5jZSBkZWJ1ZyB2ZXJzdXMgbm9uLWRlYnVnIHJlcXVlc3RzIGJhY2sgdGhlbiAoYnV0IGl0
IHdhcyBhbHNvIGxvdCBsZXNzIGVmZmljaWVudCBwZXJmb3JtYW5jZSB3aXNlKS4NCg0KSm9uDQoN
Cj4NCj4gU2hhb3l1bi5saXUNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDEyLCAyMDIzIDY6MDcgUE0NCj4gVG86IExpdSwgU2hhb3l1biA8U2hhb3l1bi5M
aXVAYW1kLmNvbT47IEh1YW5nLCBKaW5IdWlFcmljDQo+IDxKaW5IdWlFcmljLkh1YW5nQGFtZC5j
b20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogV29uZywgQWxpY2UgPFNo
aXdlaS5Xb25nQGFtZC5jb20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFt
ZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaA0KPiA8SGFyaXNoLkthc2l2aXN3YW5hdGhh
bkBhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1ka2ZkOiBmaXggbWVzIHNl
dCBzaGFkZXIgZGVidWdnZXIgcHJvY2Vzcw0KPiBtYW5hZ2VtZW50DQo+DQo+IFtQdWJsaWNdDQo+
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBMaXUsIFNoYW95dW4g
PFNoYW95dW4uTGl1QGFtZC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTIsIDIw
MjMgNTo0NCBQTQ0KPiA+IFRvOiBLaW0sIEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47
IEh1YW5nLCBKaW5IdWlFcmljDQo+ID4gPEppbkh1aUVyaWMuSHVhbmdAYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IFdvbmcsIEFsaWNlIDxTaGl3ZWkuV29u
Z0BhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4DQo+ID4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
OyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaA0KPiA+IDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFt
ZC5jb20+DQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGtmZDogZml4IG1lcyBzZXQg
c2hhZGVyIGRlYnVnZ2VyIHByb2Nlc3MNCj4gPiBtYW5hZ2VtZW50DQo+ID4NCj4gPiBbUHVibGlj
XQ0KPiA+DQo+ID4gRG8geW91IG1lYW4gU0VUX1NIQURFUl9ERUJVR0VSIGNhbiAgYmUgY2FsbGVk
IGJlZm9yZSBBRERfUVVFVUUgPw0KPiBJDQo+ID4gdGhpbmsgIGV2ZW4gaW4gdGhhdCAgc2l0dWF0
aW9uIE1FUyBzaG91bGQgc3RpbGwgYmUgYWJsZSB0byBoYW5kbGUgaXQNCj4gPiBhcyBsb25nIGFz
IE1FUyBhbHJlYWR5ICByZW1vdmUgdGhlIHByb2Nlc3MgY29udGV4dCBmcm9tIGl0cyBsaXN0ICwg
TUVTDQo+ID4gd2lsbCB0cmVhdCB0aGUgcHJvY2VzcyBjb250ZXh0IGFzIGEgbmV3IGl0ZW0uIEkg
c3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkNCj4gTUVTIGhhdmVuJ3QNCj4gPiBwdXJnZWQgdGhl
ICBwcm9jZXNzIGNvbnRleHQgZnJvbSB0aGUgbGlzdCBhZnRlciBwcm9jZXNzIHRlcm1pbmF0aW9u
IC4gICBXaWxsDQo+ID4gZGVidWcgcXVldWUgaXRzZWxmICBhbHNvIHVzZSB0aGUgYWRkL3JlbW92
ZSBxdWV1ZSBpbnRlcmZhY2UgIGFuZCAgaXMNCj4gPiBpdCBwb3NzaWJsZSB0aGUgZGVidWcgcXVl
dWUgaXRzZWxmIGZyb20gdGhlICBvbGQgcHJvY2VzcyAgc3RpbGwgbm90IGJlDQo+ID4gcmVtb3Zl
ZCA/DQo+DQo+IFNFVF9TSEFERVJfREVCVUdHRVIgY2FuIGJlIGNhbGxlZCBpbmRlcGVuZGVudGx5
IGZyb20gQUREX1FVRVVFLg0KPiBUaGUgcHJvY2VzcyBsaXN0IGlzIHVwZGF0ZWQgb24gZWl0aGVy
IG9uIFNFVF9TSEFERVJfREVCVUdHRVIgb3INCj4gQUREX1FVRVVFLg0KPiBlLmcuIHJ1bnRpbWVf
ZW5hYmxlIChzZXRfc2hhZGVyKSAtPiBhZGRfcXVldWUgLT4gcmVtb3ZlX3F1ZXVlIChsaXN0DQo+
IHB1cmdlZCkgLT4gcnVudGltZV9kaXNhYmxlIChzZXRfc2hhZGVyIHByb2Nlc3MgcmUtYWRkZWQp
IC0+IHByb2Nlc3MNCj4gdGVybWluYXRpb24gKHN0YWxlIGxpc3QpIG9yIGRlYnVnIGF0dGFjaCAo
c2V0X3NoYWRlcikgLT4gYWRkX3F1ZXVlIC0+DQo+IHJlbW92ZV9xdWV1ZSAobGlzdCBwdXJnZWQp
IC0+IGRlYnVnIGRldGFjaCAoc2V0X3NoYWRlciBwcm9jZXNzIHJlLWFkZGVkKSAtDQo+ID5wcm9j
ZXNzIHRlcm1pbmF0aW9uIChzdGFsZSBsaXN0KQ0KPg0KPiBNRVMgaGFzIG5vIGlkZWEgd2hhdCBw
cm9jZXNzIHRlcm1pbmF0aW9uIG1lYW5zLiAgVGhlIG5ldyBmbGFnIGlzIGEgcHJveHkNCj4gZm9y
IHRoaXMuDQo+IFRoZXJlIGFyZSByZWFzb25zIGZvciBwcm9jZXNzIHNldHRpbmdzIHRvIHRha2Ug
cGxhY2UgcHJpb3IgdG8gcXVldWUgYWRkDQo+IChkZWJ1Z2dlciwgZ2Z4MTEgY3dzciB3b3JrYXJv
dW5kLCBjb3JlIGR1bXAgZXRjIG5lZWQgdGhpcykuDQo+DQo+IEknbSBub3Qgc3VyZSB3aGF0IGtl
cm5lbC9kZWJ1ZyBxdWV1ZXMgaGF2ZSB0byBkbyB3aXRoIHRoaXMuDQo+IEJ5IHRoYXQgYXJndW1l
bnQsIHRoZSBsaXN0IHNob3VsZCBiZSBwdXJnZWQuDQo+DQo+IEpvbg0KPg0KPiA+DQo+ID4gU2hh
b3l1bi5saXUNCj4gPg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
S2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwg
RGVjZW1iZXIgMTIsIDIwMjMgNDo0OCBQTQ0KPiA+IFRvOiBMaXUsIFNoYW95dW4gPFNoYW95dW4u
TGl1QGFtZC5jb20+OyBIdWFuZywgSmluSHVpRXJpYw0KPiA+IDxKaW5IdWlFcmljLkh1YW5nQGFt
ZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBXb25nLCBBbGlj
ZSA8U2hpd2VpLldvbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeA0KPiA+IDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPjsgS2FzaXZpc3dhbmF0aGFuLCBIYXJpc2gNCj4gPiA8SGFyaXNoLkthc2l2
aXN3YW5hdGhhbkBhbWQuY29tPg0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRrZmQ6
IGZpeCBtZXMgc2V0IHNoYWRlciBkZWJ1Z2dlciBwcm9jZXNzDQo+ID4gbWFuYWdlbWVudA0KPiA+
DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+IEZyb206IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1kLmNvbT4NCj4gPiA+IFNlbnQ6
IFR1ZXNkYXksIERlY2VtYmVyIDEyLCAyMDIzIDQ6NDUgUE0NCj4gPiA+IFRvOiBLaW0sIEpvbmF0
aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT47IEh1YW5nLCBKaW5IdWlFcmljDQo+ID4gPiA8Smlu
SHVpRXJpYy5IdWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
PiA+IENjOiBXb25nLCBBbGljZSA8U2hpd2VpLldvbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxp
eA0KPiA+ID4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlz
aA0KPiA+ID4gPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNvbT4NCj4gPiA+IFN1YmplY3Q6
IFJFOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IGZpeCBtZXMgc2V0IHNoYWRlciBkZWJ1Z2dlciBwcm9j
ZXNzDQo+ID4gPiBtYW5hZ2VtZW50DQo+ID4gPg0KPiA+ID4gW1B1YmxpY10NCj4gPiA+DQo+ID4g
PiBTaG91bGRuJ3QgdGhlIGRyaXZlciBzaWRlICByZW1vdmUgYWxsIHRoZSByZW1haW5pbmcgIHF1
ZXVlcyBmb3IgdGhlDQo+ID4gPiBwcm9jZXNzIGR1cmluZyAgcHJvY2VzcyB0ZXJtaW5hdGlvbiA/
ICBJZiBhbGwgdGhlICBxdWV1ZXMgYmVlbg0KPiA+ID4gcmVtb3ZlZCBmb3IgdGhlIHByb2Nlc3Mg
LCAgTUVTIHNob3VsZCBwdXJnZSB0aGUgIHByb2Nlc3MgY29udGV4dA0KPiA+ID4gYXV0b21hdGlj
YWxseSAsIG90aGVyd2lzZSBpdCdzIGJ1ZyBpbnNpZGUgTUVTIC4NCj4gPg0KPiA+IFRoYXQncyBv
bmx5IGlmIHRoZXJlIHdlcmUgcXVldWVzIGFkZGVkIHRvIGJlZ2luIHdpdGguDQo+ID4NCj4gPiBK
b24NCj4gPg0KPiA+ID4NCj4gPiA+IFJlZ2FyZA0KPiA+ID4gU3NoYW95dW4ubGl1DQo+ID4gPg0K
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEtpbSwgSm9uYXRo
YW4gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KPiA+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIg
MTIsIDIwMjMgNDozMyBQTQ0KPiA+ID4gVG86IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1k
LmNvbT47IEh1YW5nLCBKaW5IdWlFcmljDQo+ID4gPiA8SmluSHVpRXJpYy5IdWFuZ0BhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IENjOiBXb25nLCBBbGljZSA8
U2hpd2VpLldvbmdAYW1kLmNvbT47IEt1ZWhsaW5nLCBGZWxpeA0KPiA+ID4gPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+OyBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaA0KPiA+ID4gPEhhcmlzaC5LYXNp
dmlzd2FuYXRoYW5AYW1kLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRr
ZmQ6IGZpeCBtZXMgc2V0IHNoYWRlciBkZWJ1Z2dlciBwcm9jZXNzDQo+ID4gPiBtYW5hZ2VtZW50
DQo+ID4gPg0KPiA+ID4gW1B1YmxpY10NCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IExpdSwgU2hhb3l1biA8U2hhb3l1bi5MaXVAYW1kLmNv
bT4NCj4gPiA+ID4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTIsIDIwMjMgNDowMCBQTQ0KPiA+
ID4gPiBUbzogSHVhbmcsIEppbkh1aUVyaWMgPEppbkh1aUVyaWMuSHVhbmdAYW1kLmNvbT47IEtp
bSwgSm9uYXRoYW4NCj4gPiA+ID4gPEpvbmF0aGFuLktpbUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gQ2M6IFdvbmcsIEFsaWNlIDxTaGl3ZWkuV29uZ0Bh
bWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4DQo+ID4gPiA+IDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PjsgS2FzaXZpc3dhbmF0aGFuLCBIYXJpc2gNCj4gPiA+ID4gPEhhcmlzaC5LYXNpdmlzd2FuYXRo
YW5AYW1kLmNvbT4NCj4gPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGtmZDogZml4
IG1lcyBzZXQgc2hhZGVyIGRlYnVnZ2VyDQo+ID4gPiA+IHByb2Nlc3MgbWFuYWdlbWVudA0KPiA+
ID4gPg0KPiA+ID4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gPiA+ID4N
Cj4gPiA+ID4gRG9lcyB0aGlzIHJlcXVpcmVzIHRoZSAgbmV3IE1FUyBGVyBmb3IgdGhpcyBwcm9j
ZXNzX2N0eF9mbHVzaA0KPiA+ID4gPiByZXF1aXJlbWVudCA/ICBDYW4gZHJpdmVyIHNpZGUgYWRk
IGxvZ2ljIHRvIGd1YXJhbnR5IHdoZW4gIGNhbGwNCj4gPiA+ID4gU0VUX1NIQURFUl9ERUJVR0dF
UiwgdGhlIHByb2Nlc3MgYWRkcmVzcyAgaXMgYWx3YXlzIHZhbGlkID8NCj4gPiA+DQo+ID4gPiBD
YWxsIHRvIGZsdXNoIG9uIG9sZCBmdyBpcyBhIE5PUCBzbyBpdCdzIGhhcm1sZXNzIGluIHRoYXQg
Y2FzZS4NCj4gPiA+IEZ1bGwgc29sdXRpb24gd2lsbCBzdGlsbCByZXF1aXJlIGEgbmV3IE1FUyB2
ZXJzaW9uIGFzIHRoaXMgaXMgYQ0KPiA+ID4gd29ya2Fyb3VuZCBvbiBjb3JuZXIgY2FzZXMgYW5k
IG5vdCBhIG5ldyBmZWF0dXJlIGkuZS4gd2UgY2FuJ3Qgc3RvcA0KPiA+ID4gUk9DbSBmcm9tIHJ1
bm5pbmcgb24gb2xkIGZ3Lg0KPiA+ID4gVGhlIHByb2Nlc3MgYWRkcmVzcyBpcyBhbHdheXMgdmFs
aWQgZnJvbSB0aGUgZHJpdmVyIHNpZGUuICBJdCdzIHRoZQ0KPiA+ID4gTUVTIHNpZGUgb2YgdGhp
bmdzIHRoYXQgZ2V0cyBzdGFsZSBhcyBtZW50aW9uZWQgaW4gdGhlIGRlc2NyaXB0aW9uDQo+ID4g
PiAocGFzc2VkIHZhbHVlIHRvIE1FUyBpcyByZXVzZWQgd2l0aCBuZXcgQk8gYnV0IE1FUyBkb2Vz
bid0IHJlZnJlc2gpLg0KPiA+ID4gaS5lLiBNRVMgYXV0byByZWZyZXNoZXMgaXQncyBwcm9jZXNz
IGxpc3QgYXNzdW1pbmcgcHJvY2VzcyBxdWV1ZXMNCj4gPiA+IHdlcmUgYWxsIGRyYWluZWQgYnV0
IGRyaXZlciBjYW4ndCBndWFyYW50ZWUgdGhhdA0KPiBTRVRfU0hBREVSX0RFQlVHR0VSDQo+ID4g
KHdoaWNoDQo+ID4gPiBhZGRzIHRvIE1FUydzIHByb2Nlc3MgbGlzdCkgd2lsbCBnZXQgY2FsbGVk
IGFmdGVyIHF1ZXVlcyBnZXQgYWRkZWQNCj4gPiA+IChpbiBmYWN0IGl0J3MgYSByZXF1aXJlbWVu
dHMgdGhhdCBpdCBjYW4gYmUgY2FsbGVkIGF0IGFueSB0aW1lKS4NCj4gPiA+IFdlIGNhbiBhdHRl
bXB0IHRvIGRlZmVyIGNhbGxzIHRoZXNlIGNhbGxzIGluIHRoZSBLRkQsIGNvbnNpZGVyaW5nIGFs
bA0KPiBjYXNlcy4NCj4gPiA+IEJ1dCB0aGF0IHdvdWxkIGJlIGEgbGFyZ2Ugc2hpZnQgaW4gZGVi
dWdnZXIvcnVudGltZV9lbmFibGUvS0ZEIGNvZGUsDQo+ID4gPiB3aGljaCBpcyBhbHJlYWR5IGNv
bXBsaWNhdGVkIGFuZCBjb3VsZCBnZXQgYnVnZ3kgcGx1cyBpdCB3b3VsZCBub3QNCj4gPiA+IGJl
IGludHVpdGl2ZSBhdCBhbGwgYXMgdG8gd2h5IHdlJ3JlIGRvaW5nIHRoaXMuDQo+ID4gPiBJIHRo
aW5rIGEgc2luZ2xlIGZsYWcgc2V0IHRvIGZsdXNoIE1FUyBvbiBwcm9jZXNzIHRlcm1pbmF0aW9u
IGlzIGENCj4gPiA+IHNpbXBsZXIgY29tcHJvbWlzZSB0aGF0IHNob3dzIHRoZSBsaW1pdGF0aW9u
IGluIGEgbW9yZSBvYnZpb3VzIHdheS4NCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPg0KPiA+
ID4gSm9uDQo+ID4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gUmVnYXJkcw0KPiA+ID4gPiBT
aGFveXVuLmxpdQ0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gPiA+ID4gRXJpYyBIdWFuZw0KPiA+ID4gPiBT
ZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxMiwgMjAyMyAxMjo0OSBQTQ0KPiA+ID4gPiBUbzogS2lt
LCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+OyBhbWQtDQo+ID4gPiA+IGdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+ID4gQ2M6IFdvbmcsIEFsaWNlIDxTaGl3ZWkuV29uZ0Bh
bWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4DQo+ID4gPiA+IDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PjsgS2FzaXZpc3dhbmF0aGFuLCBIYXJpc2gNCj4gPiA+ID4gPEhhcmlzaC5LYXNpdmlzd2FuYXRo
YW5AYW1kLmNvbT4NCj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGtmZDogZml4
IG1lcyBzZXQgc2hhZGVyIGRlYnVnZ2VyDQo+ID4gPiA+IHByb2Nlc3MgbWFuYWdlbWVudA0KPiA+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiAyMDIzLTEyLTExIDE2OjE2LCBKb25hdGhhbiBLaW0g
d3JvdGU6DQo+ID4gPiA+ID4gTUVTIHByb3ZpZGVzIHRoZSBkcml2ZXIgYSBjYWxsIHRvIGV4cGxp
Y2l0bHkgZmx1c2ggc3RhbGUgcHJvY2Vzcw0KPiA+ID4gPiA+IG1lbW9yeSB3aXRoaW4gdGhlIE1F
UyB0byBhdm9pZCBhIHJhY2UgY29uZGl0aW9uIHRoYXQgcmVzdWx0cyBpbg0KPiA+ID4gPiA+IGEg
ZmF0YWwgbWVtb3J5IHZpb2xhdGlvbi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdoZW4gU0VUX1NI
QURFUl9ERUJVR0dFUiBpcyBjYWxsZWQsIHRoZSBkcml2ZXIgcGFzc2VzIGEgbWVtb3J5DQo+ID4g
PiA+IGFkZHJlc3MNCj4gPiA+ID4gPiB0aGF0IHJlcHJlc2VudHMgYSBwcm9jZXNzIGNvbnRleHQg
YWRkcmVzcyBNRVMgdXNlcyB0byBrZWVwIHRyYWNrDQo+ID4gPiA+ID4gb2YgZnV0dXJlIHBlci1w
cm9jZXNzIGNhbGxzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTm9ybWFsbHksIE1FUyB3aWxsIHB1
cmdlIGl0cyBwcm9jZXNzIGNvbnRleHQgbGlzdCB3aGVuIHRoZSBsYXN0DQo+ID4gPiA+ID4gcXVl
dWUgaGFzIGJlZW4gcmVtb3ZlZC4gIFRoZSBkcml2ZXIsIGhvd2V2ZXIsIGNhbiBjYWxsDQo+ID4g
PiA+ID4gU0VUX1NIQURFUl9ERUJVR0dFUiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgYSBxdWV1ZSBo
YXMgYmVlbg0KPiA+IGFkZGVkDQo+ID4gPiBvciBub3QuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJ
ZiBTRVRfU0hBREVSX0RFQlVHR0VSIGhhcyBiZWVuIGNhbGxlZCB3aXRoIG5vIHF1ZXVlcyBhcyB0
aGUNCj4gPiA+ID4gPiBsYXN0IGNhbGwgcHJpb3IgdG8gcHJvY2VzcyB0ZXJtaW5hdGlvbiwgdGhl
IHBhc3NlZCBwcm9jZXNzDQo+ID4gPiA+ID4gY29udGV4dCBhZGRyZXNzIHdpbGwgc3RpbGwgcmVz
aWRlIHdpdGhpbiBNRVMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBhIG5ldyBwcm9jZXNzIGNh
bGwgdG8gU0VUX1NIQURFUl9ERUJVR0dFUiwgdGhlIGRyaXZlciBtYXkNCj4gZW5kDQo+ID4gPiB1
cA0KPiA+ID4gPiA+IHBhc3NpbmcgYW4gaWRlbnRpY2FsIHByb2Nlc3MgY29udGV4dCBhZGRyZXNz
IHZhbHVlIChiYXNlZCBvbg0KPiA+ID4gPiA+IHBlci1wcm9jZXNzIGdwdSBtZW1vcnkgYWRkcmVz
cykgdG8gTUVTIGJ1dCBpcyBub3cgcG9pbnRpbmcgdG8gYQ0KPiA+ID4gPiA+IG5ldyBhbGxvY2F0
ZWQgYnVmZmVyIG9iamVjdCBkdXJpbmcgS0ZEIHByb2Nlc3MgY3JlYXRpb24uICBTaW5jZQ0KPiA+
ID4gPiA+IHRoZSBNRVMgaXMgdW5hd2FyZSBvZiB0aGlzLCBhY2Nlc3Mgb2YgdGhlIHBhc3NlZCBh
ZGRyZXNzIHBvaW50cw0KPiA+ID4gPiA+IHRvIHRoZSBzdGFsZSBvYmplY3Qgd2l0aGluIE1FUyBh
bmQgdHJpZ2dlcnMgYSBmYXRhbCBtZW1vcnkgdmlvbGF0aW9uLg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gVGhlIHNvbHV0aW9uIGlzIGZvciBLRkQgdG8gZXhwbGljaXRseSBmbHVzaCB0aGUgcHJvY2Vz
cyBjb250ZXh0DQo+ID4gPiA+ID4gYWRkcmVzcyBmcm9tIE1FUyBvbiBwcm9jZXNzIHRlcm1pbmF0
aW9uLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTm90ZSB0aGF0IHRoZSBmbHVzaCBjYWxsIGFuZCB0
aGUgTUVTIGRlYnVnZ2VyIGNhbGxzIHVzZSB0aGUgc2FtZQ0KPiA+ID4gPiA+IE1FUyBpbnRlcmZh
Y2UgYnV0IGFyZSBzZXBhcmF0ZWQgYXMgS0ZEIGNhbGxzIHRvIGF2b2lkDQo+ID4gPiA+ID4gY29u
ZmxpY3Rpbmcgd2l0aCBlYWNoIG90aGVyLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSm9uYXRoYW4gS2ltIDxqb25hdGhhbi5raW1AYW1kLmNvbT4NCj4gPiA+ID4gPiBUZXN0
ZWQtYnk6IEFsaWNlIFdvbmcgPHNoaXdlaS53b25nQGFtZC5jb20+DQo+ID4gPiA+IFJldmlld2Vk
LWJ5OiBFcmljIEh1YW5nIDxqaW5odWllcmljLmh1YW5nQGFtZC5jb20+DQo+ID4gPiA+ID4gLS0t
DQo+ID4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMgICAg
ICAgfCAzMQ0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmggICAgICAgfCAxMCArKystLS0NCj4gPiA+
ID4gPiAgIC4uLi9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyAgICB8ICAx
ICsNCj4gPiA+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9tZXNfdjExX2FwaV9k
ZWYuaCB8ICAzICstDQo+ID4gPiA+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5jDQo+ID4gPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMNCj4gPiA+ID4gPiBpbmRleCBlNTQ0Yjgy
M2FiZjYuLmU5OGRlMjMyNTBkYyAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmMNCj4gPiA+ID4gPiBAQCAtOTE2LDYgKzkxNiwxMSBA
QCBpbnQNCj4gPiBhbWRncHVfbWVzX3NldF9zaGFkZXJfZGVidWdnZXIoc3RydWN0DQo+ID4gPiA+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiA+ID4gICAgICAgb3BfaW5wdXQub3AgPSBNRVNf
TUlTQ19PUF9TRVRfU0hBREVSX0RFQlVHR0VSOw0KPiA+ID4gPiA+ICAgICAgIG9wX2lucHV0LnNl
dF9zaGFkZXJfZGVidWdnZXIucHJvY2Vzc19jb250ZXh0X2FkZHIgPQ0KPiA+ID4gPiBwcm9jZXNz
X2NvbnRleHRfYWRkcjsNCj4gPiA+ID4gPiAgICAgICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVn
Z2VyLmZsYWdzLnUzMmFsbCA9IGZsYWdzOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICAv
KiB1c2UgYW1kZ3B1IG1lc19mbHVzaF9zaGFkZXJfZGVidWdnZXIgaW5zdGVhZCAqLw0KPiA+ID4g
PiA+ICsgICAgIGlmIChvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLmZsYWdzLnByb2Nlc3Nf
Y3R4X2ZsdXNoKQ0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ICAgICAgIG9wX2lucHV0LnNldF9zaGFkZXJfZGVidWdnZXIuc3Bp
X2dkYmdfcGVyX3ZtaWRfY250bCA9DQo+ID4gPiA+IHNwaV9nZGJnX3Blcl92bWlkX2NudGw7DQo+
ID4gPiA+ID4gICAgICAgbWVtY3B5KG9wX2lucHV0LnNldF9zaGFkZXJfZGVidWdnZXIudGNwX3dh
dGNoX2NudGwsDQo+ID4gPiA+IHRjcF93YXRjaF9jbnRsLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
c2l6ZW9mKG9wX2lucHV0LnNldF9zaGFkZXJfZGVidWdnZXIudGNwX3dhdGNoX2NudGwpKTsNCj4g
PiA+ID4gPiBAQCAtOTM1LDYgKzk0MCwzMiBAQCBpbnQNCj4gPiBhbWRncHVfbWVzX3NldF9zaGFk
ZXJfZGVidWdnZXIoc3RydWN0DQo+ID4gPiA+IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiA+
ID4gICAgICAgcmV0dXJuIHI7DQo+ID4gPiA+ID4gICB9DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAr
aW50IGFtZGdwdV9tZXNfZmx1c2hfc2hhZGVyX2RlYnVnZ2VyKHN0cnVjdCBhbWRncHVfZGV2aWNl
DQo+ID4gKmFkZXYsDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1aW50NjRfdCBwcm9jZXNzX2NvbnRleHRfYWRkcikgew0KPiA+ID4gPiA+ICsgICAgIHN0cnVj
dCBtZXNfbWlzY19vcF9pbnB1dCBvcF9pbnB1dCA9IHswfTsNCj4gPiA+ID4gPiArICAgICBpbnQg
cjsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgaWYgKCFhZGV2LT5tZXMuZnVuY3MtPm1p
c2Nfb3ApIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIERSTV9FUlJPUigibWVzIGZsdXNoIHNo
YWRlciBkZWJ1Z2dlciBpcyBub3QNCj4gPiBzdXBwb3J0ZWQhXG4iKTsNCj4gPiA+ID4gPiArICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiA+ICsgICAgIH0NCj4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gKyAgICAgb3BfaW5wdXQub3AgPSBNRVNfTUlTQ19PUF9TRVRfU0hBREVSX0RF
QlVHR0VSOw0KPiA+ID4gPiA+ICsgICAgIG9wX2lucHV0LnNldF9zaGFkZXJfZGVidWdnZXIucHJv
Y2Vzc19jb250ZXh0X2FkZHIgPQ0KPiA+ID4gPiBwcm9jZXNzX2NvbnRleHRfYWRkcjsNCj4gPiA+
ID4gPiArICAgICBvcF9pbnB1dC5zZXRfc2hhZGVyX2RlYnVnZ2VyLmZsYWdzLnByb2Nlc3NfY3R4
X2ZsdXNoID0NCj4gPiA+ID4gPiArIHRydWU7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICAg
IGFtZGdwdV9tZXNfbG9jaygmYWRldi0+bWVzKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAg
ICAgciA9IGFkZXYtPm1lcy5mdW5jcy0+bWlzY19vcCgmYWRldi0+bWVzLCAmb3BfaW5wdXQpOw0K
PiA+ID4gPiA+ICsgICAgIGlmIChyKQ0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgRFJNX0VSUk9S
KCJmYWlsZWQgdG8gc2V0X3NoYWRlcl9kZWJ1Z2dlclxuIik7DQo+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ICsgICAgIGFtZGdwdV9tZXNfdW5sb2NrKCZhZGV2LT5tZXMpOw0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiArICAgICByZXR1cm4gcjsNCj4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiAgIHN0YXRpYyB2b2lkDQo+ID4gPiA+ID4gICBhbWRncHVfbWVzX3JpbmdfdG9fcXVldWVf
cHJvcHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGRpZmYNCj4gPiA+ID4g
PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaA0KPiA+ID4g
PiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ID4gPiA+ID4g
aW5kZXggODk0YjliMTMzMDAwLi43ZDRmOTNmZWE5MzcgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21lcy5oDQo+ID4gPiA+ID4gQEAgLTI5
Niw5ICsyOTYsMTAgQEAgc3RydWN0IG1lc19taXNjX29wX2lucHV0IHsNCj4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgdWludDY0X3QgcHJvY2Vzc19jb250ZXh0X2FkZHI7DQo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgIHVuaW9uIHsNCj4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgew0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDY0X3Qgc2luZ2xlX21lbW9wIDogMTsNCj4gPiA+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpbmdsZV9hbHVf
b3AgOiAxOw0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDY0X3QgcmVzZXJ2ZWQ6IDMwOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3Qgc2luZ2xlX21lbW9wIDogMTsNCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmdsZV9hbHVfb3Ag
OiAxOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgcmVzZXJ2ZWQ6IDI5Ow0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgcHJvY2Vzc19jdHhfZmx1c2g6DQo+ID4gPiA+ID4gKyAxOw0K
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdTMyYWxsOw0KPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICB9IGZsYWdzOw0KPiA+ID4gPiA+IEBAIC0zNzQsNyArMzc1LDgg
QEAgaW50DQo+IGFtZGdwdV9tZXNfc2V0X3NoYWRlcl9kZWJ1Z2dlcihzdHJ1Y3QNCj4gPiA+ID4g
YW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCB1aW50MzJfdCAqdGNwX3dhdGNoX2NudGwsDQo+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZmxhZ3MsDQo+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCB0cmFwX2VuKTsNCj4gPiA+ID4gPiAtDQo+ID4gPiA+
ID4gK2ludCBhbWRncHVfbWVzX2ZsdXNoX3NoYWRlcl9kZWJ1Z2dlcihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZQ0KPiA+ICphZGV2LA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVpbnQ2NF90IHByb2Nlc3NfY29udGV4dF9hZGRyKTsNCj4gPiA+ID4gPiAgIGludCBhbWRncHVf
bWVzX2FkZF9yaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQNCj4gZ2FuZ19pZCwN
Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgaW50IHF1ZXVlX3R5cGUsIGludCBpZHgs
DQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfbWVzX2N0eF9k
YXRhICpjdHhfZGF0YSwgZGlmZg0KPiA+ID4gPiA+IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3Byb2Nlc3NfcXVldWVfbWFuYWdlci5jDQo+ID4gPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMNCj4gPiA+ID4g
PiBpbmRleCA3N2Y0OTMyNjJlMDUuLjhlNTVlNzhmY2U0ZSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19xdWV1ZV9tYW5hZ2VyLmMN
Cj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzc19x
dWV1ZV9tYW5hZ2VyLmMNCj4gPiA+ID4gPiBAQCAtODcsNiArODcsNyBAQCB2b2lkIGtmZF9wcm9j
ZXNzX2RlcXVldWVfZnJvbV9kZXZpY2Uoc3RydWN0DQo+ID4gPiA+IGtmZF9wcm9jZXNzX2Rldmlj
ZSAqcGRkKQ0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuOw0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gICAgICAgZGV2LT5kcW0tPm9wcy5wcm9jZXNzX3Rlcm1pbmF0aW9uKGRldi0+ZHFtLCAm
cGRkLT5xcGQpOw0KPiA+ID4gPiA+ICsgICAgIGFtZGdwdV9tZXNfZmx1c2hfc2hhZGVyX2RlYnVn
Z2VyKGRldi0+YWRldiwgcGRkLQ0KPiA+ID4gPiA+cHJvY19jdHhfZ3B1X2FkZHIpOw0KPiA+ID4g
PiA+ICAgICAgIHBkZC0+YWxyZWFkeV9kZXF1ZXVlZCA9IHRydWU7DQo+ID4gPiA+ID4gICB9DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL21lc192MTFfYXBpX2RlZi5oDQo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiA+ID4gPiBpbmRleCAxZmJmZDFhYTk4N2UuLmVj
NWI5YWI2N2M1ZSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2luY2x1ZGUvbWVzX3YxMV9hcGlfZGVmLmgNCj4gPiA+ID4gPiBAQCAtNTcyLDcgKzU3Miw4
IEBAIHN0cnVjdCBTRVRfU0hBREVSX0RFQlVHR0VSIHsNCj4gPiA+ID4gPiAgICAgICAgICAgICAg
IHN0cnVjdCB7DQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpbmds
ZV9tZW1vcCA6IDE7ICAvKg0KPiA+ID4gPiA+IFNRX0RFQlVHLnNpbmdsZV9tZW1vcA0KPiA+ID4g
Ki8NCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2luZ2xlX2FsdV9v
cCA6IDE7IC8qIFNRX0RFQlVHLnNpbmdsZV9hbHVfb3ANCj4gKi8NCj4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgcmVzZXJ2ZWQgOiAzMDsNCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgcmVzZXJ2ZWQgOiAyOTsNCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgdWludDMyX3QgcHJvY2Vzc19jdHhfZmx1c2ggOiAxOw0KPiA+ID4gPiA+
ICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4gPiAgICAgICAgICAgICAgIHVpbnQzMl90IHUzMmFs
bDsNCj4gPiA+ID4gPiAgICAgICB9IGZsYWdzOw0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4N
Cj4gPg0KPg0KPg0KDQo=
