Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A46780FFE
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Aug 2023 18:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1F10E543;
	Fri, 18 Aug 2023 16:13:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E770510E00E;
 Fri, 18 Aug 2023 16:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPBx1JHcMwNDGkj2nhkAF8CpYHIW4ENMNQq7KM+V8VqCHuQ5yvIpUmVsT9go41vczu1dKpcNgNExSc0RzEFcCz7JK/Odv06OAQpbPSJ02+MJ2/8+4F5+HlFfKz6rPcAE40iJNDqNcPs4QUDDEv7J2IWdc3rgHHwK0DPRM3H0J4EHwrJJMnCInE2akWRgVfaccwcVfLnwexO2LGfbVLqrIjE9qON4BNP07uCue1lplCh8TPeFKKhrVR7g6GwlhpAIgBJEuwI/cGS1u0hmtbhwy9t8xjifzm08HTgICnFY5chdEykE9bJ0SsH4Mmwcc5Ad2piu4QPG7/DzIVJPgZWJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ub6y0v5rNIbg85A0oX+ecRr8n6YFcu7dq9pdri8mIXQ=;
 b=D0ZdA9cIHmA19rgcaM2JgIJUCpldm/O//4rzZtJMbIED/uMu9AyCvdEb6lpFOryRt7vHnlmCS5T2NIkHkZ7cg0cZico1xu/QYBTxP4J9NtihrEs1IBcuN8QgtLQ5HcrkGnyBFAjeL0CPTSCDFgJVbHztyfK6n2UTo4P3Hmr1xSyHc6tAXQoso3Dx9dlvLF2Fwz1pYwIr5Y+210ACgM6cpzzq3ZTUNCX/pT2ZKTrSGDVr4BjLhU+uGxa6hT9bHupztTocHuYwYlVgZvcnPANn/25fCUC97JQoIaezKIod7Krpks/R6GTw4l1E/jUzyr3soeYR8hw3aTMBKWJCoE6Afw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub6y0v5rNIbg85A0oX+ecRr8n6YFcu7dq9pdri8mIXQ=;
 b=dMM6tUgLzYAM6Q2PKgWwOPO8flsPXpEzA3dsMGcTlGP29WO3tPCz7ev+pNCfCjnPRL9E6vMyw+2u+Vz5ImpjcsVg1KtCof3CklMJk5lXssuJdOAhzeH8SqZJTnEnsFULfj2dVhWmuVn4IzO2RDTi45MRab467f3EtdRm2dR7s4o=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 16:12:57 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::bcfa:7757:68bd:f905]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::bcfa:7757:68bd:f905%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 16:12:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob
 Herring <robh@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
 <kw@linux.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lukas
 Wunner <lukas@wunner.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 06/11] drm/radeon: Use RMW accessors for changing LNKCTL
Thread-Topic: [PATCH v5 06/11] drm/radeon: Use RMW accessors for changing
 LNKCTL
Thread-Index: AQHZuKclLd/hzG1i1UmQamiALj5wpa/wa+Yw
Date: Fri, 18 Aug 2023 16:12:57 +0000
Message-ID: <BL1PR12MB5144FF7542426AB3B4C66082F71BA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230717120503.15276-1-ilpo.jarvinen@linux.intel.com>
 <20230717120503.15276-7-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20230717120503.15276-7-ilpo.jarvinen@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=6bb2fc73-a784-49aa-bbd6-22f6032ebdce;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-18T16:11:16Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH8PR12MB7205:EE_
x-ms-office365-filtering-correlation-id: eff8f4ef-b680-4e6c-c033-08dba005fc83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8i86SyNv8nG7bP4iTqu9wbR9oi2Le8HjIY7NqaQIT+L7gukIfMB/pFT9Q4tuA/w+aDM5ybvb6CTIg1pFOhB6E2e5yNnXLN9xH+k/aZp/C9AngUrkyOesh3/WYjdsVWDknk/fvro/M2J4gICc0jAuzN/DUR1zdg2XM7yuNVkVhBRp6cTSa3E6NJFndnlA0wGvYa8rx15L973LU/CphwrBL4G6Lfjayk8MHQ/ctjj91qL3FRSNUOgGGeBPrT01LyL5lM7dJ8sHAhILhUYFdVi2t2grCbdwFJNG7Yr5plFzsmxTN/H0FTqr01CnTMOh1GxxtlKOJz0UUBWz4wawdcdiQL0mibjp4RiLcsvFpYHCA/nBtywJhb6bchCrU9jVg+mWCL6xJRdfbgRWbu/9DY44oEfJUMh4AHBRkTvLIybqMfyJJv37HzC0XvN2S2KyWzup1XP2Y+z4xaKoUjz6ekfswrzMmWm0Z+yoZlZBriepxml0aU+xj++jLbiR3g1aUxnwOFNKpqZIfXMVOPTWUr46jxWQ0c4pJtQdPnfF0HfPABGFwh6yJehssV76v4dmWGXAvYOvdMuD4A2G7fMrBLOChHVjn9/737jMSXn/+n/MggfEoJg9TGvm8drHsQ892NeU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(186009)(1800799009)(451199024)(33656002)(86362001)(55016003)(122000001)(921005)(66946007)(54906003)(64756008)(66446008)(66476007)(316002)(66556008)(478600001)(110136005)(76116006)(41300700001)(38100700002)(38070700005)(26005)(71200400001)(6506007)(7696005)(9686003)(53546011)(4326008)(52536014)(8676002)(5660300002)(8936002)(7416002)(2906002)(83380400001)(66574015);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjNqcUU4WjUzUDFOWE9XVHF2clpyOFdsamw1NHZOZ2s3T2RyOWllZktWR214?=
 =?utf-8?B?MjlVR05iNEc3WTBMZVpSRmdKUU5kVW5QT21tdUEzM3NKRDV3OTFKNzRxZzd6?=
 =?utf-8?B?bm01K1JDcVZVNWcxUS9VcGJzWTNGem1SN2lCMjN1RGo3TFVWR1FvZ0pWeDJi?=
 =?utf-8?B?NTJJRjF2UTdUSHZjMzhNc082bFo1VEFVMHQ0K3JQWFdwcjNrbkZ1R0h5bzZV?=
 =?utf-8?B?WmJkRlZhdnJiT3Y3MjR6RXphNldIWG9YVkFIK24yNXdnaER4ejRxdFRzZkg1?=
 =?utf-8?B?UDZyQnlFeG1wM3FKY1kyeE51KzkvUnJCR3BxSk1PWHNKTDUwbElrbVN2aEZq?=
 =?utf-8?B?MWk2THpwVU1Pc04zclRnNGl6ZjdLS0dUTUZTclFjUUx0dE0yUjUzQzFnRkp1?=
 =?utf-8?B?Q0VJRXIrN0xhRm81UmhLbklNWUlyWVkxNGp3RDdWeEtVS3EwVlN3MHhBVGxH?=
 =?utf-8?B?VWdpZVVSSzFKNytML3FKUUF2MFRHb0MyZjF3SS96ekcyRWRYYU1kSFdoM2w1?=
 =?utf-8?B?a3FJZDhwby92NHpIaG12N1lrMUtHemwxc3hhUW14SFdIM0srNjlLMWJZRTVF?=
 =?utf-8?B?U3J2eTdNZXlmWjMvNXRxcmFBSDRvM3d6eDR6ODZ6NlVWTHRHakpMUG9MNzZW?=
 =?utf-8?B?RnExQVRWeHphKzVqZ2NmYWVjbWUvQ013b1N3NnRYME1uaGVXY0RhMFlIYzhZ?=
 =?utf-8?B?cjJ1ekVyWEpqUUdkbDNHblZvYlYxa1pJaE9Laks4WnJTSXVadVBWTk5aOUw2?=
 =?utf-8?B?UjQweS8renA3YlFkZktKN3RhU2g3Ukd3and5UlgyVnlwUDlQd2x6VUt6NEIr?=
 =?utf-8?B?WVg4R3RYTy8wMjU3TFlVbTRZWHhjdVV1RGp4Snd2YUxJbm1hSGhMb05IL1BS?=
 =?utf-8?B?MDBaRDg3cWNlYzg1N3YvQVBRNkVZUFo1QU8yU3NuR2lYVzVkeitLZkhISWU2?=
 =?utf-8?B?SnBLYnZsSWtNQnNnMUppQ29zdkYyMFJseTg2SnhpTDlkZ3Q4UFRYaDBLTkMr?=
 =?utf-8?B?R1IxeGdCQVBrUkxlbldjYzgyR1EyTnlmUk4wQzhCMTNpMXd4d2xaOHFhN1ov?=
 =?utf-8?B?QlcyNXVsZVg0ZHpvSUtUOTEybkY1cW9FSm1qdEFwT3ViY29maHR3RjZ1KzZG?=
 =?utf-8?B?UElUZzl6UUJ4b0x2Qkh2d25acUg0QmExcE5YMkNURDUvZDdXZDhKRjdKWVQ4?=
 =?utf-8?B?TWd1MDQrYWFUZ3pIUXZ4a29DMDZwMENZQkhNWlRlSlBXYXlpb21SKzdRMnZI?=
 =?utf-8?B?MFhhcVpHcjhsNDdEck5qYTJDZ2hGdVRzWlp2Q3dhS3psRFB4WWJKeC84K0th?=
 =?utf-8?B?aTQ4NlVMcXhYMm1DaFE5N3FiZ20yWCtsc0FTMEdmSWtkRWkzNkc2U2dDRmZH?=
 =?utf-8?B?WmtMYkRwcWs1YlBzNlIyQzZha0U0a21NMGMrVk0wcTBaV3RQbWJuS25hbkdB?=
 =?utf-8?B?dFY1Q0NaejI0VXk1ZW94c2ZBNGRBV25DUnFiSDlMMEF4OUtTeDFiOGpaeDFF?=
 =?utf-8?B?bUdKYjFpTGt6SisvcnFjR29kUmFKSHpIYjNFSlFKRHRIdWRTVXdjV2h0M0tm?=
 =?utf-8?B?YnQ3ZTB0UnpMS29hMEZDNDRnSUFvVURHMFBMK3d1RER1c0lYME9JRHFzTUpP?=
 =?utf-8?B?d0NGbjFaeTFSemFXYkg2YzNTYngycjdmelZFbHg4MDFRcEkwek5aMDNhekVE?=
 =?utf-8?B?NitmUzVpcDYxNDBvYWhQRHUzMEUzbXczTFh4N0dVQ1MrU0xtQ2NMbzM3aGEw?=
 =?utf-8?B?VE94T3ovU3ZiaDNQNEprNzQ3a3VoU3g1QTZuaUpLK1ZBVk9DeGYwNWUzSk5X?=
 =?utf-8?B?dDBuZm9EbnM1eVl5d3lSU2wwWmJiN0h1bmtEb3g2eTR6KzVTbGxVb2F4aWJJ?=
 =?utf-8?B?ZHBXTWd4bE4xU1hHems1bU9CQklURG1uV3FYZUNEcnpwclJjQU1UemY0K0lu?=
 =?utf-8?B?U0UvbGx0SHBiZXBjaXBqL2RzODBQdTZFc1Q1ZGF3aDFaOGVsdURIM0RkM3Nj?=
 =?utf-8?B?NS9NWHc4MTBjNU9taWpZTDVRTnNEdUw3cVBnRlRnbmpvbjlxY1dibkZRNHZY?=
 =?utf-8?B?aEhWemR0elNMWkx0N2VqSFRRR0F2QzV1TnhHQVVQVUw3RTk2dmdaQmpET013?=
 =?utf-8?Q?6qx4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff8f4ef-b680-4e6c-c033-08dba005fc83
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 16:12:57.4672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTxORD6KU82hjHHHS3s/KVsh6HKAmwKB7ka/L5YJyG3bmvIR0ljIK4/Ug+011tO5edfseQznfq0cET3jhqup0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205
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
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?utf-8?B?Sm9uYXMgRHJlw59sZXI=?= <verdre@v0yd.nl>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
SnVseSAxNywgMjAyMyA4OjA1IEFNDQo+IFRvOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBC
am9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPjsgTG9yZW56bw0KPiBQaWVyYWxpc2kg
PGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PjsNCj4gS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+OyBFbW1hbnVlbCBHcnVt
YmFjaA0KPiA8ZW1tYW51ZWwuZ3J1bWJhY2hAaW50ZWwuY29tPjsgUmFmYWVsIEogLiBXeXNvY2tp
IDxyYWZhZWxAa2VybmVsLm9yZz47DQo+IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFp
bC5jb20+OyBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT47DQo+IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVy
DQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+
OyBEYXZpZA0KPiBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
Zw0KPiBDYzogRGVhbiBMdWljayA8ZGVhbi5sdWlja0Bjb3JuZWxpc25ldHdvcmtzLmNvbT47IEpv
bmFzIERyZcOfbGVyDQo+IDx2ZXJkcmVAdjB5ZC5ubD47IElscG8gSsOkcnZpbmVuIDxpbHBvLmph
cnZpbmVuQGxpbnV4LmludGVsLmNvbT47DQo+IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogW1BBVENIIHY1IDA2LzExXSBkcm0vcmFkZW9uOiBVc2UgUk1XIGFjY2Vzc29ycyBmb3Ig
Y2hhbmdpbmcNCj4gTE5LQ1RMDQo+DQo+IERvbid0IGFzc3VtZSB0aGF0IG9ubHkgdGhlIGRyaXZl
ciB3b3VsZCBiZSBhY2Nlc3NpbmcgTE5LQ1RMLiBBU1BNIHBvbGljeQ0KPiBjaGFuZ2VzIGNhbiB0
cmlnZ2VyIHdyaXRlIHRvIExOS0NUTCBvdXRzaWRlIG9mIGRyaXZlcidzIGNvbnRyb2wuDQo+IEFu
ZCBpbiB0aGUgY2FzZSBvZiB1cHN0cmVhbSBicmlkZ2UsIHRoZSBkcml2ZXIgZG9lcyBub3QgZXZl
biBvd24gdGhlIGRldmljZQ0KPiBpdCdzIGNoYW5naW5nIHRoZSByZWdpc3RlcnMgZm9yLg0KPg0K
PiBVc2UgUk1XIGNhcGFiaWxpdHkgYWNjZXNzb3JzIHdoaWNoIGRvIHByb3BlciBsb2NraW5nIHRv
IGF2b2lkIGxvc2luZw0KPiBjb25jdXJyZW50IHVwZGF0ZXMgdG8gdGhlIHJlZ2lzdGVyIHZhbHVl
Lg0KPg0KPiBGaXhlczogOGE3Y2QyNzY3OWQwICgiZHJtL3JhZGVvbi9jaWs6IGFkZCBzdXBwb3J0
IGZvciBwY2llIGdlbjEvMi8zDQo+IHN3aXRjaGluZyIpDQo+IEZpeGVzOiBiOWQzMDVkZmI2NmMg
KCJkcm0vcmFkZW9uOiBpbXBsZW1lbnQgcGNpZSBnZW4yLzMgc3VwcG9ydCBmb3IgU0kiKQ0KPiBT
dWdnZXN0ZWQtYnk6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVyLmRlPg0KPiBTaWduZWQtb2Zm
LWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQoNCkZvciB0aGlzIGFuZCB0aGUgYW1kZ3B1IHBhdGNo
Og0KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCkkn
bSBub3Qgc3VyZSBpZiB0aGlzIGlzIHN0YWJsZSBtYXRlcmlhbCBob3dldmVyLiAgSXMgdGhlcmUg
c29tZSBpc3N1ZSB0b2RheT8NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9j
aWsuYyB8IDM2ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3NpLmMgIHwgMzcgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9u
cygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMNCj4gaW5kZXggNTgxOTczN2MyMWM2Li5hNmYzYzgx
MWNlYjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYw0KPiBAQCAtOTUzNCwxNyArOTUzNCw4IEBA
IHN0YXRpYyB2b2lkIGNpa19wY2llX2dlbjNfZW5hYmxlKHN0cnVjdA0KPiByYWRlb25fZGV2aWNl
ICpyZGV2KQ0KPiAgICAgICAgICAgICAgICAgICAgICAgdTE2IGJyaWRnZV9jZmcyLCBncHVfY2Zn
MjsNCj4gICAgICAgICAgICAgICAgICAgICAgIHUzMiBtYXhfbHcsIGN1cnJlbnRfbHcsIHRtcDsN
Cj4NCj4gLSAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJpbGl0eV9yZWFkX3dvcmQocm9v
dCwgUENJX0VYUF9MTktDVEwsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZicmlkZ2VfY2ZnKTsNCj4gLSAgICAgICAgICAgICAgICAgICAgIHBjaWVf
Y2FwYWJpbGl0eV9yZWFkX3dvcmQocmRldi0+cGRldiwNCj4gUENJX0VYUF9MTktDVEwsDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZncHVfY2ZnKTsN
Cj4gLQ0KPiAtICAgICAgICAgICAgICAgICAgICAgdG1wMTYgPSBicmlkZ2VfY2ZnIHwgUENJX0VY
UF9MTktDVExfSEFXRDsNCj4gLSAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJpbGl0eV93
cml0ZV93b3JkKHJvb3QsIFBDSV9FWFBfTE5LQ1RMLA0KPiB0bXAxNik7DQo+IC0NCj4gLSAgICAg
ICAgICAgICAgICAgICAgIHRtcDE2ID0gZ3B1X2NmZyB8IFBDSV9FWFBfTE5LQ1RMX0hBV0Q7DQo+
IC0gICAgICAgICAgICAgICAgICAgICBwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29yZChyZGV2LT5w
ZGV2LA0KPiBQQ0lfRVhQX0xOS0NUTCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRtcDE2KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgIHBjaWVf
Y2FwYWJpbGl0eV9zZXRfd29yZChyb290LCBQQ0lfRVhQX0xOS0NUTCwNCj4gUENJX0VYUF9MTktD
VExfSEFXRCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICBwY2llX2NhcGFiaWxpdHlfc2V0X3dv
cmQocmRldi0+cGRldiwNCj4gUENJX0VYUF9MTktDVEwsDQo+ICtQQ0lfRVhQX0xOS0NUTF9IQVdE
KTsNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgIHRtcCA9IFJSRUczMl9QQ0lFX1BPUlQoUENJ
RV9MQ19TVEFUVVMxKTsNCj4gICAgICAgICAgICAgICAgICAgICAgIG1heF9sdyA9ICh0bXAgJiBM
Q19ERVRFQ1RFRF9MSU5LX1dJRFRIX01BU0spDQo+ID4+IExDX0RFVEVDVEVEX0xJTktfV0lEVEhf
U0hJRlQ7IEBAIC05NTkxLDIxICs5NTgyLDE0IEBAIHN0YXRpYw0KPiB2b2lkIGNpa19wY2llX2dl
bjNfZW5hYmxlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQ0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtc2xlZXAoMTAwKTsNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogbGlua2N0bCAqLw0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2ll
X2NhcGFiaWxpdHlfcmVhZF93b3JkKHJvb3QsDQo+IFBDSV9FWFBfTE5LQ1RMLA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ0bXAxNik7
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRtcDE2ICY9IH5QQ0lfRVhQX0xOS0NU
TF9IQVdEOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0bXAxNiB8PSAoYnJpZGdl
X2NmZyAmDQo+IFBDSV9FWFBfTE5LQ1RMX0hBV0QpOw0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29yZChyb290LA0KPiBQQ0lfRVhQX0xOS0NU
TCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdG1wMTYpOw0KPiAtDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWVf
Y2FwYWJpbGl0eV9yZWFkX3dvcmQocmRldi0+cGRldiwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfRVhQX0xOS0NUTCwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdG1w
MTYpOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0bXAxNiAmPSB+UENJX0VYUF9M
TktDVExfSEFXRDsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdG1wMTYgfD0gKGdw
dV9jZmcgJg0KPiBQQ0lfRVhQX0xOS0NUTF9IQVdEKTsNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3dyaXRlX3dvcmQocmRldi0+cGRldiwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0VY
UF9MTktDVEwsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHRtcDE2KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNp
ZV9jYXBhYmlsaXR5X2NsZWFyX2FuZF9zZXRfd29yZChyb290LA0KPiBQQ0lfRVhQX0xOS0NUTCwN
Cj4gKw0KPiBQQ0lfRVhQX0xOS0NUTF9IQVdELA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyaWRnZV9jZmcgJg0KPiAr
DQo+IFBDSV9FWFBfTE5LQ1RMX0hBV0QpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3JkKHJkZXYtDQo+ID5wZGV2LCBQQ0lf
RVhQX0xOS0NUTCwNCj4gKw0KPiBQQ0lfRVhQX0xOS0NUTF9IQVdELA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwdV9j
ZmcgJg0KPiArDQo+IFBDSV9FWFBfTE5LQ1RMX0hBV0QpOw0KPg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAvKiBsaW5rY3RsMiAqLw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwY2llX2NhcGFiaWxpdHlfcmVhZF93b3JkKHJvb3QsDQo+IFBDSV9FWFBfTE5LQ1RMMiwg
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vc2kuYyBpbmRleCA4ZDVlNGIyNTYwOWQuLmE5MTAxMjQ0N2I1Ng0KPiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2kuYw0KPiBAQCAtNzEzMSwxNyArNzEzMSw4IEBAIHN0YXRpYyB2b2lk
IHNpX3BjaWVfZ2VuM19lbmFibGUoc3RydWN0DQo+IHJhZGVvbl9kZXZpY2UgKnJkZXYpDQo+ICAg
ICAgICAgICAgICAgICAgICAgICB1MTYgYnJpZGdlX2NmZzIsIGdwdV9jZmcyOw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgdTMyIG1heF9sdywgY3VycmVudF9sdywgdG1wOw0KPg0KPiAtICAgICAg
ICAgICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChyb290LCBQQ0lfRVhQX0xO
S0NUTCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JmJyaWRnZV9jZmcpOw0KPiAtICAgICAgICAgICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3Jl
YWRfd29yZChyZGV2LT5wZGV2LA0KPiBQQ0lfRVhQX0xOS0NUTCwNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmdwdV9jZmcpOw0KPiAtDQo+IC0gICAg
ICAgICAgICAgICAgICAgICB0bXAxNiA9IGJyaWRnZV9jZmcgfCBQQ0lfRVhQX0xOS0NUTF9IQVdE
Ow0KPiAtICAgICAgICAgICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3dyaXRlX3dvcmQocm9v
dCwgUENJX0VYUF9MTktDVEwsDQo+IHRtcDE2KTsNCj4gLQ0KPiAtICAgICAgICAgICAgICAgICAg
ICAgdG1wMTYgPSBncHVfY2ZnIHwgUENJX0VYUF9MTktDVExfSEFXRDsNCj4gLSAgICAgICAgICAg
ICAgICAgICAgIHBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKHJkZXYtPnBkZXYsDQo+IFBDSV9F
WFBfTE5LQ1RMLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdG1wMTYpOw0KPiArICAgICAgICAgICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3Nl
dF93b3JkKHJvb3QsIFBDSV9FWFBfTE5LQ1RMLA0KPiBQQ0lfRVhQX0xOS0NUTF9IQVdEKTsNCj4g
KyAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJpbGl0eV9zZXRfd29yZChyZGV2LT5wZGV2
LA0KPiBQQ0lfRVhQX0xOS0NUTCwNCj4gK1BDSV9FWFBfTE5LQ1RMX0hBV0QpOw0KPg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgdG1wID0gUlJFRzMyX1BDSUUoUENJRV9MQ19TVEFUVVMxKTsNCj4g
ICAgICAgICAgICAgICAgICAgICAgIG1heF9sdyA9ICh0bXAgJiBMQ19ERVRFQ1RFRF9MSU5LX1dJ
RFRIX01BU0spDQo+ID4+IExDX0RFVEVDVEVEX0xJTktfV0lEVEhfU0hJRlQ7IEBAIC03MTg4LDIy
ICs3MTc5LDE0IEBAIHN0YXRpYw0KPiB2b2lkIHNpX3BjaWVfZ2VuM19lbmFibGUoc3RydWN0IHJh
ZGVvbl9kZXZpY2UgKnJkZXYpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zbGVl
cCgxMDApOw0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBsaW5rY3RsICov
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJpbGl0eV9yZWFkX3dv
cmQocm9vdCwNCj4gUENJX0VYUF9MTktDVEwsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRtcDE2KTsNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdG1wMTYgJj0gflBDSV9FWFBfTE5LQ1RMX0hBV0Q7DQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHRtcDE2IHw9IChicmlkZ2VfY2ZnICYNCj4gUENJX0VYUF9M
TktDVExfSEFXRCk7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJp
bGl0eV93cml0ZV93b3JkKHJvb3QsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9FWFBfTE5LQ1RMLA0KPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0bXAxNik7DQo+IC0N
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3JlYWRfd29y
ZChyZGV2LT5wZGV2LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBDSV9FWFBfTE5LQ1RMLA0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ0bXAxNik7DQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRtcDE2ICY9IH5QQ0lfRVhQX0xOS0NUTF9IQVdEOw0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0bXAxNiB8PSAoZ3B1X2NmZyAmDQo+IFBDSV9FWFBf
TE5LQ1RMX0hBV0QpOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2llX2NhcGFi
aWxpdHlfd3JpdGVfd29yZChyZGV2LT5wZGV2LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfRVhQX0xOS0NUTCwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdG1wMTYp
Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2llX2NhcGFiaWxpdHlfY2xlYXJf
YW5kX3NldF93b3JkKHJvb3QsDQo+IFBDSV9FWFBfTE5LQ1RMLA0KPiArDQo+IFBDSV9FWFBfTE5L
Q1RMX0hBV0QsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJpZGdlX2NmZyAmDQo+ICsNCj4gUENJX0VYUF9MTktDVExf
SEFXRCk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJpbGl0eV9j
bGVhcl9hbmRfc2V0X3dvcmQocmRldi0NCj4gPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLA0KPiArDQo+
IFBDSV9FWFBfTE5LQ1RMX0hBV0QsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3B1X2NmZyAmDQo+ICsNCj4gUENJX0VY
UF9MTktDVExfSEFXRCk7DQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGxp
bmtjdGwyICovDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaWVfY2FwYWJpbGl0
eV9yZWFkX3dvcmQocm9vdCwNCj4gUENJX0VYUF9MTktDVEwyLA0KPiAtLQ0KPiAyLjMwLjINCg0K
